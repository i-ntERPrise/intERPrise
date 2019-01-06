//
// Copyright (c) 2018 Shield Advanced Solutions Ltd
// Created by Shield advanced Solutions Ltd - www.shieldadvanced.com
// Original code : Chris Hird Director
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// The above copyright notice and this permission notice shall be included in all copies
// or substantial portions of the Software.
#include <H/COMMON>                              // common header
#include <H/MSGFUNC>                             // message functions
#include <H/SVRFUNC>                             // Server functions
#include <quscrtui.h>                            // create user index

int main(int argc, char **argv) {
char extAtr[10] = "          ";                  // Extended Attr
char entryLen = 'F';                             // Fixed length
char keyInsert = '1';                            // non keyed
char update = '1';                               // update to Aux Stg
char optimize = '0';                             // Optimize for random requests
char pubAut[10] = "*EXCLUDE  ";                  // Public Authority
char text[50] = " ";                             // description
char replace[10] = "*YES      ";                 // replace
char Idx[20] = _SESS_IDX;                        // User Index name
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
QUSCRTUI(_SESS_IDX,
         extAtr,
         &entryLen,
         _IDX_ENT_LEN,
         &keyInsert,
         _IDX_KEY_LEN,
         &update,
         &optimize,
         pubAut,
         text,
         replace,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
return 1;
}
