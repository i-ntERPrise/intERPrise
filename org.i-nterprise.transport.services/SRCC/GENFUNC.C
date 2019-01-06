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

#include <H/GENFUNC>                             // General functions
#include <H/MSGFUNC>                             // message funcs

// function get_lpp_status()
// Purpose to retrieve the status of a LPP
// @parms
//      LPP
// returns status

int get_lpp_status(char *lpp,
                   char *ver,
                   char *opt) {
char msg_dta[_MAX_MSG];                          // message buffer
Qsz_Product_Info_Rec_t Prd_Inf;                  // Prod Info Struct
Qsz_PRDR0100_t Prod_Dets;                        // returned data
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
memcpy(Prd_Inf.Product_Id,lpp,7);
memcpy(Prd_Inf.Release_Level,ver,6);
memcpy(Prd_Inf.Product_Option,opt,4);
memcpy(Prd_Inf.Load_Id,"*CODE     ",10);
QSZRTVPR(&Prod_Dets,
         sizeof(Prod_Dets),
         "PRDR0100",
         &Prd_Inf,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   // not installed
   if(memcmp(errorCode.EC.Exception_Id,"CPF0C1F",7) == 0) {
      return 0;
      }
   else {
      return -1;
      }
   }
if(memcmp(Prod_Dets.Symbolic_Load_State,"*INSTALLED",10) == 0) {
   return 1;
   }
// no error but not installed state
return 0;
}
