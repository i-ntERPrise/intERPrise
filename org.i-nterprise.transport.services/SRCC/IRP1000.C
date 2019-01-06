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
#include <H/FILEDEF>                             // Record File definitions
#include <H/MSGFUNC>                             // message functions
#include <H/UIMFUNC>                             // message functions

#define PNLGRP          "IRP1000PG *LIBL     "
#define ILEPGMLIB       "IRP1000   *LIBL     "

int main(int argc, char **argv) {
_RFILE    *fp;                                   // file Ptr
_RIOFB_T  *fdbk;                                 // Feed back Ptr
CFGREC   CfgRec;                                 // File struct
CFGREC   CfgRec_1;                               // File struct check changes
int Function_Requested;                          // indicator
int *Func_Req;                                   // Pointer
char applHandle[8];                              // UIM Handle
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
Func_Req = &Function_Requested;
// Open the Config File
if((fp =_Ropen("IRPTCFG","rr+")) == NULL) {
   snd_msg("F000000","IRPTCFG   *LIBL     ",20);
   return -1;
   }
fdbk = _Rreadf(fp,&CfgRec,_CFG_REC,__DFT);
if(fdbk->num_bytes == EOF) {
   snd_msg("F000001","IRPTCFG   *LIBL     ",20);
   _Rclose(fp);
   return -1;
   }
// Open the application
QUIOPNDA(applHandle,
         PNLGRP,
         _APPSCOPE_CALLER,
         _EXITPARM_STR,
         _HELPFULL_NO,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   _Rclose(fp);
   return -1;
   }
// push up the current configuration
QUIPUTV(applHandle,
        &CfgRec,
        _CFG_REC,
        "IRPTINFO   ",
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   _Rclose(fp);
   return -1;
   }
// display the panel
QUIDSPP(applHandle,
        Func_Req,
        "IRPTCFG   ",
        _REDISPLAY_NO,
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   _Rclose(fp);
   return -1;
   }
// if enter pressed process
if(*Func_Req == 500) {
   QUIGETV(applHandle,
           &CfgRec_1,
           _CFG_REC,
           "IRPTINFO  ",
           &errorCode);
   if(errorCode.EC.Bytes_Available > 0) {
      snd_error_msg(errorCode);
      _Rclose(fp);
      return -1;
      }
   fdbk = _Rupdate(fp,&CfgRec_1,_CFG_REC);
   if(fdbk->num_bytes != _CFG_REC) {
      snd_msg("F000003","IRPTCFG   *LIBL     ",20);
      _Rclose(fp);
      return -1;
      }
   }
// close file and return
_Rclose(fp);
return 1;
}
