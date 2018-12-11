<!DOCTYPE html>
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
?>
<html>
    <head>
        <?php
        // start the session to allow  session variables to be stored and addressed
        session_start();
        $_SESSION['ret_url'] = "http" . (isset($_SERVER['HTTPS']) ? 's' : '') . '://' . "{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
        $page_title = "Login";
        // include the file which holds the user info for the connection plus any configurable
        // information such as the number of rows to show per page.
        require_once("scripts/functions.php");
        if (!isset($_SESSION['server'])) {
            load_config();
        }
        ?>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href="css/ierp.css" />
        <script src="jscripts/functions.js" ></script>
        <title><?php echo($page_title); ?></title>
    </head>
    <body>
        <section>
            <?php
            // header include
            require_once 'includes/header.php';
            // if already signed on push to home page
            if (isset($_SESSION['valid_usr'])) {
                header("Location: /home.php");
                exit(0);
            }
            ?>
            <!-- show the sign on form -->
            <div class="si">
                <form action="scripts/login.php" class="si_form" method="post">
                    <div class="imgcontainer">
                        <img src="images/sas_logo.png" alt="Company Logo" class="c_logo">
                    </div>
                    <div class="si_container">
                        <label for="usr"><b>Username</b></label><input type="text" placeholder="Enter Username" id="usr" name="usr" class="si_input" required>
                        <label for="pwd"><b>Password</b></label><input type="password" placeholder="Enter Password" id="pwd" name="pwd" class="si_input" required>
                        <button type="submit" class="si_button">Login</button>
                        <label for="remember"><input type="checkbox" checked="checked" name="remember" id="remember">Remember me</label>
                    </div>
                    <div class="si_container" >
                        <p class="errmsg"><?php 
                        if (isset($_SESSION['ErrMsg'])) {
                            echo($_SESSION['ErrMsg']);
                            $_SESSION['ErrMsg'] = '';
                        } ?>
                        </p>
                    </div>
                </form> 
            </div><!-- end of signon -->
            <?php
            // footer file
            require_once'includes/footer.php';
            ?>
        </section>
    </body>
</html>
