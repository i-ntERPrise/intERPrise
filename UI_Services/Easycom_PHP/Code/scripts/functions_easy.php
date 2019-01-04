<?php

/* Copyright © 2017, Shield Advanced Solutions Ltd
  All rights reserved.
  http://www.shieldadvanced.com/

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:

  - Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.

  - Neither the name of the Shield Advanced Solutions, nor the names of its
  contributors may be used to endorse or promote products
  derived from this software without specific prior written
  permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES INCLUDING,
  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE.
 */

// need to access session variables
//session_start();
/*
 * Function add_to_library_list() 
 * add the install library to the library list
 * @parms
 *      libraries to add to the library list
 *      connection to use
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

/*
 * function easy connect() 
 * To initiate a persistent connection to the IBM i via Easycom functions
 * and add the installed library list entry
 * @parms
 *      the connection resource to set
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
    $options = array(I5_OPTIONS_PRIVATE_CONNECTION => $conId, I5_OPTIONS_IDLE_TIMEOUT => $_SESSION['timeout'], I5_OPTIONS_JOBNAME => 'CRMSVR');
    //$options = array(I5_OPTIONS_IDLE_TIMEOUT => $_SESSION['timeout'], I5_OPTIONS_JOBNAME => 'CRMSVR');
    // connect persistent
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
            $_SESSION['ErrMsg'] = "Connection Failed to " . $server . " reason " . i5_errormsg();
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

/*
 * function get_quote_num() 
 * Return the current quote number and increment the data area
 * @parms
 *      the connection resource to use
 */

function get_quote_num(&$conn) {
    // get the next quote number
    $ret = i5_data_area_read("$_SESSION[install_lib]/QUOTENUM", 1, -1);
    if ($ret < 0) {
        $_SESSION['ErrMsg'] = "i5_data_area_read error : " . i5_errormsg();
        return;
    }
    $quote_num = (int) $ret;
    //echo($quote_num);
    $ret++;
    $ret = i5_data_area_write("$_SESSION[install_lib]/QUOTENUM", $ret);
    if (!$ret) {
        $_SESSION['ErrMsg'] = "i5_data_area_write error : " . i5_errormsg() . E_USER_ERROR;
        return;
    }
    return $quote_num;
}

/*
 * function get_contact_num() 
 * Return the current contact number and increment the data area
 * @parms
 *      the connection resource to use
 */

function get_contact_num(&$conn) {
    // dummy display
    //return "12345";
    // get the next quote number
    $ret = i5_data_area_read("$_SESSION[install_lib]/CONTACTNUM", 1, -1);
    if ($ret < 0) {
        $_SESSION['ErrMsg'] = "i5_data_area_read error : " . i5_errormsg();
        return;
    }
    $contact_num = (int) $ret;
    //echo($quote_num);
    $ret++;
    $ret = i5_data_area_write("$_SESSION[install_lib]/CONTACTNUM", $ret);
    if (!$ret) {
        $_SESSION['ErrMsg'] = "i5_data_area_write error : " . i5_errormsg() . E_USER_ERROR;
        return;
    }
    return $contact_num;
}

/*
 * function dsp_cust() 
 * Display the customer information
 * @parms
 *      the connection resource to use
 */

function dsp_cust(&$conn, $id) {
    $page = basename($_SERVER['PHP_SELF']);
    // get the customer information from the DB
    $cust_sts = array('A' => 'Active', 'I' => 'InActive', 'O' => 'On Hold');
    $cust_rating = array('1' => 'Very Poor', '2' => 'Poor', '3' => 'Fair', '4' => 'Good', '5' => 'Excellent');
    $query = "SELECT a.STATUS,a.NAME,a.ADDR_1,a.ADDR_2,a.ADDR_3,a.CITY,a.STATE,a.COUNTRY,a.ZIPCODE,a.TEL_1,a.LAT,a.LNG,a.CUST_00001,a.INST,a.DIST"
            . " FROM $_SESSION[install_lib]/CUSTDETS as a WHERE  a.CUST_ID=" . $id;
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    $rec = i5_fetch_assoc($result);
    i5_free_query($result);
    echo("<input type='hidden' id='custName' value='$rec[NAME]' />");
    echo("<div class='col'><h2>" . $rec['NAME'] . "</h2>");
    echo($rec['ADDR_1'] . "<br />");
    if ($rec['ADDR_2'] != '') {
        echo($rec['ADDR_2'] . "<br />");
    }
    if ($rec['ADDR_3'] != '') {
        echo($rec['ADDR_3'] . "<br />");
    }
    echo($rec['CITY'] . "<br />" . $rec['STATE'] . "<br />");
    if ($rec['COUNTRY'] != '') {
        echo($rec['COUNTRY'] . "<br />");
    }
    echo($rec['ZIPCODE'] . "<br />Tel No : " . $rec['TEL_1'] . "<br />");
    if ($page === 'dspCustomer.php') {
        echo("<strong>Status : " . $cust_sts[$rec['STATUS']] . "</strong><br />");
        // show the customer rating     
        if ($rec['CUST_00001'] === 0) {
            echo("<strong>Rating : Not Rated.</strong><br />");
        } else {
            echo("<strong>Rating : " . $cust_rating[$rec['CUST_00001']] . "</strong><br />");
        }
        if ($rec['INST'] === 'Y') {
            echo("<strong>Designated Installer.</strong><br />");
        }
        echo("<br /><a class='btn rmv_btn' href='updCustomer.php?id=" . $_REQUEST['id'] . "' target='blank'>Update</a>");
    }
    echo("</div>");
    $lat = $rec['LAT'];
    $lng = $rec['LNG'];
    $file_name = "images/maps/" . $id . ".jpeg";
    // get the geocode if no lat lng
    if ($rec['LAT'] == 0.0 || $rec['LNG'] == 0.0) {
        //form the address
        $address = $rec['ADDR_1'];
        if ($rec['ADDR_2'] !== '') {
            $address .= " " . $rec['ADDR_2'];
        }
        if ($rec['ADDR_3'] !== '') {
            $address .= " " . $rec['ADDR_3'];
        }
        $address .= " " . $rec['CITY'] . ", " . $rec['STATE'];
        if ($rec['COUNTRY'] !== '') {
            $address .= ", " . $rec['COUNTRY'];
        }
        $address .= " " . $rec['ZIPCODE'];
        // get the lat lng from google maps
        $req_addr = urlencode($address);
        $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . $req_addr . "&key=" . $_SESSION['mapkey'];
        //echo($url);
        $resp_json = file_get_contents($url);
        $resp = json_decode($resp_json, true);
        if ($resp['status'] === 'OK') {
            $lat = $resp['results'][0]['geometry']['location']['lat'];
            $lng = $resp['results'][0]['geometry']['location']['lng'];
            // update the customer file
            $query = "UPDATE $_SESSION[install_lib].CUSTDETS SET LAT=$lat,LNG=$lng WHERE CUST_ID=$_REQUEST[id]";
            $result = i5_query($query, $conn);
            // now get the map
            $map_url = "https://maps.googleapis.com/maps/api/staticmap?size=400x400&format=JPEG&markers=color:red|"
                    . $lat . "," . $lng . "&zoom=14&key=" . $_SESSION['mapkey'];
            $img = file_get_contents($map_url);
            if (stat($file_name)) {
                unlink($file_name);
            }
            $fp = fopen('images/maps/' . $id . ".jpeg", 'w+');
            fputs($fp, $img);
            fclose($fp);
            unset($img);
        }
    }
    if ($rec['DIST'] <= 0) {
        // start is the geolocation of mapes
        $dist = '0';
        $start = "40.8879067,-96.6425269";
        $end = $lat . "," . $lng;
        $d_url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=" . $start . "&destinations=" . $end . "&key=" . $_SESSION['mapkey'];
        $resp_json = file_get_contents($d_url);
        $resp = json_decode($resp_json, true);
        // Note 1609.34 meters in a mile
        if ($resp['status'] === 'OK') {
            $dist = round(($resp['rows'][0]['elements'][0]['distance']['value'] / 1609.34));
            // update the customer file
            $query = "UPDATE $_SESSION[install_lib].CUSTDETS SET DIST=$dist WHERE CUST_ID=$_REQUEST[id]";
            $result = i5_query($query, $conn);
        }
    }
    // if no image but have co-ords go get image
    if ($page === 'dspCustomer.php') {
        if (!stat($file_name)) {
            $map_url = "https://maps.googleapis.com/maps/api/staticmap?size=400x400&format=JPEG&markers=color:red|" . $lat . "," . $lng . "&zoom=14&key=" . $_SESSION['mapkey'];
            $img = file_get_contents($map_url);
            $fp = fopen('images/maps/' . $id . ".jpeg", 'w+');
            fputs($fp, $img);
            fclose($fp);
            unset($img);
        }
        echo("<div class='c_map'><input type='hidden' id='cust_lat' value='$lat' /><input type='hidden' id='cust_lng' value='$lng' /><img src='images/maps/" . $id . ".jpeg' alt='Map' onclick='show_gm(" . $lat . "," . $lng . " )'/></div>");
    }
}

/*
 * function dsp_contacts() 
 * Display the contact information per customer
 * @parms
 *      the connection resource to use
 *      type of contacts to display
 */

function dsp_contacts(&$conn, $type) {
    // get the contact information
    $query = "SELECT * FROM $_SESSION[install_lib]/CONTACT WHERE CUST_ID=" . $_REQUEST['id'];
    if ($type !== 'ALL') {
        $query .= " AND CONTACT_TYPE='$type'";
    }
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    if (i5_num_rows($result) < 1) {
        echo("<tr><td colspan='5'><strong>No Contacts found </strong> <a href=addContact.php?id=$_REQUEST[id]>Add Contact</a></td></tr>");
    }
    while ($rec = i5_fetch_assoc($result)) {
        echo("<tr><td><a target=_blank class='btn' href='updContact.php?id=$rec[CONTACT_ID]&custid=$_REQUEST[id]' >Update</a>"
        . "<a class='btn' href='scripts/rmv_contact.php?id=$rec[CONTACT_ID]' >Remove</a>"
        . "</td><td>$rec[CONTACT_TYPE]</td><td>$rec[FIRST_NAME]</td><td>$rec[LAST_NAME]</td>"
        . "<td>$rec[TEL_1]</td><td><a href='mailto:$rec[EMAIL]' >$rec[EMAIL]</a></td></tr>");
    }
    i5_free_query($result);
    return 1;
}

/*
 * function list_customers() 
 * Display a list of customers a filter will be applied if search is requested
 * @parms
 *      the connection resource to use
 */

