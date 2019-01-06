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

#include <H/GSKFUNC>                             // GSK functions
#include <H/CLTMSG>                              // message strings
#include <H/MSGFUNC>                             // message funcs

// Function crt_secure_env()
// purpose: Create a secure(TLS) environment for secure sockets
// @parms
//      Environment handle
// returns 1 on success

int crt_secure_env(gsk_handle *envHndl,
                   char *appId,
                   int appIdLen,
                   GSK_ENUM_VALUE gskType) {
int rc = 0;                                      // return code
char msg_dta[_MAX_MSG];                          // message buffer

// environment handle
if(rc = gsk_environment_open(envHndl) != GSK_OK) {
   sprintf(msg_dta,"%s : %d - %s.",_GSK0000,rc,gsk_strerror(rc));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   return -1;
   }
// set the application ID
if(rc = gsk_attribute_set_buffer(*envHndl,GSK_OS400_APPLICATION_ID,appId,appIdLen) != GSK_OK) {
   sprintf(msg_dta,"%s : %d - %s.",_GSK0001,rc,gsk_strerror(rc));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   // disable the secure environment
   if(envHndl != NULL) {
      gsk_environment_close(envHndl);
      }
   return -1;
   }
// set as a server application
if(rc = gsk_attribute_set_enum(*envHndl,GSK_SESSION_TYPE,gskType) != GSK_OK) {
   sprintf(msg_dta,"%s : %d - %s.",_GSK0002,rc,gsk_strerror(rc));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   // disable the secure environment
   if(envHndl != NULL) {
      gsk_environment_close(envHndl);
      }
   return -1;
   }
// we want this to be as secure as possible but these lines can be adjusted depending on need
// SSLV3 is insecure so always disable
if(rc = gsk_attribute_set_enum(*envHndl,GSK_PROTOCOL_SSLV3,GSK_PROTOCOL_SSLV3_OFF) != GSK_OK) {
   sprintf(msg_dta,"%s : %d - %s.",_GSK0002,rc,gsk_strerror(rc));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   // soft error as only unable to disable protocol but we will return anyhow
   // disable the secure environment
   if(envHndl != NULL) {
      gsk_environment_close(envHndl);
      }
   return -1;
   }
if(gskType == GSK_SERVER_SESSION) {
   // set the cipher to use, we are going for a strong cipher and TLS V1.2
   if(rc = gsk_attribute_set_buffer(*envHndl,GSK_TLSV12_CIPHER_SPECS_EX,_CIPHER_SUITE,39) != GSK_OK) {
      sprintf(msg_dta,"%s : %d - %s.",_GSK0002,rc,gsk_strerror(rc));
      snd_msg("GEN0001",msg_dta,strlen(msg_dta));
      // disable the secure environment
      if(envHndl != NULL) {
         gsk_environment_close(envHndl);
         }
      return -1;
      }
   }
// init secure environment
if(rc = gsk_environment_init(*envHndl) != GSK_OK) {
   sprintf(msg_dta,"%s : %d - %s.",_GSK0003,rc,gsk_strerror(rc));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   // disable the secure environment
   if(envHndl != NULL) {
      gsk_environment_close(envHndl);
      }
   return -1;
   }
return 1;
}

// function reg_appid()
// purpose: register application with DCM
// @parms
//      Application ID
//      Application description
// returns 1

int reg_appid(char *appID,
              char *appDesc,
              char type) {
int appIDLen = 0;                                // app ID Length
int appDescLen = 0;                              // app Description Length
char msg_dta[_MAX_MSG];                          // message buffer
Ctl_Rec_t AppCtls;                               // control record
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
appIDLen = strlen(appID);
appDescLen = strlen(appDesc);
// number of keys non default
AppCtls.numRecs = 4;
// application type
AppCtls.appType.size = sizeof(_Packed struct App_Type_x);
AppCtls.appType.key = 8;
AppCtls.appType.dtaLen = 1;
AppCtls.appType.dta = type;
// application description
AppCtls.appDesc.size = sizeof(_Packed struct App_Desc_x);
AppCtls.appDesc.key = 2;
AppCtls.appDesc.dtaLen = 50;
memset(AppCtls.appDesc.dta,' ',50);
memcpy(AppCtls.appDesc.dta,appDesc,appDescLen);
// certificate trust
AppCtls.caTrust.size = sizeof(_Packed struct CA_Trust_x);
AppCtls.caTrust.key = 4;
AppCtls.caTrust.dtaLen = 1;
AppCtls.caTrust.dta = '0';
// replace existing cert
AppCtls.certRpl.size = sizeof(_Packed struct Cert_Rpl_x);
AppCtls.certRpl.key = 5;
AppCtls.certRpl.dtaLen = 1;
AppCtls.certRpl.dta = '1';
// register
QsyRegisterAppForCertUse(appID,
                         &appIDLen,
                         (Qsy_App_Controls_T *)&AppCtls,
                         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
return 1;
}

// function gsk_clean()
// purpose: Clean up the gsk handles
// @parms
//      Environment Handle
//      session handle
// returns 1

int gsk_clean(gsk_handle *envHndl,
              gsk_handle *sessHndl) {
if(envHndl != NULL)
   gsk_environment_close(envHndl);
if(sessHndl != NULL)
   gsk_environment_close(sessHndl);
return 1;
}


