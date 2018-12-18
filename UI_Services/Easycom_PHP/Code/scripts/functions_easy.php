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

function easy_addlibl($libraries) {
    $curlibl = "";
    $out = array("usrlibl" => 'curlibl');
    $in = array("libl" => $curlibl);
    // get current librarylist
    if (!i5_command("rtvjoba", array(), $out))
        die("Could not retrieve current librarylist:" . i5_errormsg());
    // add our libraries to the librarylist
    $curlibl .= " " . implode(" ", $libraries);
    // if library list already set a CPF2184 message will be generated, treat as warning and by pass. 
    if (!i5_command("chglibl", $in)) {
        if (i5_errormsg() != 'CPF2184')
            echo("Could not change current librarylist:" . i5_errormsg());
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
    if ($_SESSION['ConnectionID'] > 0) {
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
                easy_addlibl($addlibl, $conn);
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
            $_SESSION['ErrMsg'] = "Connection Failed to " . $server ."(" .$SESSION['usr'] ."-" .$_SESSION['pwd'] .") reason " . i5_errormsg();
            // send back to the sign on screen 
            $_SESSION['ConnectionID'] = 0;
            header("Location: ../index.php");
            exit(-1);
        }
        return -1;
    } else {
        // add the library list
        $_SESSION['server'] = $server;
        easy_addlibl($addlibl, $conn);
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
