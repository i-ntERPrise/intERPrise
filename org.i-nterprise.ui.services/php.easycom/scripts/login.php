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

// allow session variables
session_start();
$conn = 0;
require_once"functions_easy.php";
$prf = strtoupper($_POST['usr']);
// do not allow sign in with following profiles
if (($prf === "QDBSHR") ||
        ($prf === "QDOC") ||
        ($prf === "QLPAUTO") ||
        ($prf === "QLPINSTALL") ||
        ($prf === "QRJE") ||
        ($prf === "QSECOFR") ||
        ($prf === "QSPL") ||
        ($prf === "QDFTOWN") ||
        ($prf === "QTSTRQS") ||
        ($prf === "QSYSOPR") ||
        ($prf === "QSYS")) {
    $_SESSION['Err_Msg'] = "Cannot use user profile " . $_POST['usr'] . " for connection";
    header('Location: /index.php');
    exit(0);
}
// push to session so connect works
$_SESSION['usr'] = $_POST['usr'];
$_SESSION['pwd'] = $_POST['pwd'];
// connect to the remote system
if (connect($conn) == -1) {
    $_SESSION['Pwd_Err'] = 1;
    $_SESSION['usr'] = "";
    $_SESSION['pwd'] = "";
    $_SESSION['valid_usr'] = NULL;
    header('Location: /index.php');
    exit(0);
}
$_SESSION['valid_usr'] = $_POST['usr'];
header('Location: /index.php');
exit(0);