function list_customers(&$conn) {
    // if search is requested need to append to query
    $name = "";
    $addr1 = "";
    $addr2 = "";
    $addr3 = "";
    $city = "";
    $state = "";
    if (isset($_REQUEST['search'])) {
        // search string to be defined
        $search = explode(',', $_REQUEST['search']);
        $count = sizeof($search);
        for ($i = 0; $i < $count;) {
            $s = strtoupper($search[$i]);
            $name .= " upper(a.NAME) LIKE '%" . $s . "%'";
            $addr1 .= " upper(a.ADDR_1) LIKE '%" . $s . "%'";
            $addr2 .= " upper(a.ADDR_2) LIKE '%" . $s . "%'";
            $addr3 .= " upper(a.ADDR_3) LIKE '%" . $s . "%'";
            $city .= " upper(a.CITY) LIKE '%" . $s . "%'";
            $state .= " upper(a.STATE) LIKE '%" . $s . "%'";
            if (++$i < $count) {
                $name .= " AND";
                $addr1 .= " AND";
                $addr2 .= " AND";
                $addr3 .= " AND";
                $city .= " AND";
                $state .= " AND";
            }
        }
        $query = "SELECT a.* FROM $_SESSION[install_lib].CUSTDETS AS a WHERE $name OR $addr1 OR $addr2 OR $addr3 OR $city OR $state";
    } else {
        $query = "SELECT * FROM $_SESSION[install_lib].CUSTDETS";
    }
    if (isset($_REQUEST['flt']) && $_REQUEST['flt'] != '*') {
        $query .= " WHERE STATUS='" . $_REQUEST['flt'] . "'";
    }
    if (isset($_REQUEST['sort'])) {
        $query .= " ORDER BY $_REQUEST[sort]";
    } else {
        $query .= " ORDER BY CUST_ID";
    }
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    // if none
    if (i5_num_rows($result) === 0) {
        $rtv_url = "listOldCust.php";
        if (isset($_REQUEST['search'])) {
            $rtv_url .= "?search=" . $_REQUEST['search'];
            //$rtv_url = urlencode($rtv_url);
            echo("<tr><td colspan='7'><strong>No records found </strong><a href='" . $rtv_url . "' target='blank' > Check Old records</a></td></tr>");
            return 1;
        } else {
            echo("<tr><td colspan='7'><strong>No records found</strong></td></tr>");
            i5_free_query($result);
            return 1;
        }
    }
    // display as a table
    while ($rec = i5_fetch_assoc($result)) {
        echo("<tr><td style='width: 210px;' ><a class='btn' href=dspCustomer.php?id=" . $rec['CUST_ID'] . "&qsts=A target='_blank' >Details </a>"
        . "<a class='btn' href=addQuote.php?id=" . $rec['CUST_ID'] . " target='_blank' > Quote</a></td>"
        . "<td style='width: 100px;'>" . $rec['CUST_ID'] . " : " . $rec['OLD_CID'] . "</td><td style='width: 330px;'>" . $rec['NAME'] . "</td><td style='width: 200px;'>" . $rec['ADDR_1'] . "</td><td style='width: 140px;'>" . $rec['CITY'] .
        "</td><td style='width: 60px;'>" . $rec['STATE'] . "</td><td style='width: 100px;'>" . $rec['TEL_1'] . "</td><td style='width: 150px;'>");
        if ($rec['INST'] === 'Y') {
            echo("<img src='../images/gs.png' /> ");
        }
        echo($rec['CUST_TYPE'] . "</td></tr>");
    }
    if (isset($_REQUEST['search'])) {
        $rtv_url = "listOldCust.php";
        $rtv_url .= "?search=" . $_REQUEST['search'];
        //$rtv_url = urlencode($rtv_url);
        echo("<tr><td colspan='8'><a href='" . $rtv_url . "' target='blank' > Check Old records</a></td></tr>");
    }
    i5_free_query($result);
    return 1;
}

/*
 * function list_quotes() 
 * Display a list of quotes, if a customer ID is passed in it will be filtered by that ID
 * @parms
 *      the connection resource to use
 */

function list_quotes(&$conn, $status) {
    // get the page name
    $page = basename($_SERVER['PHP_SELF']);
    //echo($page);
    // list all quotes for the customer including versions
    $query = "SELECT * from $_SESSION[install_lib]/QUOTE_V1  ";
    if ($page === 'dspCustomer.php') {
        if ($status !== 'ALL') {
            $query .= " WHERE STATUS='$status' AND CUST_ID=$_REQUEST[id]";
        } else {
            $query .= " WHERE CUST_ID=$_REQUEST[id]";
        }
    } else {
        if (isset($_REQUEST['search'])) {
            // build the search request
            // search string to be defined
            $search = explode(',', $_REQUEST['search']);
            $count = sizeof($search);
            $name = '';
            for ($i = 0; $i < $count;) {
                $name .= "WHERE  upper(JOBNAME) LIKE '%" . strtoupper($search[$i]) . "%'";
                if (++$i < $count) {
                    $name .= " AND";
                }
            }
            $query .= " $name";
        }
        if (isset($_REQUEST['flt']) && $_REQUEST['flt'] != '*') {
            $query .= " WHERE STATUS='" . $_REQUEST['flt'] . "'";
        }
    }

    if (isset($_REQUEST['sort'])) {
        $query .= " ORDER BY $_REQUEST[sort] ";
        if ($_REQUEST['sort'] === 'JOBNAME' || $_REQUEST['sort'] === 'SALESMAN' || $_REQUEST['sort'] === 'STATUS') {
            $query .= " ASC ";
        } else {
            $query .= " DESC ";
        }
    } else {
        $query .= " ORDER BY QUOTE_ID DESC";
    }
    //echo($query);
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    $qid = '';
    while ($rec = i5_fetch_assoc($result)) {
        $quote_date = cvt_ts_date($rec['QUOTE_TS']);
        if (($qid === $rec['QUOTE_ID']) && ($rec['STATUS'] != 'R')) {
            echo("<tr><td style='width:210px;'><a class='btn' href=dspQuote.php?id=" . $rec['QUOTE_ID'] . "&ver=" . $rec['QUOTE_VER'] . " target='_BLANK' >Dsp</a></td>");
        } else {
            echo("<tr><td style='width:210px;'><a class='btn' href=dspQuote.php?id=" . $rec['QUOTE_ID'] . "&ver=" . $rec['QUOTE_VER'] . " target='_BLANK' >Dsp</a> "
            . "<a class='btn' href=updQuote.php?id=" . $rec['QUOTE_ID'] . "&ver=" . $rec['QUOTE_VER'] . " target='_BLANK' >Upd</a>"
            . "<input type='button' class='btn' onclick=\"dsp_copy_form('$rec[QUOTE_ID]','$rec[QUOTE_VER]')\" value='Cpy' /></td>");
        }
        if ($page === 'listQuotes.php') {
            echo("<td style='width:150px;'><a href='dspCustomer.php?id=" . $rec['CUST_ID'] . "&qsts=ALL' target='blank'>" . $rec['NAME'] . "</a></td>");
        }
        $m_cost = '$' . number_format($rec['TCOST_M'] + $rec['F_EST']);
        $s_cost = '$' . number_format($rec['TCOST_S'] + $rec['F_EST']);
        echo("<td style='width:100px;'>" . $quote_date . "</td><td style='width:100px;'>" . $rec['QUOTE_ID'] . "-" . $rec['QUOTE_VER'] . "</td><td style='width:250px;'>" . $rec['JOBNAME'] . "</td><td style='width:100px;'>" . $m_cost . "</td>"
        . "<td style='width:100px;'>" . $s_cost . "</td><td style='width:100px;'>" . $rec['STATUS'] . "</td><td style='width:150px;'>" . $rec['SALESMAN'] . "</td><td><a class='btn' href='dspPriceInfo.php?id=" . $rec['QUOTE_ID'] . "&ver=" . $rec['QUOTE_VER'] . "' target='_blank' >Dsp_Price_Info</a></td></tr>");
        $qid = $rec['QUOTE_ID'];
    }
    i5_free_query($result);
    return 1;
}

/*
 * function list_old_cust() 
 * Display a list of customers from the OLD CANLIB DB to allow copy to new DB
 * @parms
 *      the connection resource to use
 */

function list_old_cust(&$conn) {
    $query = "SELECT a.ARCUNO,a.ARCUNM,a.ARCUA1,a.ARCUCY,a.ARCUSS,ARCUCS,a.ARCUPS,a.ARCUPN FROM  CANLIB.CANCUST as a ";
    $query .= " WHERE a.ARCUNM != '' AND a.ARCUNM != 'DELETE' AND a.ARCUCY != 'M' AND a.ARCUDL = 'A' AND";
    // search string to be defined
    $search = explode(',', $_REQUEST['search']);
    $count = sizeof($search);
    $arcunm = "";
    $arcua1 = "";
    $arcucy = "";
    for ($i = 0; $i < $count;) {
        $arcunm .= " a.ARCUNM LIKE '%" . strtoupper($search[$i]) . "%'";
        $arcua1 .= " a.ARCUA1 LIKE '%" . strtoupper($search[$i]) . "%'";
        $arcucy .= " a.ARCUCY LIKE '%" . strtoupper($search[$i]) . "%'";
        if (++$i < $count) {
            $arcunm .= " AND";
            $arcua1 .= " AND";
            $arcucy .= " AND";
        }
    }
    $query .= $arcunm . " OR " . $arcua1 . " OR " . $arcucy;
    //echo($query);
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    $num_rows = i5_num_rows($result);
    if ($num_rows == 0) {
        echo("<tr><td colspan='7'><strong>No records found</strong></td></tr>");
        i5_free_query($result);
        return 1;
    } else {
        while ($rec = i5_fetch_assoc($result)) {
            // echo the results
            $tel = "(" . substr($rec['ARCUPN'], 0, 3) . ") " . substr($rec['ARCUPN'], 3, 3) . "-" . substr($rec['ARCUPN'], 6, 4);
            echo("<tr><td><a class='btn' href='../addCustomer.php?id=" . $rec['ARCUNO'] . "' >Copy</a></td><td>" . $rec['ARCUNO'] . "</td><td>" . $rec['ARCUNM'] . "</td><td>" . $rec['ARCUA1'] . "</td><td>" . $rec['ARCUCY'] . "</td><td>" . $rec['ARCUSS'] . "</td><td>" . $tel . "</td></tr>");
        }
    }
    i5_free_query($result);
    return 1;
}

/*
 * function show_cust_notes() 
 * Display the notes for a customer
 * @parms
 *      the connection resource to use
 */

function show_cust_notes(&$conn) {

    $query = "SELECT * FROM $_SESSION[install_lib]/CUSTNOTES WHERE CUST_ID=" . $_REQUEST['id'];
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $n_query;
        return;
    }
    $num_rows = i5_num_rows($result);
    if ($num_rows == 0) {
        echo("<tr><td colspan='4'><strong>No records found</strong></td></tr>");
        i5_free_query($result);
        return 1;
    } else {
        while ($rec = i5_fetch_assoc($result)) {
            // format the time stamp
            //20170407174523771380
            $e = array('-', '.');
            $t = str_replace($e, '', $rec['STAMP']);
            $h = substr($t, 8, 2);
            if ($h > 12) {
                $m = ' PM';
                $h = $h - 12;
            } else {
                $m = ' AM';
            }
            $date = substr($t, 4, 2) . "/" . substr($t, 6, 2) . "/" . substr($t, 0, 4) . " " . $h . ":" . substr($t, 10, 2) . ":" . substr($t, 12, 2) . $m;
            echo("<tr><td>$date</td><td>$rec[USR_NAME]</td><td>$rec[NOTE]</td><td>");
            for ($i = 0; $i < $rec['CUST_RATING']; $i++) {
                echo("<img src='../images/gs.png' />");
            }
            echo("</td></tr>");
        }
    }
    i5_free_query($result);
    return 1;
}

/*
 * function bld_contact_sel() 
 * Build a select list of contacts for a specific customer
 * @parms
 *      the connection resource to use
 */

