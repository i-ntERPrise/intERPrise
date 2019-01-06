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

session_start();
include('functions_easy.php');
// send a request to end the job on the system
$conn = 0;
if (connect($conn) == 1) {
    i5_pclose($conn);
}
$_SESSION = array();
// destroy all session variables
session_destroy();
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time() - 42000, '/');
}
//return to index page
header("Location: ../index.php");
exit(0);
