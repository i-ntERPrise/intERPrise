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
<div class="header">
    <!-- display the logo -->
    <img src="  ../images/h_logo.png" alt="intERPrise Logo" class="h_logo" />
    <?php
    // display the navigation bar
    if(isset($_SESSION['valid_usr'])) {
        echo("<input type='button' class='btn c_btn' value='Sign out' onclick='location=\"scripts/logout.php\"' />");
    }
    ?>
</div>