function bld_contact_sel(&$conn, $id) {
    // get the contact information
    $query = "SELECT * FROM $_SESSION[install_lib]/CONTACT WHERE CUST_ID=" . $id;
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    if (i5_num_rows($result) < 1) {
        echo("<label for='c_fname'>First Name : <input type='text' id='c_fname'  name='cf_name' size='20' maxlength='15' placeholder='First Name' /></label>");
        echo("<label for='c_lname'>Last Name : <input type='text' id='c_lname'  name='cl_name' size='20' maxlength='15' placeholder='Last Name' /></label>");
        echo("<label for='c_email'>Email: <input type='text' id='c_email' name='c_email' size='25' maxlength='75' placeholder='Email Address' /></label>");
        echo("<label for='c_tel'>Telephone : <input type='tel' id='c_tel'  name='c_tel' onchange='format_tel(this)' size='20' placeholder='(xxx) xxx-xxxx' /></label>");
        echo("<input type='button'  id='add_other_contact' name='add_other_contact' value='Add Contact'  onclick='add_other_contact($id)' />");
        i5_free_query($result);
        return 1;
    } else {
        $contact_sel = "<label for='cont_sel'>Contact : <select name='cont_type' id='cont_type' onchange=show_other('contact')  required ><option value=''>&nbsp;</option>";
        while ($rec = i5_fetch_assoc($result)) {
            $contact_sel .= "<option value='$rec[CONTACT_ID],$rec[FIRST_NAME],$rec[LAST_NAME],$rec[EMAIL],$rec[TEL_1],$rec[CONTACT_TYPE]'>$rec[CONTACT_TYPE]  $rec[FIRST_NAME] $rec[LAST_NAME]</option>";
        }
        $contact_sel .= "<option value='Other'>Other</option></select></label>";
        echo('<br />' . $contact_sel . "<br /><br />");
        echo("<label for='c_fname'>First Name : <input type='text' id='c_fname'  name='cf_name' size='10' maxlength='15' placeholder='First Name' disabled='disabled'/></label>");
        echo("<label for='c_lname'>Last Name : <input type='text' id='c_lname'  name='cl_name' size='10' maxlength='15'placeholder='Last Name' disabled='disabled'/></label>");
        echo("<label for='c_email'>Email: <input type='text' id='c_email' name='c_email' size='25' maxlength='75' placeholder='Email Address' disabled='disabled'/></label>");
        echo("<label for='c_tel'>Telephone : <input type='tel' id='c_tel'  name='c_tel' onchange='format_tel(this)' size='20' placeholder='(xxx) xxx-xxxx' disabled='disabled'/></label>");
        echo("<input type='button' style='display:none;'  id='add_other_contact' name='add_other_contact' value='Add Contact'  onclick='add_other_contact($id)' />");
    }
    i5_free_query($result);
    return 1;
}

/*
 * function dsp_quote() 
 * Display quote information
 * @parms
 *      the connection resource to use
 */

