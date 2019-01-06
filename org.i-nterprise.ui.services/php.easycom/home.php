<!DOCTYPE html>
<!--
Copyright 2018 chrish.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<html>
    <head>
        <?php
        // start the session to allow  session variables to be stored and addressed
        session_start();
        $_SESSION['ret_url'] = "http" . (isset($_SERVER['HTTPS']) ? 's' : '') . '://' . "{$_SERVER['HTTP_HOST']}/{$_SERVER['REQUEST_URI']}";
        $page_title = "Home Page";
        // include the file which holds the user info for the connection plus any configurable
        // information such as the number of rows to show per page.
        require_once("scripts/functions.php");
        if (!isset($_SESSION['server'])) {
            load_config();
            }
        ?>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="jscripts/functions.js" ></script>
        <link rel='stylesheet' href="css/ierp.css" />
        <title><?php echo($page_title); ?></title>
    </head>
    <body>
        <section>
        <?php
        require_once 'includes/header.php';
        // put your code here
        echo("Home Page");
        require_once 'includes/footer.php';
        ?>
        </section>
    </body>
</html>
