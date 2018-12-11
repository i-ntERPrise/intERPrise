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
<div class="footer">
    <div class="f_nav">   
        <p class="cpr">
            Copyright &copy; <?php
            $copyYear = 1997; // Set your website start date
            $curYear = date('Y'); // Keeps the second year updated
            echo($copyYear . (($copyYear != $curYear) ? '-' . $curYear : '') ." " .$_SESSION['copyr']);
            ?>    
        </p>
    </div>
</div>