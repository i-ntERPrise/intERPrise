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

function load_config() {
    $config_file = "scripts/i-erp.conf";
    $comment = "#";
    // open the config file
    $fp = fopen($config_file, "r");
    if (!$fp) {
        echo("Failed to open file");
        return 0;
    }
    // loop through the file lines and pull out variables
    while (!feof($fp)) {
        $line = trim(fgets($fp));
        if ($line && $line[0] != $comment) {
            $pieces = explode("=", $line);
            $option = trim($pieces[0]);
            $value = trim($pieces[1]);
            $config_values[$option] = $value;
        }
    }
    fclose($fp);
    $_SESSION['install_lib'] = $config_values['install_lib'];
    $_SESSION['server'] = $config_values['server'];
    $_SESSION['timeout'] = $config_values['timeout'];
    $_SESSION['appname'] = $config_values['appname'];
    $_SESSION['h_logo'] = $config_values['h_logo'];
    $_SESSION['si_logo'] = $config_values['si_logo'];
    $_SESSION['copyr'] = $config_values['copyr'];
    return 1;
}
/**
 * Function dsp_login()
 * Purpose: to display the login dialog
 * @parms
 *      NONE
 * @return int
 */
function dsp_login() {
    
    return 1;
}