function dsp_quote(&$conn) {
    // get the quote header based on the Request Info
    $hdr_query = "SELECT * FROM $_SESSION[install_lib]/QUOTEHDR WHERE QUOTE_ID=" . $_REQUEST['id'] . " AND QUOTE_VER = '" . $_REQUEST['ver'] . "'";
    $result = i5_query($hdr_query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $hdr_query;
        return;
    }
    // get the record
    $h_rec = i5_fetch_assoc($result);
    i5_free_query($result);
    $qdate = cvt_ts_date($h_rec['QUOTE_TS']);
    echo("<input type='hidden' id='quoteId' value='Quote # " . $h_rec['QUOTE_ID'] . "-" . $h_rec['QUOTE_VER'] . "' />");
    echo("<div id='q_hdr'><strong>Quote Date: </strong>" . $qdate . "<br /><strong>Quote Number : </strong>" . $h_rec['QUOTE_ID']
    . "<strong> Version : </strong>" . $h_rec['QUOTE_VER'] . "<br /><strong>Sales Person : </strong>" . $h_rec['SALESMAN'] . "<br /></div>");
    // get the customer information 
    echo("<div id='cust_info' class='cust_info'>");
    dsp_cust($conn, $h_rec['CUST_ID']);
    if ((isset($h_rec['QBIDDATE'])) && ($h_rec['QBIDDATE'] != '0001-01-01')) {
        echo("</div><br /><div style='padding-left:4%;'><label>Bid Date : </label>" . $h_rec['QBIDDATE']);
    }
    echo("</div><br /><div class='pl40'><strong>Job Name : </strong>" . $h_rec['JOBNAME'] . "<br />");
    // contact information
    $c_query = "SELECT * FROM $_SESSION[install_lib]/QCONTACT WHERE QUOTE_ID=" . $_REQUEST['id'] . " AND QUOTE_VER = '" . $_REQUEST['ver'] . "'";
    $result = i5_query($c_query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $c_query;
        return;
    }
    // get the record(s)
    echo("<strong>Contact Information : </strong>");
    while ($c_rec = i5_fetch_assoc($result)) {
        echo("<br />$c_rec[C_TYPE]  - $c_rec[FNAME],$c_rec[LNAME] Telephone : $c_rec[TEL] Email : $c_rec[EMAIL] ");
    }
    echo("</div>");
    i5_free_query($result);
    // Quote lines
    echo("<div class='table_wrapper'><table id='dsp_quote_table' class='dft_table'><thead><tr><th>Qty</th><th>Description</th><th>Cost</th></tr></thead><tbody>");
    $l_query = "SELECT * FROM $_SESSION[install_lib]/QUOTELINE  WHERE QUOTE_ID=" . $_REQUEST['id'] . " AND QUOTE_REV = '" . $_REQUEST['ver'] . "'";
    $result = i5_query($l_query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $l_query;
        return;
    }
    // display the table
    // get the record(s)
    $notes = false;
    while ($l_rec = i5_fetch_assoc($result)) {
        echo("<tr>");
        // check for notes in the line
        $line_notes = strpos($l_rec['LINEDETS'], "c_notes");
        if ($line_notes === false && $notes === true) {
            $notes = false;
        } else {
            $notes = $line_notes;
        }
        show_qline($l_rec['LINEDETS']);
        echo("</tr>");
    }
    echo("</tbody></table></div>");
    i5_free_query($result);
    // display the totals
    echo("<div id='quote_footer' class='pl40'><table id='costing'><tr> <td colspan='5'><h1><span class='underline'>Costs</span></h1></td></tr>"
    . "<tr><td><strong>Stamped Calcs : </strong></td><td colspan='2'>");
    if ($h_rec['CALCS'] === 'I') {
        echo("<label>Included</label> ");
    } else {
        echo("<label>Line Item</label>");
    }
    echo("</td><td colspan='2'>&nbsp;</td></tr>");
    echo("<tr><td><strong>Freight : </strong></td><td><input type='text' class='text_r' id='f_est' size='10' name='f_est' placeholder='Freight' value='$" . number_format($h_rec['F_EST']) . "'  disabled /></td>"
    . "<td><strong>Weight llbs: </strong></td><td><input type='text' class='text_r' id='t_weight' size='10' name='t_weight' placeholder='Total Weight' value='" . number_format($h_rec['T_WEIGHT'], 2) . "lbs' disabled /></td><td>&nbsp;</td></tr>"
    . "<tr><td><strong>Total Sqft : </strong></td><td><input type='text' class='text_r' id='total_sqft' size='10' name='total_sqft' placeholder='Total Sqft' value='$h_rec[TOTSQFT]' disabled /></td><td colspan='3'>&nbsp;</td></tr>");
    echo("<tr><td nowrap><strong>As Specified :</strong> </td><td><input type='text' class='text_r' id='total_a' size='10' name='total_a' placeholder='As Specified' value='$" . number_format($h_rec['TCOST']) . "' disabled/></td>"
    . "<td nowrap><strong>Cost Sqft : </strong></td><td><input type='text' class='text_r' id='cost_sqfta' size='10' name='cost_sqfta' placeholder='Cost per sqft' disabled value='$" . number_format($h_rec['C_SQFTA'], 2) . "' /></td>"
    . "<td nowrap>"
    . "<label for='5ua'> 5% : <input type='text' size='10' id='5ua' name='5ua' placeholder='5%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_A'] * 1.05), 0) . "'/></label>"
    . "<label for='10ua'> 10% : <input type='text' size='10' id='10ua' name='10ua' placeholder='10%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_A'] * 1.10), 0) . "'/></label>"
    . "<label for='15ua'> 15% : <input type='text' size='10' id='15ua' name='15ua' placeholder='15%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_A'] * 1.15), 0) . "'/></label>"
    . "<label for='20ua'> 20% : <input type='text' size='10' id='20ua' name='20ua' placeholder='20%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_A'] * 1.20), 0) . "'/></label>"
    . "<label for='25ua'> 25% : <input type='text' size='10' id='25ua' name='25ua' placeholder='25%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_A'] * 1.25), 0) . "'/></label>"
    . "<label for='30ua'> 30% : <input type='text' size='10' id='30ua' name='30ua' placeholder='30%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_A'] * 1.30), 0) . "'/></label></td></tr>");

    echo("<tr><td nowrap><strong>Standard Finish :</strong> </td><td><input type='text' class='text_r' id='total_sf' size='10' name='total_sf' placeholder='Standard'  value='$" . number_format(round($h_rec['TCOST_M'])) . "' disabled /></td>"
    . "<td nowrap><strong>Cost Sqft : </strong></td><td><input type='text' class='text_r' id='cost_sqftm' size='10' name='cost_sqftm' placeholder='Cost per sqft' value='$" . number_format($h_rec['C_SQFT'], 2) . "'  disabled /></td>"
    . "<td nowrap>"
    . "<label for='5u'> 5% : <input type='text' size='10' id='5u' name='5u' placeholder='5%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_M'] * 1.05), 0) . "'/></label>"
    . "<label for='10u'> 10% : <input type='text' size='10' id='10u' name='10u' placeholder='10%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_M'] * 1.10), 0) . "'/></label>"
    . "<label for='15u'> 15% : <input type='text' size='10' id='15u' name='15u' placeholder='15%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_M'] * 1.15), 0) . "'/></label>"
    . "<label for='20u'> 20% : <input type='text' size='10' id='20u' name='20u' placeholder='20%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_M'] * 1.20), 0) . "'/></label>"
    . "<label for='25u'> 25% : <input type='text' size='10' id='25u' name='25u' placeholder='25%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_M'] * 1.25), 0) . "'/></label>"
    . "<label for='30u'> 30% : <input type='text' size='10' id='30u' name='30u' placeholder='30%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_M'] * 1.30), 0) . "'/></label></td></tr>");

    echo("<tr><td><strong>2 Coat Finish : </strong></td><td><input type='text' class='text_r' id='total_2c' size='10' name='total_2c' placeholder='2 Coat'  value='$" . number_format(round($h_rec['TCOST_S'])) . "' disabled/></td>"
    . "<td><strong>Cost Sqft : </strong></td><td><input type='text' class='text_r' id='cost_sqft2' size='10' name='cost_sqft2' placeholder='Cost per sqft'  value='$" . number_format($h_rec['C_SQFT2'], 2) . "' disabled/></td>"
    . "<td nowrap>"
    . "<label for='5u2'> 5% : <input type='text' size='10' id='5u2' name='5u2' placeholder='5%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_S'] * 1.05), 0) . "'/></label>"
    . "<label for='10u2'> 10% : <input type='text' size='10' id='10u2' name='10u2' placeholder='10%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_S'] * 1.10), 0) . "'/></label>"
    . "<label for='15u2'> 15% : <input type='text' size='10' id='15u2' name='15u2' placeholder='15%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_S'] * 1.15), 0) . "'/></label>"
    . "<label for='20u2'> 20% : <input type='text' size='10' id='20u2' name='20u2' placeholder='20%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_S'] * 1.20), 0) . "'/></label>"
    . "<label for='25u2'> 25% : <input type='text' size='10' id='25u2' name='25u2' placeholder='25%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_S'] * 1.25), 0) . "'/></label>"
    . "<label for='30u2'> 30% : <input type='text' size='10' id='30u2' name='30u2' placeholder='30%' disabled='disabled' value='$" . number_format(round($h_rec['OCOST_S'] * 1.30), 0) . "'/></label></td></tr></table></div>");
    // show the 3rd coat line.
    echo("<div id='price_calcs' class='pl40' >"
    . " <h1><span class='underline'>Add 3rd coat</span></h1>"
    . "<label for='3c0'> Cost : <input type='text' size='10' id='3c0' name='3c0' placeholder='Cost' disabled='disabled' value='$" . number_format($h_rec['TCOST_3'], 0) . "'/></label>"
    . "<label for='3c5'> 5% : <input type='text' size='10' id='3c5' name='3c5' placeholder='5%' disabled='disabled' value='$" . number_format(round($h_rec['TCOST_3'] * 1.05), 0) . "'/></label>"
    . "<label for='3c10'> 10% : <input type='text' size='10' id='3c10' name='3c10' placeholder='10%' disabled='disabled' value='$" . number_format(round($h_rec['TCOST_3'] * 1.10), 0) . "' /></label>"
    . "<label for='3c15'> 15% : <input type='text' size='10' id='3c15' name='3c15' placeholder='15%' disabled='disabled' value='$" . number_format(round($h_rec['TCOST_3'] * 1.15), 0) . "' /></label>"
    . "<label for='3c20'> 20% : <input type='text' size='10' id='3c20' name='3c20' placeholder='20%' disabled='disabled' value='$" . number_format(round($h_rec['TCOST_3'] * 1.20), 0) . "' /></label>"
    . "<label for='3c25'> 25% : <input type='text' size='10' id='3c25' name='3c25' placeholder='25%' disabled='disabled' value='$" . number_format(round($h_rec['TCOST_3'] * 1.25), 0) . "' /></label>"
    . "<label for='3c30'> 30% : <input type='text' size='10' id='3c30' name='3c30' placeholder='30%' disabled='disabled' value='$" . number_format(round($h_rec['TCOST_3'] * 1.30), 0) . "' /></label></div>");

    // display any notes added to the quote    
    echo("<br /><br /><div style='margin-left:4%; min-width:600px;'><label><strong>Print : </strong></label>"
    . "<a class='btn' href='e_quote.php?id=$_REQUEST[id]&ver=$_REQUEST[ver]&jobname=$h_rec[JOBNAME]&cust_id=$h_rec[CUST_ID]' >Email</a>"
    . "<a class='btn' href='scripts/prt_quote.php?id=$_REQUEST[id]&ver=$_REQUEST[ver]&type=ms' target='_BLANK' >Standard</a>"
    . "<a class='btn' href='scripts/prt_quote.php?id=$_REQUEST[id]&ver=$_REQUEST[ver]&type=2c' target='_BLANK' >Kynar</a>"
    . "<a class='btn' href='scripts/prt_quote.php?id=$_REQUEST[id]&ver=$_REQUEST[ver]&type=both' target='_BLANK' >Both</a>");
    if ($notes !== false) {
        echo("<a class='btn' href='scripts/prt_quote.php?id=$_REQUEST[id]&ver=$_REQUEST[ver]&type=s'  target='_BLANK' >Break out Options</a>");
    }
    echo("<a class='btn' href='scripts/prt_quote.php?id=$_REQUEST[id]&ver=$_REQUEST[ver]&type=a' target='_BLANK' >As Specified</a>");

    echo("</div>");
    echo("<div class='table_wrapper'><h1><span class='underline'>Notes</span></h1><table id='quote_notes_table' width='100%'><thead><tr><th>Date Time</th><th>Version</th><th>User</th><th>Note</th></tr></thead><tbody>");
    $n_query = "SELECT * FROM $_SESSION[install_lib]/QNOTES WHERE QUOTE_ID=" . $_REQUEST['id'];
    $result = i5_query($n_query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $n_query;
        return;
    }
    $num_rows = i5_num_rows($result);
    if ($num_rows == 0) {
        echo("<tr><td colspan='4'><strong>No records found</strong></td></tr>");
        i5_free_query($result);
    } else {
        while ($n_rec = i5_fetch_assoc($result)) {
            // format the time stamp
            //20170407174523771380
            $e = array('-', '.');
            $t = str_replace($e, '', $n_rec['TS']);
            $h = substr($t, 8, 2);
            if ($h > 12) {
                $m = ' PM';
                $h = $h - 12;
            } else {
                $m = ' AM';
            }
            $date = substr($t, 4, 2) . "/" . substr($t, 6, 2) . "/" . substr($t, 0, 4) . " " . $h . ":" . substr($t, 10, 2) . ":" . substr($t, 12, 2) . $m;
            //$date = substr($t, 4, 2) . "/" . substr($t, 6, 2) . "/" . substr($t, 0, 4) . " " . substr($t, 8, 2) . ":" . substr($t, 10, 2) . ":" . substr($t, 12, 2);
            echo("<tr><td>$date</td><td>$n_rec[QUOTE_VER]</td><td>$n_rec[USRNAME]</td><td>$n_rec[NOTE]</td></tr>");
        }
        i5_free_query($result);
    }
    echo("</tbody></table>");
    echo("<form id='q_note_add' name='q_note_add' method='post' action='scripts/add_qnote.php'>");
    echo("<input type='hidden' id='q_num' name='q_num' value=$_REQUEST[id] />");
    echo("<input type='hidden' id='q_ver' name='q_ver' value='$_REQUEST[ver]' />");
    echo("<input type='text' id='q_note' name='q_note' maxlength='355' size='175' />");
    echo("<input type='submit'  value='Add Note' /></form></div>");
    return 1;
}

/*
 * function show_qline() 
 * Display the customer information
 * @parms
 *      the line information as key value pair array
 */

function show_qline($line) {
    $incl_cost = true;
    $line_item = false;
    $ems = explode('&', $line);
    $mcolor = false;
    // look for line item optional cost
    foreach ($ems as $em) {
        $pair = explode('=', $em);
        switch ($pair[0]) {
            case 'opt_cost' :
                if ($pair[1] === 'on') {
                    $incl_cost = false;
                }
                break;
        }
    }
    // loop through for all lines.
    foreach ($ems as $em) {
        $pair = explode('=', $em);
        switch ($pair[0]) {
            case 'dims' :
                // first we need to get each dimension set
                $cdims = explode('~', $pair[1]);
                $num_dims = count($cdims);
                $size_str = '';
                $qty_str = "<td class='top'>";
                for ($i = 0; $i < $num_dims; $i++) {
                    $vals = explode('#', $cdims[$i]);
                    $num_vals = count($vals);
                    for ($j = 0; $j < $num_vals; $j++) {
                        $p = explode(':', $vals[$j]);
                        If (strpos($p[0], "c_qty") === 0) {
                            $qty_str .= $p[1] . "<br />";
                        } else if (strpos($p[0], "pf") === 0) {
                            if ($j > 0 && $size_str !== '') {
                                $size_str .= " Wide<br />";
                            }
                            $size_str .= "<strong>Size : </strong>" . $p[1] . "' ";
                        } else if (strpos($p[0], "pi") === 0) {
                            $size_str .= $p[1] . '" ';
                        } else if (strpos($p[0], "wf") === 0) {
                            $size_str .= "Projection  X " . $p[1] . "' ";
                        } else if (strpos($p[0], "wi") === 0) {
                            $size_str .= $p[1] . '" ';
                        } else if (strpos($p[0], "cpf") === 0) {
                            $size_str .= $p[1] . "' ";
                        } else if (strpos($p[0], "cpi") === 0) {
                            $size_str .= $p[1] . '" ';
                        } else if (strpos($p[0], "cwf") === 0) {
                            $size_str .= " Projection X " . $p[1] . "' ";
                        } else if (strpos($p[0], "cwi") === 0) {
                            $size_str .= $p[1] . "' ";
                        } else if (strpos($p[0], "cu") === 0) {
                            $size_str .= " Wide Corner Unit ";
                        }
                    }
                }
                echo("$qty_str</td><td>");
                echo($size_str .= " Wide");
                break;
            case 'p_info' :
                $p_info = explode('~', $pair[1]);
                $num_plines = count($p_info);
                for ($i = 0; $i < $num_plines; $i++) {
                    $vals = explode('#', $p_info[$i]);
                    $num_vals = count($vals);
                    for ($j = 0; $j < $num_vals; $j++) {
                        $p = explode(':', $vals[$j]);
                        If (strpos($p[0], "p_qty") === 0) {
                            echo("<br /><strong>Post : </strong>" . $p[1] . " X ");
                        } else If (strpos($p[0], "type_sel") === 0) {
                            if ($p[1] === 'wall') {
                                echo(" Wall Mounted ");
                            } else if ($p[1] === 'free') {
                                echo(" Free Standing ");
                            } else {
                                echo(" Support by Other ");
                            }
                        } else If (strpos($p[0], "dim_sel") === 0) {
                            if ($p[1] === 'p44') {
                                echo("4\" X 4\" ");
                            } else if ($p[1] === 'p46') {
                                echo("4\" X 4\" ");
                            } else if ($p[1] === 'p66') {
                                echo("6\" X 6\" ");
                            }
                        } else If (strpos($p[0], "set_sel") === 0) {
                            if ($p[1] === 'inground') {
                                echo("In-ground posts with post sleeve knockouts ");
                            } else if ($p[1] === 'freestand') {
                                echo(" Surface mounted with steel post boots ");
                            }
                        }
                    }
                }
                break;
            case 'l-qty' :
                $line_item = true;
                echo("<td>$pair[1]</td><td>");
                break;
            // description
            case 'canopy' :
                if ($pair[1] === 'PostSupported') {
                    echo("<br /><strong> Canopy Type : </strong>Post Supported ");
                } else if ($pair[1] === 'SuperShade') {
                    echo("<br /><strong> Canopy Type : </strong>SuperShade ");
                } else if ($pair[1] === 'SuperLumideck') {
                    echo("<br /><strong> Canopy Type : </strong>Super Lumideck");
                } else if ($pair[1] === 'LumiShade') {
                    echo("<br /><strong> Canopy Type : </strong>LumiShade");
                }
                break;
            case 'color' :
                break;
            case 'hanger' :
                if ($pair[1] === 'h1') {
                    echo("<br /><strong>Hanger : </strong>1\" ");
                } else if ($pair[1] === 'h125') {
                    echo("<br /><strong>Hanger :  </strong>1.25\" ");
                } else if ($pair[1] === 'h15') {
                    echo("<br /><strong>Hanger : </strong> 1.5\" ");
                } else if ($pair[1] === 'h2') {
                    echo( "<br /><strong>Hanger : </strong>2\" ");
                } else if ($pair[1] === 'hcb') {
                    echo( "<br /><strong>Hanger : </strong>Cantilevered Blades");
                }
                break;
            case 'post' :
                /*
                  if ($pair[1] === 'wall') {
                  echo( "<br /><strong>Post : </strong>Wall Mounted ");
                  } else if ($pair[1] === 'free') {
                  echo( "<br /><strong>Post : </strong>Free Standing ");
                  } else if ($pair[1] === 'other') {
                  echo( "<br/><strong>Post : </strong>Support by others ");
                  } */
                break;
            case 'oposts' :
                /*
                  echo("<strong> Details : </strong>" . $pair[1]);
                 */
                break;
            case 'mnts' :
                /*
                  if ($pair[1] !== '') {
                  echo("<strong> Wall Mounts : </strong>" . $pair[1] );
                  } */
                break;
            case 'post-dim' :
                /*
                  if ($pair[1] === 'p44') {
                  echo( "<br /><strong>Post : </strong> 4\" X 4\" ");
                  } else if ($pair[1] === 'p46') {
                  echo( "<br /><strong>Post : </strong> 4\" X 6\" ");
                  } else if ($pair[1] === 'p66') {
                  echo( "<br /><strong>Post : </strong> 6\" X 6\" ");
                  } */
                break;
            case 'post-set':
                /*
                  if ($pair[1] === 'inground') {
                  echo( " In-ground posts with post sleeve knockouts ");
                  } else if ($pair[1] === 'freestand') {
                  echo( " Surface mounted with steel post boots ");
                  } */
                break;
            case 'beam-dim' :
                if ($pair[1] === 'b47') {
                    echo( "<br /><strong>Beam : </strong> 4\" X 7\"");
                } else if ($pair[1] === 'b66') {
                    echo( "<br /><strong>Beam : </strong> 6\" X 6\"");
                } else if ($pair[1] === 'b610') {
                    echo( "<br /><strong>Beam :</strong>6\" X 10\"");
                }
                break;
            case 'deck' :
                if ($pair[1] === 'd275') {
                    echo( "<br /><strong>Deck : </strong> 2.75\" Square Corrugated ");
                } else if ($pair[1] === 'd5') {
                    echo( "<br /><strong>Deck : </strong>5\" Square Corrugated");
                } else if ($pair[1] === 'flat') {
                    echo( "<br /><strong>Deck : </strong>Flat Soffit");
                } else if ($pair[1] === 'zlouvre') {
                    echo( "<br /><strong>Deck : </strong>Z Louvre Blade");
                } else if ($pair[1] === 'slatted') {
                    echo( "<br /><strong>Deck : </strong>Slatted U Channel");
                } else if ($pair[1] === 'roll') {
                    echo( "<br /><strong>Deck : </strong>0.40 \"W\" Roll Formed Aluminum");
                } else if ($pair[1] === 'open') {
                    echo( "<br /><strong>Deck : </strong>Open");
                }
                break;
            case 'pfascia' :
                if ($pair[1] === 'f6') {
                    echo( "<br /><strong> Fascia: </strong> 6\"");
                } else if ($pair[1] === 'f8') {
                    echo( "<br /><strong> Fascia: </strong>8\"");
                } else if ($pair[1] === 'pfm') {
                    echo( "<br /><strong> Fascia: </strong> 8\" Modified ");
                }
                break;
            case 'nfascia' :
                if ($pair[1] === 'f83') {
                    echo( "<br /><strong> Fascia: </strong> 8\" 3 Sided");
                } else if ($pair[1] === 'f84') {
                    echo( "<br /><strong> Fascia: </strong>8\" 4 Sided");
                } else if ($pair[1] === 'nfm3') {
                    echo( "<br /><strong> Fascia: </strong> 8\" Modified 3 Sided ");
                } else if ($pair[1] === 'nfm4') {
                    echo( "<br /><strong> Fascia: </strong> 8\" Modified 4 Sided ");
                }
                break;
            case 'fascia-upg' :
                if ($pair[1] === 'moldings') {
                    echo( "<br /><strong> FasciaUpgrade : </strong>Molding ");
                } else if ($pair[1] === '3ext') {
                    echo( "<br /><strong> FasciaUpgrade : </strong> 3\" Extruded ");
                } else if ($pair[1] === '4ext') {
                    echo( "<br /><strong> FasciaUpgrade : </strong> 4\" Extruded ");
                } else if ($pair[1] === '6ext') {
                    echo( "<br /><strong> FasciaUpgrade : </strong> 6\" Extruded ");
                } else if ($pair[1] === '10s') {
                    echo( "<br /><strong> FasciaUpgrade : </strong> 10\" Smooth");
                } else if ($pair[1] === '12s') {
                    echo( "<br /><strong> FasciaUpgrade : </strong> 12\" Smooth");
                } else if ($pair[1] === 'cc') {
                    echo( "<br /><strong> FasciaUpgrade : </strong> \'C\' Channel ");
                } else if ($pair[1] === 'custom') {
                    echo( "<br /><strong> FasciaUpgrade : </strong> Custom ");
                }
                break;
            case 'fascia-upg-a' :
                echo("<strong>Add  Molding : </strong>");
                break;
            case 'cust-fascia_len' :
                if ($pair[1] === 'c12_len') {
                    echo("  < 12\" ");
                } else if ($pair[1] === 'c18_len') {
                    echo(" 12\" - 18\"");
                }
            case 'cust-fascia' :
                //echo( $pair[1]);
                break;
            case 'fascia-m' :
                if ($pair[1] === 'tb') {
                    echo( " Top and Bottom ");
                } else if ($pair[1] === 'to') {
                    echo( " Top Only ");
                } else if ($pair[1] === 'bo') {
                    echo( " Bottom Only ");
                }
                break;
            case 'msize':
                if ($pair[1] === 'ms25') {
                    echo( " 0.25\"");
                } else if ($pair[1] === 'ms1') {
                    echo( " 1\"");
                }
                break;
            case 'c-channel' :
                if ($pair[1] === 'cc8') {
                    echo( " 8\"");
                } else if ($pair[1] === 'cc10') {
                    echo( " 10\" ");
                } else if ($pair[1] === 'cc12') {
                    echo( " 12\" ");
                }
                break;
            case 'bend' :
                if ($pair[1] === 'curved') {
                    echo( "<br /><strong> Fascia Bend :  </strong>Curved ");
                } else if ($pair[1] === 'arched') {
                    echo( "<br /><strong> Fascia Bend : </strong>Arched ");
                }
                break;
            case 'drainage' :
                if ($pair[1] === 'scupper') {
                    echo( "<br /><strong> Drainage : </strong>Front Scupper ");
                } else if ($pair[1] === 'standard') {
                    echo( "<br /><strong> Drainage : </strong>Standard Post ");
                } else if ($pair[1] === 'rear-gutter') {
                    echo( "<br /><strong> Drainage : </strong>Rear Gutter");
                }
                break;
            case 'downspout' :
                if ($pair[1] === 'roll-formed') {
                    echo( " Roll Formed  2.5\" x 3\"");
                } else if ($pair[1] === 'extruded') {
                    echo( " Extruded  2.5\" x 3\"");
                }
                break;
            case 'd-qty' :
                echo("<br /><strong>Downspout Qty : </strong>" . $pair[1]);
                break;
            case 'finish' :
            case 'pfinish' :
            case 'dfinish' :
            case 'dsfinish':
            case 'hfinish' :
            case 'ffinish' :
                if ($pair[1] === 'm-standard' || $pair[1] === 'hm-standard' || $pair[1] === 'pm-standard' || $pair[1] === 'dm-standard' || $pair[1] === 'fm-standard' || $pair[1] === 'dsm-standard') {
                    echo( "<br /><strong> Finish : </strong>Mapes Standard  ");
                } else if ($pair[1] === '2-coat' || $pair[1] === 'h2-coat' || $pair[1] === 'p2-coat' || $pair[1] === 'd2-coat' || $pair[1] === 'f2-coat' || $pair[1] === 'ds2-coat') {
                    echo( "<br /><strong> Finish : </strong>2 Coat Kynar  ");
                }
                break;
            case 'm-color':
            case 'pm-color':
            case 'dm-color':
            case 'dsms-color':
            case 'hm-color':
            case 'fm-color':
                if ($pair[1] === 'clear-anodized' || $pair[1] === 'pclear-anodized' || $pair[1] === 'dclear-anodized' || $pair[1] === 'fclear-anodized' || $pair[1] === 'hclear-anodized' || $pair[1] === 'dsclear-anodized') {
                    echo( " - Clear Anodized ");
                } else if ($pair[1] === 'white-be' || $pair[1] === 'pwhite-be' || $pair[1] === 'dwhite-be' || $pair[1] === 'fwhite-be' || $pair[1] === 'hwhite-be' || $pair[1] === 'dswhite-be') {
                    echo( " - White Baked Enamel ");
                } else if ($pair[1] === 'bronze-be' || $pair[1] === 'pbronze-be' || $pair[1] === 'dbronze-be' || $pair[1] === 'fbronze-be' || $pair[1] === 'hbronze-be' || $pair[1] === 'dsbronze-be') {
                    echo( " - Bronze Baked Enamel ");
                } else if ($pair[1] === 'tba') {
                    // do nothing due to auto select
                }
                break;
            case '2ccolor' :
            case 'h2ccolor' :
            case 'p2ccolor' :
            case 'd2ccolor' :
            case 'f2ccolor' :
                if ($pair[1] === 'tba' || $pair[1] === 'htba' || $pair[1] === 'ptba' || $pair[1] === 'dtba' || $pair[1] === 'ftba' || $pair[1] === 'dstba') {
                    //echo( " To Be Advised ");
                } else if ($pair[1] === 'mwhite' || $pair[1] === 'hmwhite' || $pair[1] === 'pmwhite' || $pair[1] === 'dmwhite' || $pair[1] === 'fmwhite' || $pair[1] === 'dsmwhite' || $pair[1] === 'hmwhite') {
                    echo( " - Mapes White ");
                } else if ($pair[1] === 'bwhite' || $pair[1] === 'hbwhite' || $pair[1] === 'pbwhite' || $pair[1] === 'dbwhite' || $pair[1] === 'fbwhite' || $pair[1] === 'dsbwhite' || $pair[1] === 'hbwhite') {
                    echo( " - Bone White ");
                } else if ($pair[1] === 'sandstone' || $pair[1] === 'hsandstone' || $pair[1] === 'psandstone' || $pair[1] === 'dsandstone' || $pair[1] === 'fsandstone' || $pair[1] === 'dssandstone' || $pair[1] === 'hsandstone') {
                    echo( " - Sandstone ");
                } else if ($pair[1] === 'stan' || $pair[1] === 'hstan' || $pair[1] === 'pstan' || $pair[1] === 'dstan' || $pair[1] === 'fstan' || $pair[1] === 'dsstan' || $pair[1] === 'hstan') {
                    echo( " - Sierra Tan ");
                } else if ($pair[1] === 'pgrey' || $pair[1] === 'hpgrey' || $pair[1] === 'ppgrey' || $pair[1] === 'dpgrey' || $pair[1] === 'fpgrey' || $pair[1] === 'dspgrey' || $pair[1] === 'hpgrey') {
                    echo( " - Pebble Grey ");
                } else if ($pair[1] === 'seawolf' || $pair[1] === 'hseawolf' || $pair[1] === 'pseawolf' || $pair[1] === 'dseawolf' || $pair[1] === 'fseawolf' || $pair[1] === 'dsseawolf' || $pair[1] === 'hseawolf') {
                    echo( " - Seawolf ");
                } else if ($pair[1] === 'cgrey' || $pair[1] === 'hcgrey' || $pair[1] === 'pcgrey' || $pair[1] === 'dcgrey' || $pair[1] === 'fcgrey' || $pair[1] === 'dscgrey' || $pair[1] === 'hcgrey') {
                    echo( " - Charcoal Grey ");
                } else if ($pair[1] === 'tcotta' || $pair[1] === 'htcotta' || $pair[1] === 'ptcotta' || $pair[1] === 'dtcotta' || $pair[1] === 'ftcotta' || $pair[1] === 'dstcotta' || $pair[1] === 'htcotta') {
                    echo( " - Terra Cotta ");
                } else if ($pair[1] === 'cred' || $pair[1] === 'hcred' || $pair[1] === 'pcred' || $pair[1] === 'dcred' || $pair[1] === 'fcred' || $pair[1] === 'dscred' || $pair[1] === 'hcred') {
                    echo( " - Colonial Red ");
                } else if ($pair[1] === 'rred' || $pair[1] === 'hrred' || $pair[1] === 'prred' || $pair[1] === 'drred' || $pair[1] === 'frred' || $pair[1] === 'dsrred' || $pair[1] === 'hrred') {
                    echo( " - Regal Red ");
                } else if ($pair[1] === 'brandy' || $pair[1] === 'hbrandy' || $pair[1] === 'pbrandy' || $pair[1] === 'dbrandy' || $pair[1] === 'fbrandy' || $pair[1] === 'dsbrandy' || $pair[1] === 'hbrandy') {
                    echo( " - Brandywine ");
                } else if ($pair[1] === 'hemlock' || $pair[1] === 'hhemlock' || $pair[1] === 'phemlock' || $pair[1] === 'dhemlock' || $pair[1] === 'fhemlock' || $pair[1] === 'dshemlock' || $pair[1] === 'hhemlock') {
                    echo( " - Hemlock Green ");
                } else if ($pair[1] === 'copper' || $pair[1] === 'hcopper' || $pair[1] === 'pcopper' || $pair[1] === 'dcopper' || $pair[1] === 'fcopper' || $pair[1] === 'dscopper' || $pair[1] === 'hcopper') {
                    echo( " - Aged Copper ");
                } else if ($pair[1] === 'fgreen' || $pair[1] === 'hfgreen' || $pair[1] === 'pfgreen' || $pair[1] === 'dfgreen' || $pair[1] === 'ffgreen' || $pair[1] === 'dsfgreen' || $pair[1] === 'hfgreen') {
                    echo( " - Forest Green ");
                } else if ($pair[1] === 'hgreen' || $pair[1] === 'hhgreen' || $pair[1] === 'phgreen' || $pair[1] === 'dhgreen' || $pair[1] === 'fhgreen' || $pair[1] === 'dshgreen' || $pair[1] === 'hhgreen') {
                    echo( " - Hartford Green ");
                } else if ($pair[1] === 'caramel' || $pair[1] === 'hcaramel' || $pair[1] === 'pcaramel' || $pair[1] === 'dcaramel' || $pair[1] === 'fcaramel' || $pair[1] === 'dscaramel' || $pair[1] === 'hcaramel') {
                    echo( " - Caramel ");
                } else if ($pair[1] === 'teal' || $pair[1] === 'hteal' || $pair[1] === 'pteal' || $pair[1] === 'dteal' || $pair[1] === 'fteal' || $pair[1] === 'dsteal' || $pair[1] === 'hteal') {
                    echo( " - Teal ");
                } else if ($pair[1] === 'mblue' || $pair[1] === 'hmblue' || $pair[1] === 'pmblue' || $pair[1] === 'dmblue' || $pair[1] === 'fmblue' || $pair[1] === 'dsmblue' || $pair[1] === 'hmblue') {
                    echo( " - Military Blue ");
                } else if ($pair[1] === 'iblue' || $pair[1] === 'hiblue' || $pair[1] === 'piblue' || $pair[1] === 'diblue' || $pair[1] === 'fiblue' || $pair[1] === 'dsiblue' || $pair[1] === 'hiblue') {
                    echo( " - Interstate Blue ");
                } else if ($pair[1] === 'nhblue' || $pair[1] === 'hnhblue' || $pair[1] === 'pnhblue' || $pair[1] === 'dnhblue' || $pair[1] === 'fnhblue' || $pair[1] === 'dsnhblue' || $pair[1] === 'hnhblue') {
                    echo( " - Night Horizon Blue ");
                } else if ($pair[1] === 'mbrown' || $pair[1] === 'hmbrown' || $pair[1] === 'pmbrown' || $pair[1] === 'dmbrown' || $pair[1] === 'fmbrown' || $pair[1] === 'dsmbrown' || $pair[1] === 'hmbrown') {
                    echo( " - Mansard Brown ");
                } else if ($pair[1] === 'abronze' || $pair[1] === 'habronze' || $pair[1] === 'pabronze' || $pair[1] === 'dabronze' || $pair[1] === 'fabronze' || $pair[1] === 'dsabronze' || $pair[1] === 'habronze') {
                    echo( " - Antique Bronze ");
                } else if ($pair[1] === 'mbronze' || $pair[1] === 'hmbronze' || $pair[1] === 'pmbronze' || $pair[1] === 'dmbronze' || $pair[1] === 'fmbronze' || $pair[1] === 'dsmbronze' || $pair[1] === 'hmbronze') {
                    echo( " - Mapes Bronze ");
                } else if ($pair[1] === 'ebronze' || $pair[1] === 'hebronze' || $pair[1] === 'pebronze' || $pair[1] === 'debronze' || $pair[1] === 'febronze' || $pair[1] === 'dsebronze' || $pair[1] === 'hebronze') {
                    echo( " - Extra Dark Bronze ");
                } else if ($pair[1] === 'black' || $pair[1] === 'hblack' || $pair[1] === 'pblack' || $pair[1] === 'dblack' || $pair[1] === 'fblack' || $pair[1] === 'dsblack' || $pair[1] === 'hblack') {
                    echo( " - Black ");
                } else if ($pair[1] === 'custom' || $pair[1] === 'hcustom' || $pair[1] === 'pcustom' || $pair[1] === 'dcustom' || $pair[1] === 'fcustom' || $pair[1] === 'dscustom' || $pair[1] === 'hcustom') {
                    echo( " - Custom Color : ");
                }
                break;
            case 'custom_color' :
                echo(urldecode($pair[1]));
                break;
            case 'item' :
                echo($pair[1]);
                break;
            case 'opt_cost' :
                break;
            case 'cost' :
                if ($incl_cost === true && $line_item === true) {
                    echo("</td><td>$" . number_format($pair[1]) . " <strong>(inc)</strong></td>");
                } else {
                    echo("</td><td>$" . number_format($pair[1]) . "</td>");
                }
                break;
            case '3coat' :
                echo("<br /><strong>Additional Finish : </strong> 3rd Coat");
                break;
            case 'c_notes' :
                echo("<br /><strong>Notes : </strong>" . urldecode($pair[1]));
                break;
            default :
                break;
        }
    }
    return 1;
}

function upd_quote(&$conn) {
    // get the quote header based on the Request Info
    $hdr_query = "SELECT * FROM $_SESSION[install_lib]/QUOTEHDR WHERE QUOTE_ID=" . $_REQUEST['id'] . " AND QUOTE_VER = '" . $_REQUEST['ver'] . "'";
    $result = i5_query($hdr_query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $hdr_query;
        return;
    }
    // get the record
    $h_rec = i5_fetch_assoc($result);
    //var_dump($h_rec);
    // update the Version Number
    $ver = (int) $h_rec['QUOTE_VER'];
    $ver++;
    i5_free_query($result);
    echo("<input type='hidden' id='quoteId' value='" . $h_rec['QUOTE_ID'] . "-" . $h_rec['QUOTE_VER'] . "' />");
    $e = array('-', '.');
    $t = str_replace($e, '', $h_rec['QUOTE_TS']);
    $qdate = substr($t, 4, 2) . "/" . substr($t, 6, 2) . "/" . substr($t, 0, 4) . " " . substr($t, 8, 2) . ":" . substr($t, 10, 2);
    echo("<div id='base_quote'><div id='q_hdr'><label><strong>Quote Date : </strong>" . $qdate . "</label><br /><label><strong> Quote Number : </strong>" . $h_rec['QUOTE_ID']
    . "</label><label><strong> Version : </strong>" . $ver . "</label><br /> ");
    echo(" <label><strong>Sales Person : </strong>" . $h_rec['SALESMAN'] . "</label></div>");
    // get the customer information  
    echo("<div id='cust_info' class='cust_info'>");
    dsp_cust($conn, $h_rec['CUST_ID']);
    echo("</div><div class='pl40' style='margin-top:30px;'>");
    show_status_sel($h_rec['STATUS']);
    echo("<div id='bid_date'><br /><label for='bidDate'><strong>Bid date :  </strong></label><input type='date' id='bidDate' name='bidDate' onchange='set_bid_date(this)' value=" . $h_rec['QBIDDATE'] . " /><br /></div>");
    echo("<div id='job_name'><h1>Jobname</h1><input type='text' id='j_name' name='j_name' size='20' value='" . $h_rec['JOBNAME'] . "' onchange='set_job_name(this)' /></div>");
    // contact information
    $c_query = "SELECT * FROM $_SESSION[install_lib]/QCONTACT WHERE QUOTE_ID=" . $_REQUEST['id'] . " AND QUOTE_VER = '" . $_REQUEST['ver'] . "'";
    $result = i5_query($c_query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $c_query;
        return;
    }
    // get the record(s)
    $c_info = "";
    echo("<div id='qc'>  <h1 style='margin-bottom:-10px;'><span class='underline'>Contact Information : </span></h1><br /><div id='cur_contact_list'>");
    while ($c_rec = i5_fetch_assoc($result)) {
        $c_info .= "$c_rec[CONTACT_ID],$c_rec[FNAME],$c_rec[LNAME],$c_rec[EMAIL],$c_rec[TEL],$c_rec[C_TYPE];";
        echo("$c_rec[C_TYPE]  - $c_rec[FNAME],$c_rec[LNAME] Telephone : $c_rec[TEL] Email : $c_rec[EMAIL]<br />");
    }
    echo("</div>");
    i5_free_query($result);
    bld_contact_sel($conn, $h_rec['CUST_ID']);
    echo( "</div></div><hr />");
    // Add Quote Line or Line Item buttons
    echo("<div id='quote_btn'><input type='button' id='toggle_q' name='toggle_q' value='Add Quote Line' onclick='toggle_quote(this)'>");
    echo("<input type='button' id='toggle_l' name='toggle_l' value='Add Line Item' onclick='toggle_quote(this)'></div>");
    // Quote lines
    echo("<div id='table_div' class='table_wrapper'><table id='upd_quote_table' class='dft_table' ><thead><tr><th class='qty'>Qty</th><th>Description</th><th>Cost</th><th>Action</th></tr></thead><tbody>");
    $l_query = "SELECT * FROM $_SESSION[install_lib]/QUOTELINE  WHERE QUOTE_ID=" . $_REQUEST['id'] . " AND QUOTE_REV = '" . $_REQUEST['ver'] . "'";
    $result = i5_query($l_query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $l_query;
        return;
    }
    // display the table
    // get the record(s)
    $q_string = "";
    while ($l_rec = i5_fetch_assoc($result)) {
        echo("<tr>");
        show_qline($l_rec['LINEDETS']);
        // add the action buttons
        if (strpos($l_rec['LINEDETS'], 'l-qty') !== false) {
            echo("<td><input type='button' onclick='rmv_item_line(this)' value='Remove'><input type='button' onclick='dsp_upd_line(this)' value='Update'></td></tr>");
        } else {
            echo("<td><input type='button' onclick='remove_line(this)' value='Remove'><input type='button' onclick='dsp_upd_line(this)' value='Update'></td></tr>");
        }
        // also add to the form table so it can be retrieved
        $q_string .= str_replace("'", "\'", $l_rec['LINEDETS']) . ";";
        //echo($q_string);
    }
    echo("</tbody></table></div>");
    i5_free_query($result);
    // display the totals
    echo("<div id='quote_footer' class='pl40'><table id='costing'><tr> <td colspan='5'><h1><span class='underline'>Costs</span></h1></td></tr>"
    . "<tr><td><strong>Stamped Calcs : </strong></td><td colspan='2'>"
    . "<label for='stamp_inc'>Included<input type='radio' name='stamped' id='included'  onchange='set_stamp(this)' ");
    if ($h_rec['CALCS'] === 'I') {
        echo(" checked");
    }
    echo("/></label>"
    . "<label for='stamp_line'>Line Item<input type='radio' name='stamped' id='line_item'  onchange='set_stamp(this)' ");
    if ($h_rec['CALCS'] === 'L') {
        echo(" checked");
    }
    echo("/></label></td><td colspan='2'>&nbsp;</td></tr>");
    echo("</td><td colspan='2'>&nbsp;</td></tr>");
    echo("<tr><td><strong>Freight : </strong></td><td><input type='text' class='text_r' id='f_est' size='10' name='f_est' placeholder='Freight' value='$" . number_format($h_rec['F_EST']) . "'  disabled /></td>"
    . "<td><strong>Weight llbs: </strong></td><td><input type='text' class='text_r' id='t_weight' size='10' name='t_weight' placeholder='Total Weight' value='" . number_format($h_rec['T_WEIGHT'], 2) . "lbs' disabled /></td><td>&nbsp;</td></tr>"
    . "<tr><td><strong>Total Sqft : </strong></td><td><input type='text' class='text_r' id='total_sqft' size='10' name='total_sqft' placeholder='Total Sqft' value='$h_rec[TOTSQFT]' disabled /></td><td colspan='3'>&nbsp;</td></tr>");
    echo("<tr><td nowrap><strong>As Specified :</strong> </td><td><input type='text' class='text_r' id='total_a' size='10' name='total_a' placeholder='As Specified' value='$" . number_format($h_rec['TCOST']) . "' onchange='reset_tcost(this)' /></td>"
    . "<td nowrap><strong>Cost Sqft : </strong></td><td><input type='text' class='text_r' id='cost_sqfta' size='10' name='cost_sqfta' placeholder='Cost per sqft' disabled value='$" . number_format($h_rec['C_SQFTA'], 2) . "' /></td>"
    . "<td nowrap>"
    . "<label for='0ua'> Comp : <input type='text' size='10' id='0ua' name='0ua' placeholder='0%'  readonly onclick='set_tcost(this,1.0)' value='$" . number_format(round($h_rec['OCOST_A'] * 1.0), 0) . "'/></label>"
    . "<label for='5ua'> 5% : <input type='text' size='10' id='5ua' name='5ua' placeholder='5%'  readonly onclick='set_tcost(this,1.05)' value='$" . number_format(round($h_rec['OCOST_A'] * 1.05), 0) . "'/></label>"
    . "<label for='10ua'> 10% : <input type='text' size='10' id='10ua' name='10ua' placeholder='10%'  readonly onclick='set_tcost(this,1.10)' value='$" . number_format(round($h_rec['OCOST_A'] * 1.10), 0) . "'/></label>"
    . "<label for='15ua'> 15% : <input type='text' size='10' id='15ua' name='15ua' placeholder='15%'  readonly onclick='set_tcost(this,1.15)' value='$" . number_format(round($h_rec['OCOST_A'] * 1.15), 0) . "'/></label>"
    . "<label for='20ua'> 20% : <input type='text' size='10' id='20ua' name='20ua' placeholder='20%'  readonly  onclick='set_tcost(this,1.20)' value='$" . number_format(round($h_rec['OCOST_A'] * 1.20), 0) . "'/></label>"
    . "<label for='25ua'> 25% : <input type='text' size='10' id='25ua' name='25ua' placeholder='25%'  readonly onclick='set_tcost(this,1.25)' value='$" . number_format(round($h_rec['OCOST_A'] * 1.25), 0) . "'/></label>"
    . "<label for='30ua'> 30% : <input type='text' size='10' id='30ua' name='30ua' placeholder='30%'  readonly onclick='set_tcost(this,1.30)' value='$" . number_format(round($h_rec['OCOST_A'] * 1.30), 0) . "'/></label></td></tr>");
    echo("<tr><td nowrap><strong>Standard Finish :</strong> </td><td><input type='text' class='text_r' id='total_sf' size='10' name='total_sf' placeholder='Standard'  value='$" . number_format(round($h_rec['TCOST_M'])) . "' onchange='reset_tcost(this)'  /></td>"
    . "<td nowrap><strong>Cost Sqft : </strong></td><td><input type='text' class='text_r' id='cost_sqftm' size='10' name='cost_sqftm' placeholder='Cost per sqft' value='$" . number_format($h_rec['C_SQFT'], 2) . "'  disabled /></td>"
    . "<td nowrap>"
    . "<label for='u'> Comp : <input type='text' size='10' id='0u' name='0u' placeholder='0%'  readonly onclick='set_tcost(this,1.0)' value='$" . number_format(round($h_rec['OCOST_M'] * 1.0), 0) . "'/></label>"
    . "<label for='5u'> 5% : <input type='text' size='10' id='5u' name='5u' placeholder='5%'  readonly onclick='set_tcost(this,1.05)' value='$" . number_format(round($h_rec['OCOST_M'] * 1.05), 0) . "'/></label>"
    . "<label for='10u'> 10% : <input type='text' size='10' id='10u' name='10u' placeholder='10%'  readonly onclick='set_tcost(this,1.10)' value='$" . number_format(round($h_rec['OCOST_M'] * 1.10), 0) . "'/></label>"
    . "<label for='15u'> 15% : <input type='text' size='10' id='15u' name='15u' placeholder='15%'  readonly onclick='set_tcost(this,1.15)' value='$" . number_format(round($h_rec['OCOST_M'] * 1.15), 0) . "'/></label>"
    . "<label for='20u'> 20% : <input type='text' size='10' id='20u' name='20u' placeholder='20%'  readonly onclick='set_tcost(this,1.20)' value='$" . number_format(round($h_rec['OCOST_M'] * 1.20), 0) . "'/></label>"
    . "<label for='25u'> 25% : <input type='text' size='10' id='25u' name='25u' placeholder='25%'  readonly onclick='set_tcost(this,1.25)' value='$" . number_format(round($h_rec['OCOST_M'] * 1.25), 0) . "'/></label>"
    . "<label for='30u'> 30% : <input type='text' size='10' id='30u' name='30u' placeholder='30%'  readonly onclick='set_tcost(this,1.30)' value='$" . number_format(round($h_rec['OCOST_M'] * 1.30), 0) . "'/></label></td></tr>");
    echo("<tr><td><strong>2 Coat Finish : </strong></td><td><input type='text' class='text_r' id='total_2c' size='10' name='total_2c' placeholder='2 Coat'  value='$" . number_format(round($h_rec['TCOST_S'])) . "' onchange='reset_tcost(this)' /></td>"
    . "<td><strong>Cost Sqft : </strong></td><td><input type='text' class='text_r' id='cost_sqft2' size='10' name='cost_sqft2' placeholder='Cost per sqft'  value='$" . number_format($h_rec['C_SQFT2'], 2) . "' disabled/></td>"
    . "<td nowrap>"
    . "<label for='0u2'> Comp : <input type='text' size='10' id='0u2' name='0u2' placeholder='0%'  readonly onclick='set_tcost(this,1.0)' value='$" . number_format(round($h_rec['OCOST_S'] * 1.0), 0) . "'/></label>"
    . "<label for='5u2'> 5% : <input type='text' size='10' id='5u2' name='5u2' placeholder='5%'  readonly onclick='set_tcost(this,1.05)' value='$" . number_format(round($h_rec['OCOST_S'] * 1.05), 0) . "'/></label>"
    . "<label for='10u2'> 10% : <input type='text' size='10' id='10u2' name='10u2' placeholder='10%'  readonly onclick='set_tcost(this,1.10)' value='$" . number_format(round($h_rec['OCOST_S'] * 1.10), 0) . "'/></label>"
    . "<label for='15u2'> 15% : <input type='text' size='10' id='15u2' name='15u2' placeholder='15%'  readonly onclick='set_tcost(this,1.15)' value='$" . number_format(round($h_rec['OCOST_S'] * 1.15), 0) . "'/></label>"
    . "<label for='20u2'> 20% : <input type='text' size='10' id='20u2' name='20u2' placeholder='20%'  readonly onclick='set_tcost(this,1.20)' value='$" . number_format(round($h_rec['OCOST_S'] * 1.20), 0) . "'/></label>"
    . "<label for='25u2'> 25% : <input type='text' size='10' id='25u2' name='25u2' placeholder='25%'  readonly onclick='set_tcost(this,1.25)' value='$" . number_format(round($h_rec['OCOST_S'] * 1.25), 0) . "'/></label>"
    . "<label for='30u2'> 30% : <input type='text' size='10' id='30u2' name='30u2' placeholder='30%'  readonly onclick='set_tcost(this,1.30)' value='$" . number_format(round($h_rec['OCOST_S'] * 1.30), 0) . "'/></label></td></tr></table></div>");

    // show the 3rd coat line.
    echo("<div id='price_calcs' class='pl40'>
                <h1><span class='underline'>Add 3rd coat</span></h1>
                <label for='3co'> Cost : <input type='text' size='10' id='3c0' name='3c0' placeholder='Cost' readonly  value='$" . number_format($h_rec['TCOST_3'], 0) . "' /></label>
                <label for='3c5'> 5% : <input type='text' size='10' id='3c5' name='3c5' placeholder='5%' readonly onclick='set_tcost(this,1.05)' value='$" . number_format(round($h_rec['TCOST_3'] * 1.05), 0) . "' /></label>
                <label for='3c10'> 10% : <input type='text' size='10' id='3c10' name='3c10' placeholder='10%' readonly onclick='set_tcost(this,1.10)' value='$" . number_format(round($h_rec['TCOST_3'] * 1.10), 0) . "' /></label>
                <label for='3c15'> 15% : <input type='text' size='10' id='3c15' name='3c15' placeholder='15%' readonly onclick='set_tcost(this,1.15)' value='$" . number_format(round($h_rec['TCOST_3'] * 1.15), 0) . "' /></label>
                <label for='3c20'> 20% : <input type='text' size='10' id='3c20' name='3c20' placeholder='20%' readonly onclick='set_tcost(this,1.20)' value='$" . number_format(round($h_rec['TCOST_3'] * 1.20), 0) . "' /></label>
                <label for='3c25'> 25% : <input type='text' size='10' id='3c25' name='3c25' placeholder='25%' readonly onclick='set_tcost(this,1.25)' value='$" . number_format(round($h_rec['TCOST_3'] * 1.25), 0) . "' /></label>
                <label for='3c30'> 30% : <input type='text' size='10' id='3c30' name='3c30' placeholder='30%' readonly onclick='set_tcost(this,1.30)' value='$" . number_format(round($h_rec['TCOST_3'] * 1.30), 0) . "' /></label>
            </div>");
    // display any notes added to the quote    
    echo("<div class='table_wrapper'> <h1><span class='underline'>Notes</span></h1><table id='quote_notes_table'><thead><tr><th>Date Time</th><th>User</th><th>Note</th></tr></thead><tbody>");
    $n_query = "SELECT * FROM $_SESSION[install_lib]/QNOTES WHERE QUOTE_ID=" . $_REQUEST['id'] . " AND QUOTE_VER = '" . $_REQUEST['ver'] . "'";
    $result = i5_query($n_query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $n_query;
        return;
    }
    $num_rows = i5_num_rows($result);
    if ($num_rows === 0) {
        echo("<tr><td colspan='3'><strong>No records found</strong></td></tr>");
        i5_free_query($result);
    } else {
        while ($n_rec = i5_fetch_assoc($result)) {
            // format the time stamp
            //20170407174523771380
            $date = cvt_ts_date($n_rec['TS']);
            echo("<tr><td>$date</td><td>$n_rec[USRNAME]</td><td>$n_rec[NOTE]</td></tr>");
        }
        i5_free_query($result);
    }
    echo("</tbody></table>");
    echo("<input type='text' id='new_note' name='new_note' maxlength='355' size='175' placeholder='Enter a Note...' onchange='add_new_note(this)' />");
    echo("</div>");
    // The Quote form which is updated.
    echo("<input type='hidden' name='upd_str' id='upd_str' />");
    echo("<input type='hidden' name='last_canopy_cost' id='last_canopy_cost' value='0'/>");
    echo("<div id='q_content' style='display:none;' >");
    echo("<form id='content_form' method='post' action='/scripts/upd_quote.php'>");
    echo("<input type='hidden' name='custid' id='custid' value='$h_rec[CUST_ID]' />");
    echo("<input type='hidden' name='q_num' id='q_num' value='$h_rec[QUOTE_ID]' />");
    echo("<input type='hidden' name='q_ver' id='q_ver' value='$ver' />");
    echo("<input type='hidden' name='contact_info' id='contact_info' value='$c_info'  />");
    echo("<input type='hidden' name='f_rate' id='f_rate' value='$_SESSION[freight_cost]' />");
    echo("<input type='hidden' name='tcost_a' id='tcost_a' value='$h_rec[TCOST]'   />");
    echo("<input type='hidden' name='tcost_m' id='tcost_m' value='$h_rec[TCOST_M]'   />");
    echo("<input type='hidden' name='tcost_s' id='tcost_s' value='$h_rec[TCOST_S]'   />");
    echo("<input type='hidden' name='ocost_a' id='ocost_a' value='$h_rec[OCOST_A]'   />");
    echo("<input type='hidden' name='ocost_m' id='ocost_m' value='$h_rec[OCOST_M]'   />");
    echo("<input type='hidden' name='ocost_s' id='ocost_s' value='$h_rec[OCOST_S]'   />");
    echo("<input type='hidden' name='tcost_3' id='tcost_3' value='$h_rec[TCOST_3]'   />");
    echo("<input type='hidden' name='tcost' id='tcost' value='$h_rec[TCOST]'  />");
    echo("<input type='hidden' name='totsqft' id='totsqft' value='$h_rec[TOTSQFT]' />");
    echo("<input type='hidden' name='fest' id='fest' value='$h_rec[F_EST]' />");
    echo("<input type='hidden' name='jobname' id='jobname' value='$h_rec[JOBNAME]'  />");
    echo("<input type='hidden' name='ship_rrn' id='ship_rrn' value='$h_rec[SHIP_RRN]' />");
    echo("<input type='hidden' name='csqftm' id='csqftm' value='$h_rec[C_SQFT]' />");
    echo("<input type='hidden' name='csqft2' id='csqft2' value='$h_rec[C_SQFT2]' />");
    echo("<input type='hidden' name='csqfta' id='csqfta' value='$h_rec[C_SQFTA]' />");
    echo("<input type='hidden' name='tweight' id='tweight' value='$h_rec[T_WEIGHT]' />");
    echo("<input type='hidden' name='stamped_calcs' id='stamped_calcs' value='$h_rec[CALCS]'  />");
    echo("<input type='hidden' name='q_note' id='q_note'  value=''/>");
    echo("<input type='hidden' name='qBidDate' id='qBidDate' value='$h_rec[QBIDDATE]'/>");
    echo("<input type='text' id='quote_lines' name='quote_lines' style='display:none;' value=$q_string onchange='show_q_upd()' />");
    echo("<input type='text' id='price_lines' name='price_lines' style='display:none;' value='' />");
    echo("<div id='form_sbm'><input type='submit'  id='update_btn' value='Update Quote' /></div></form></div>");
    echo("<input id='close_btn' type='button' onclick='self.close()' value='Cancel' />");
    echo("<input type='text' id='add_line' name='add_line' size='1' maxlength='1' style='display:none;'>");
    return 1;
}

function dsp_shipaddr(&$conn) {
    $query = "select RRN(a) as RRN,a.* from $_SESSION[install_lib].SHIPDETS as a WHERE CUST_ID=$_REQUEST[id]";
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $n_query;
        return;
    }
    $rows = i5_num_rows($result);
    if ($rows == 0) {
        echo("<tr><td colspan='2'><strong>No records found</strong></td></tr>");
        i5_free_query($result);
        return 1;
    } else {
        while ($rec = i5_fetch_assoc($result)) {
            // create the address
            $s_address = '';
            if (isset($rec['SHIPADDR_1'])) {
                $s_address .= $rec['SHIPADDR_1'] . ' ';
            }
            if (isset($rec['SHIPADDR_2'])) {
                $s_address .= $rec['SHIPADDR_2'] . ' ';
            }
            if (isset($rec['SHIPADDR_3'])) {
                $s_address .= $rec['SHIPADDR_3'] . ' ';
            }
            if (isset($rec['SHIPCITY'])) {
                $s_address .= $rec['SHIPCITY'] . ' ';
            }
            if (isset($rec['SHIPSTATE'])) {
                $s_address .= $rec['SHIPSTATE'] . ' ';
            }
            if (isset($rec['SHIPCNTRY'])) {
                $s_address .= $rec['SHIPCNTRY'] . ' ';
            }
            if (isset($rec['SHIPZIP'])) {
                $s_address .= $rec['SHIPZIP'] . ' ';
            }
            // need to calc the distance to the ship address
            if ($rec['DIST'] === '0') {
                // do the same calcs as adding for customer address
                if ($rec['LAT'] === '0.0' || $rec['LNG'] === '0.0') {
                    //form the address
                    $address = $rec['SHIPADDR_1'];
                    if ($rec['SHIPADDR_2'] !== '') {
                        $address .= " " . $rec['SHIPADDR_2'];
                    }
                    if ($rec['SHIPADDR_3'] !== '') {
                        $address .= " " . $rec['SHIPADDR_3'];
                    }
                    $address .= " " . $rec['SHIPCITY'] . " " . $rec['SHIPSTATE'];
                    if ($rec['SHIPCNTRY'] !== '') {
                        $address .= " " . $rec['SHIPCNTRY'];
                    }
                    $address .= " " . $rec['SHIPZIP'];
                    // get the lat lng from google maps
                    $req_addr = urlencode($address);
                    $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . $req_addr . "&key=" . $_SESSION['mapkey'];
                    $resp_json = file_get_contents($url);
                    $resp = json_decode($resp_json, true);
                    if ($resp['status'] === 'OK') {
                        $lat = $resp['results'][0]['geometry']['location']['lat'];
                        $lng = $resp['results'][0]['geometry']['location']['lng'];
                        // now get the map distance
                        $dist = '0';
                        $start = "40.8879067,-96.6425269";
                        $end = $lat . "," . $lng;
                        $d_url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" . $start . "&destinations=" . $end . "&key=" . $_SESSION['mapkey'];
                        $resp_json = file_get_contents($d_url);
                        $resp = json_decode($resp_json, true);
                        if ($resp['status'] === 'OK') {
                            // distance value is always returned in meters so need to convert to miles
                            $dist = round($resp['rows'][0]['elements'][0]['distance']['value'] / 1609);
                            // update the file
                            $query = "UPDATE $_SESSION[install_lib].SHIPDETS SET LAT=$lat,LNG=$lng,DIST=$dist WHERE CUST_ID=$_REQUEST[id]";
                            $result_1 = i5_query($query, $conn);
                        }
                    }
                }
            } else {
                $dist = $rec['DIST'];
            }
            echo("<tr><td><a class='btn' href='scripts/rmv_shipaddr.php?rrn=" . $rec['RRN'] . "'>Remove</a></td><td>$s_address</td><td>$rec[DIST]</td></tr>");
        }
    }
    return 1;
}

function show_status_sel($status) {
    $sts_arr = array('A' => 'Active', 'W' => 'Won', 'L' => 'Lost', 'P' => 'Pending', 'R' => 'Revised');
    $select = "<label><strong>Quote Status : </strong></label> <select name='sts_sel' id='sts_sel' onchange='upd_quote_sts(this)' >";
    foreach ($sts_arr as $key => $value) {
        $select .= "<option value=" . $key;
        if ($key === $status) {
            $select .= " selected ";
        }
        $select .= " >" . $value . "</option>";
    }
    $select .= "</select>";
    echo($select);
    return 1;
}

function dsp_filter_sel($status, $id) {
    $sts_arr = array('ALL' => 'All', 'A' => 'Active', 'W' => 'Won', 'L' => 'Lost', 'P' => 'Pending', 'R' => 'Revised');
    $select = "<select name='sts_sel' id='sts_sel' onchange='set_quote_filter(this,$id)' >";
    foreach ($sts_arr as $key => $value) {
        $select .= "<option value=" . $key;
        if ($key === $status) {
            $select .= " selected ";
        }
        $select .= " >" . $value . "</option>";
    }
    $select .= "</select>";
    echo($select);
    return 1;
}

function dsp_expiring_quotes($conn) {
    // create a time stamp
    $ts = date('Y-m-d-h.i.s.', time() - ($_SESSION['max_days'] * 24 * 60 * 60)) . '0000000';
    // create the selector
    // list all quotes that have expired
    $query = "SELECT DISTINCT * from $_SESSION[install_lib]/QUOTE_V2 WHERE SALESMAN='" . $_SESSION['valid_usr'] . "' AND STATUS='A' AND QUOTE_TS < '" . $ts . "' ORDER BY QUOTE_ID";
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    $qid = '';
    $i = 0;
    while ($rec = i5_fetch_assoc($result)) {
        $i++;
        $quote_date = cvt_ts_date($rec['QUOTE_TS']);
        echo("<tr><td><input type='checkbox' id='q_act_" . $rec['QUOTE_ID'] . "' value='" . $rec['QUOTE_ID'] . "-" . $rec['QUOTE_VER'] . "' /></td><td>"
        . "<a href='dspCustomer.php?id=" . $rec['CUST_ID'] . "' target=_BLANK >" . $rec['NAME'] . "</a></td><td>" . $quote_date . "</td><td>"
        . "<a href='dspQuote.php?id=" . $rec['QUOTE_ID'] . "&ver=" . $rec['QUOTE_VER'] . "' target=_BLANK>" . $rec['QUOTE_ID'] . "-" . $rec['QUOTE_VER'] . "</a></td>"
        . "<td> $" . number_format($rec['TCOST_M'], 0) . "</td><td> $" . number_format($rec['TCOST_S'], 0) . "</td><td>" . $rec['JOBNAME'] . "</td><td>" . $rec['STATUS'] . "</td><td>");
        if ($rec['EMAIL'] != '') {
            if ($rec['LASTREM'] != '0001-01-01-00.00.00.000000') {
                $last_rem = cvt_ts_date($rec['LASTREM']);
                echo($last_rem . "</td><td>");
            } else {
                echo(" </td><td>");
            }
            $qv = $rec['QUOTE_ID'] . "-" . $rec['QUOTE_VER'];
            $sig = urlencode($_SESSION['em_signature']);
            $cont = urlencode($_SESSION['em_content']);
            echo("<input type='button' value='Email reminder' class='btn' onclick='send_expired_email(\"$rec[EMAIL]\",\"$qv\",\"$rec[JOBNAME]\",\"$rec[FNAME]\",\"$rec[LNAME]\",\"$sig\",\"$cont\",$rec[CUST_ID])' />");
        } else {
            echo("</td><td>");
        }
        echo("</td></tr>");
    }
    i5_free_query($result);
    return $i;
}

function dsp_bids_due(&$conn) {
    // get date 30 days in advance
    $ts = date('Y-m-d', time() + (30 * 24 * 60 * 60)); // 2,592,000 seconds
    $query = "select DISTINCT * from $_SESSION[install_lib]/QUOTE_V2 WHERE SALESMAN ='" . $_SESSION['valid_usr'] . "' AND STATUS='A' AND QBIDDATE < '" . $ts . "' AND QBIDDATE != '0001-01-01' ORDER BY QBIDDATE";
    //echo($query);
    $result = i5_query($query, $conn);
    if (!$result) {
        $_SESSION['ErrMsg'] .= "Error code: " . i5_errno() . "<br />Error message: " . i5_errormsg() . "<br />" . $query;
        return;
    }
    $num_rows = i5_num_rows($result);
    //echo($num_rows);
    if ($num_rows > 0) {
        // we only display content if there is some
        echo("<div class='table_wrapper'><h2>Bids Coming Due</h2>");
        echo("<div id='qBidsDue'><table id='bids_due' class='dft_table'><thead><tr><th style='min-width:300px;'>Customer Name</th><th>Bid Due date</th><th>Quote#</th><th>Standard</th><th>Kynar</th><th>Job Name</th><th>Status</th>"
        . "<th>Last Reminder</th><th>&nbsp;</th></tr></thead><tbody>");
        $i = 0;
        while ($rec = i5_fetch_assoc($result)) {
            echo("<tr><td><a href='dspCustomer.php?id=" . $rec['CUST_ID'] . "' target=_BLANK>" . $rec['NAME'] . "</a></td><td>" . $rec['QBIDDATE'] . "</td><td>"
            . "<a href='dspQuote.php?id=" . $rec['QUOTE_ID'] . "&ver=" . $rec['QUOTE_VER'] . "' target=_BLANK>" . $rec['QUOTE_ID'] . "-" . $rec['QUOTE_VER'] . "</a></td><td> $" . number_format($rec['TCOST_M'], 0));
            echo("</td><td> $" . number_format($rec['TCOST_S'], 0) . "</td><td>" . $rec['JOBNAME'] . "</td><td>" . $rec['STATUS'] . "</td><td>");
            if ($rec['LASTREM'] != '0001-01-01-00.00.00.000000') {
                $last_rem = cvt_ts_date($rec['LASTREM']);
                echo($last_rem . "</td><td>");
            } else {
                echo(" </td><td>");
            }
            echo("<td style='min-width:210px;'><a class='btn' href=updQuote.php?id=" . $rec['QUOTE_ID'] . "&ver=" . $rec['QUOTE_VER'] . " target='_BLANK' >Upd</a>");
            if ($rec['EMAIL'] != '') {
                $qv = $rec['QUOTE_ID'] . "-" . $rec['QUOTE_VER'];
                $sig = urlencode($_SESSION['em_signature']);
                $cont = urlencode($_SESSION['em_content']);
                echo("<input type='button' value='Email reminder' class='btn' onclick='send_expired_email(\"$rec[EMAIL]\",\"$qv\",\"$rec[JOBNAME]\",\"$rec[FNAME]\",\"$rec[LNAME]\",\"$sig\",\"$cont\",$rec[CUST_ID])' /></td></tr>");
            } else {
                echo("&nbsp;</td></tr>");
            }
            $i++;
        }
        echo("</tbody></table><label>Showing : " . $i . "</label></div></div>");
    }
    return 1;
}
