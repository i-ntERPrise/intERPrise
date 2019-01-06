<?php

/*
 * Copyright 2018 chrish.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Function easy_addlibl()
 * Purpose: add library to library list
 * @param 
 *      type $libraries
 *      type $conn
 * @return int
 */

function easy_addlibl($library) {
    $curlibl = "";
    $out = array("usrlibl" => 'curlibl');
    // get current librarylist
    if (!i5_command("rtvjoba", array(), $out)) {
        die("Could not retrieve current librarylist:" . i5_errormsg());
    }
    // check if already added
    $set = 0;
    $libs = explode(" ", $curlibl);
    foreach ($libs as $lib) {
        if ($lib == $library) {
            $set = 1;
        }
    }
    if ($set != 1) {
        // add our libraries to the librarylist
        $cmd = "ADDLIBLE LIB(" .$library .")";
        // if library list already set a CPF2184 message will be generated, treat as warning and by pass. 
        if (!i5_remotecmd($cmd)) {
            if (i5_errormsg() != 'CPF2103')
                echo("Could not add library list entry:" . i5_errormsg());
        }
    }
    return 1;
}

/**
 * Function connect()
 * Purpose: Connect to the IBM i via Easycom
 * @param 
 *      connection
 * @return int
 */
function connect(&$conn) {
    $conId = 0;
    if (isset($_SESSION['ConnectionID']) && $_SESSION['ConnectionID'] > 0) {
        $conId = $_SESSION['ConnectionID'];
    }
    if ($_SESSION['server'] != "") {
        $server = $_SESSION['server'];
    }
    $addlibl = $_SESSION['install_lib'];
    // options array for the private connection
    $options = array(I5_OPTIONS_PRIVATE_CONNECTION => $conId, I5_OPTIONS_IDLE_TIMEOUT => $_SESSION['timeout'], I5_OPTIONS_JOBNAME => 'IERPSVR');
    $conn = i5_pconnect($server, $_SESSION['usr'], $_SESSION['pwd'], $options);
    // if failed
    if (is_bool($conn) && $conn == FALSE) {
        $errorTab = i5_error();
        if ($errorTab['cat'] == 9 && $errorTab['num'] == 285) {
            $options[I5_OPTIONS_PRIVATE_CONNECTION] = 0;
            // connect to the system       			
            $conn = i5_pconnect($_SESSION['server'], $_SESSION['usr'], $_SESSION['pwd'], $options);
            if (is_bool($conn) && $conn == FALSE) {
                $errorTab = i5_error();
                $_SESSION['ConnectionID'] = 0;
                $_SESSION['ErrMsg'] = "Failed to connect";
                return -1;
            } else {
                // add the library list
                easy_addlibl($addlibl);
                $ret = i5_get_property(I5_PRIVATE_CONNECTION, $conn);
                if (is_bool($ret) && $ret == FALSE) {
                    $_SESSION['ErrMsg'] = "Failed to retrieve connection ID " . i5_errormsg();
                    $_SESSION['ConnectionID'] = 0;
                    header("Location: ../index.php");
                    exit(-1);
                } else {
                    $_SESSION['ConnectionID'] = $ret;
                }
            }
        } else {
            //set the error message
            $_SESSION['ErrMsg'] = "Connection Failed to " . $server ."(" .$_SESSION['usr'] ."-" .$_SESSION['pwd'] .") reason " . i5_errormsg();
            // send back to the sign on screen 
            $_SESSION['ConnectionID'] = 0;
            header("Location: ../index.php");
            exit(-1);
        }
        return -1;
    } else {
        // add the library list
        $_SESSION['server'] = $server;
        easy_addlibl($addlibl);
        $ret = i5_get_property(I5_PRIVATE_CONNECTION, $conn);
        if (is_bool($ret) && $ret == FALSE) {
            $_SESSION['ErrMsg'] = "Failed to retrieve connection ID " . i5_errormsg() . " " . $_SESSION['usr'] . " " . $_SESSION['pwd'];
            $_SESSION['ConnectionID'] = 0;
            return -1;
        } else {
            $_SESSION['ConnectionID'] = $ret;
        }
    }
    return 1;
}

/**
 * Function dsp_cust_list()
 * Purpose: Show a list of customers
 * @param 
 *      type $conn
 * @return int
 */

function dsp_cust_list($conn) {
    $query = "SELECT CUSTNO,CUSNME,ADRLN1,PHONEN,REPCDE FROM IRPEXP/CUSMSTF";
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    // check for zero records
    if (i5_num_rows($result) === 0) {
        echo("<tr><td colspan='5' style='text-align:center'>No Customer Records found</td></tr>");
        i5_free_query($result);
        return 0;
    }
    while($rec = i5_fetch_assoc($result)) {
        echo("<tr><td>" .$rec['CUSTNO'] ."</td><td>" .$rec['CUSNME'] ."</td><td>" .$rec['ADRLN1'] ."</td><td>" .$rec['PHONEN'] ."</td><td>" .$rec['REPCDE'] ."</td></tr>");
    }
    i5_free_query($result);
    return 1;
}

/**
 * Function dsp_rep_list()
 * Purpose: Show a list of Sales Reps
 * @param 
 *      type $conn
 * @return int
 */

function dsp_rep_list($conn) {
    $query = "SELECT REPCDE,REPNME,CELLNO,COMMPC FROM IRPEXP/REPMSTF";
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    // check for zero records
    if (i5_num_rows($result) === 0) {
        echo("<tr><td colspan='5' style='text-align:center'>No Sales Rep Records found</td></tr>");
        i5_free_query($result);
        return 0;
    }
    while($rec = i5_fetch_assoc($result)) {
        echo("<tr><td>" .$rec['REPCDE'] ."</td><td>" .$rec['REPNME'] ."</td><td>" .$rec['CELLNO'] ."</td><td>" .$rec['COMMPC'] ."</td></tr>");
    }
    i5_free_query($result);
    return 1;
}

/**
 * Function dsp_inv_list()
 * Purpose: Show a list of invoices
 * @param 
 *      type $conn
 * @return int
 */

function dsp_inv_list($conn) {
    $query = "SELECT CUSTNO,INVNO,INVDTE,INVTOT FROM IRPEXP/INVHDRF";
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    // check for zero records
    if (i5_num_rows($result) === 0) {
        echo("<tr><td colspan='5' style='text-align:center'>No Invoice Records found</td></tr>");
        i5_free_query($result);
        return 0;
    }
    while($rec = i5_fetch_assoc($result)) {
        echo("<tr><td>" .$rec['CUSTNO'] ."</td><td>" .$rec['INVNO'] ."</td><td>" .$rec['INVDTE'] ."</td><td>" .$rec['INVTOT'] ."</td></tr>");
    }
    i5_free_query($result);
    return 1;
}

/**
 * Function dsp_prd_list()
 * Purpose: Show a list of products
 * @param 
 *      type $conn
 * @return int
 */

function dsp_prd_list($conn) {
    $query = "SELECT PRDCDE,DESCR,PRDPRICE FROM IRPEXP/PRDMSTF";
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    // check for zero records
    if (i5_num_rows($result) === 0) {
        echo("<tr><td colspan='5' style='text-align:center'>No Product Records found</td></tr>");
        i5_free_query($result);
        return 0;
    }
    while($rec = i5_fetch_assoc($result)) {
        echo("<tr><td>" .$rec['PRDCDE'] ."</td><td>" .$rec['DESC'] ."</td><td>" .$rec['PRDPRICE'] ."</td></tr>");
    }
    i5_free_query($result);
    return 1;
}