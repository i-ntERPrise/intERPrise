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
#include <H/SVRFUNC>                             // message functions
#include <H/GSKFUNC>                             // General Security Kit

// Signal catcher

void catcher(int sig) {
// you can do some messaging etc in this function, it is called
// when the kill signal is received from the IRP0000 program
exit(0);
}

int main(int argc, char **argv) {
short int stop = 0;                              // stop flag
int req = 0;                                     // request flag
int addrLen = 0;                                 // address struct len
int listen_sd = 0;                               // socket descriptor
int accept_sd = 0;                               // socket descriptor
int rc = 0;                                      // return count
int secure = 0;                                  // secure server flag
int amtRead = 0;                                 // secure read bytes
char CurHndl[12];                                // Current profile handle
char cip[14];                                    // client IP adress
char allowedIP[14] = "*ANY";                     // allowed IP address
char recvBuf[_32K];                              // recv buffer
char convBuf[_32K];                              // conversion buffer
char msg_dta[_MAX_MSG];                          // message buffer
char key[5] = {'\0'};                            // request key
struct sigaction sigact;                         // Signal Action Struct
QtqCode_T jobCode = {0,0,0,0,0,0};               // (Job) CCSID to struct
QtqCode_T asciiCode = {819,0,0,0,0,0};           // (ASCII) CCSID from struct
iconv_t a_e_ccsid;                               // convert table struct
iconv_t e_a_ccsid;                               // convert table struct
struct sockaddr_in caddr;                        // Client socket info
gsk_handle envHndl = NULL;                       // secure socket kit handle
gsk_handle sessHndl = NULL;                      // secure socket kit handle
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
// Set up the signal handler
sigemptyset(&sigact.sa_mask);
sigact.sa_flags = 0;
sigact.sa_handler = catcher;
sigaction(SIGTERM, &sigact, NULL);
// create the conversion tables as we are working with web services etc
// ASCII to EBCDIC
a_e_ccsid = QtqIconvOpen(&jobCode,&asciiCode);
if(a_e_ccsid.return_value == -1) {
   sprintf(msg_dta,"QtqIconvOpen Failed %s",strerror(errno));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   return -1;
   }
// EBCDIC to ASCII
e_a_ccsid = QtqIconvOpen(&asciiCode,&jobCode);
if(e_a_ccsid.return_value == -1) {
   iconv_close(a_e_ccsid);
   sprintf(msg_dta,"QtqIconvOpen Failed %s",strerror(errno));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   return -1;
   }
// get the current profile handle for the job to reset later
QsyGetProfileHandleNoPwd(CurHndl,
                         "*CURRENT  ",
                         "*NOPWDCHK ",
                         &errorCode);
if(errorCode.EC.Bytes_Available) {
   snd_error_msg(errorCode);
   return -1;
   }
// check if secure Server
if(memcmp(argv[2],"Y",1) == 0) {
   if(crt_secure_env(&envHndl,_IRPT_APPID,_IRPT_APPID_LEN,GSK_SERVER_SESSION) != 1) {
      // close as cannot connect
      snd_msg("SEC0000"," ",0);
      gsk_clean(&envHndl,&sessHndl);
      }
   secure = 1;
   }
// connect to the socket passed as argv[1]
listen_sd = atoi(argv[1]);
addrLen = sizeof(caddr);
do {
   accept_sd = accept(listen_sd,(struct sockaddr *)&caddr,&addrLen);
   if(accept_sd < 0) {
      sprintf(msg_dta,"accept() failed",strerror(errno));
      snd_msg("GEN0001",msg_dta,strlen(msg_dta));
      close(listen_sd);
      gsk_clean(&envHndl,&sessHndl);
      return -1;
      }
   // we can restrict the access by IP address using this code.
   if(memcmp(allowedIP,"*ANY",4) != 0) {
      if(inet_ntop(AF_INET,&caddr.sin_addr,cip,INET_ADDRSTRLEN) != NULL) {
         if(memcmp(cip,allowedIP,strlen(cip)) != 0) {
            sprintf(msg_dta,"Connected refused from %s:%d",caddr,ntohs(caddr.sin_port));
            snd_msg("GEN0001",msg_dta,strlen(msg_dta));
            }
         }
      }
   else {
      memset(recvBuf,'\0',_32K);
      if(secure  == 1) {
         if(rc = gsk_secure_soc_open(envHndl,&sessHndl) != GSK_OK) {
            sprintf(msg_dta,"%s : %d - %s.",_GSK0004,rc,gsk_strerror(rc));
            snd_msg("GEN0001",msg_dta,strlen(msg_dta));
            gsk_clean(&envHndl,&sessHndl);
            close(accept_sd);
            return -1;
            }
         // set up the secure session
         if(rc = gsk_attribute_set_numeric_value(sessHndl,GSK_FD,accept_sd) != GSK_OK) {
            sprintf(msg_dta,"%s : %d - %s.",_GSK0005,rc,gsk_strerror(rc));
            snd_msg("GEN0001",msg_dta,strlen(msg_dta));
            gsk_clean(&envHndl,&sessHndl);
            close(accept_sd);
            return -1;
            }
         if(rc = gsk_secure_soc_init(sessHndl) != GSK_OK) {
            sprintf(msg_dta,"%s : %d - %s.",_GSK0006,rc,gsk_strerror(rc));
            snd_msg("GEN0001",msg_dta,strlen(msg_dta));
            gsk_clean(&envHndl,&sessHndl);
            close(accept_sd);
            return -1;
            }
         rc = gsk_secure_soc_read(sessHndl,recvBuf,_32K, &amtRead);
         if(convert_buffer(recvBuf,convBuf,amtRead,_32K,a_e_ccsid) != 1) {
            sprintf(msg_dta,"Failed to convert\n");
            gsk_clean(&envHndl,&sessHndl);
            close(accept_sd);
            return -1;
            }
         }
      else {
         rc = recv(accept_sd, recvBuf, _32K, 0);
         // should be ASCII so convert and keep null terminator
         if(convert_buffer(recvBuf,convBuf,rc+1,_32K,a_e_ccsid) != 1) {
            sprintf(msg_dta,"Failed to convert\n");
            close(accept_sd);
            return -1;
            }
         }
      memcpy(key,convBuf,4);
      req = atoi(key);
      switch(req) {
         case  0 : { // logon request
            Handle_SO(accept_sd,convBuf,e_a_ccsid,secure,sessHndl);
            break;
            }
         case  1 : { //sign off request
            Handle_LO(accept_sd,convBuf,e_a_ccsid,secure,sessHndl);
            break;
            }
         case  2 : { // get some data
            Handle_0002(accept_sd,convBuf,CurHndl,e_a_ccsid,secure,sessHndl);
            break;
            }
         default : {
            break;
            }
         }
      gsk_environment_close(&sessHndl);
      }
   }while (stop == 0);
gsk_clean(&envHndl,&sessHndl);
close(accept_sd);
return 0;
}
