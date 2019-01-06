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
#include <H/GENFUNC>                             // general functions
#include <qrcvdtaq.h>                            // Receive Data Q Msg
#include <qclrdtaq.h>                            // Clear Data Q Msgs

typedef _Packed struct pid_list_x{
         int pid_num[_MAX_WORK];
         }pid_list_t;

int main(int argc, char **argv) {
_RFILE *fp;                                      // file ptr
_RIOFB_T *fdbk;                                  // feed back
CFGREC CfgRec;                                   // Configuration information
int listen_sd = 0;                               // socket descriptor
int on = 1;                                      // on flag
int result = 0;                                  // result flag
int stop = 0;                                    // stop flag
int i, pid,rc,j;                                 // counters
int Server_Port = 0;                             // server port
int num_wrk = 0;                                 // number of worker jobs
int new_wrk = 0;                                 // number of worker jobs to add
int type = 0;                                    // Switch key
int curWrk = 0;                                  // current worker jobs
int *int_ptr;                                    // int pointer
decimal(5,0)  DataLength = 0.0d;                 // Number of bytes returned
decimal(5,0)  WaitTime = -1.0d;                  // wait for data <0 = forever
decimal(3,0)  SInfLength = 9.0d;                 // length of Sender inf
decimal(3,0) KeyLength = 4.0d;                   // length of key
char DQueue[10] = "SVRCTLQ   ";                  // Master Q
char DQLib[10] = _DFT_PGM_LIB;                   // Master Q Lib
char DQKey[4] = "0000";                          // key data used for retvl
char SpawnStr[50];                               // spawn string
char *spawn_argv[4];                             // Spawn arg
char *spawn_envp[1];                             // Spawn Environment
char *recptr;                                    // pointer to data
char buffer[80];                                 // Buffer
char QueueData[_QSIZE];                          // Data from Data queue
char msg_dta[_MAX_MSG];                          // msg buffer
char Key[5];                                     // Switch Key
char secSvr[2];                                  // secure server flag
char progName[11];                               // program name
pid_list_t pid_list;                             // Process List struct
pid_list_t ss_pid_list;                          // Process List struct
Qmhq_Sender_Information_t SInfo;                 // Sender Inf struct
struct inheritance inherit;                      // inheritance Struct
struct sockaddr_in addr;                         // socket struct
Os_EC_t ErrorCode = {0};                         // Error code data

ErrorCode.EC.Bytes_Provided = _ERR_REC;
// Open the Config File
if((fp =_Ropen("IRPTCFG","rr")) == NULL) {
   snd_msg("F000000",_DFT_CFG,20);
   return -1;
   }
fdbk = _Rreadf(fp,&CfgRec,_CFG_REC,__DFT);
if(fdbk->num_bytes == EOF) {
   snd_msg("F000001",_DFT_CFG,20);
   _Rclose(fp);
   return -1;
   }
_Rclose(fp);
// reject if number worker jobs > _MAX_WORK
if(CfgRec.NUMSVR > _MAX_WORK) {
   // message expects to integers to be passed as the data
   int_ptr = (int *)msg_dta;
   *int_ptr = CfgRec.NUMSVR;
   int_ptr++;
   *int_ptr = _MAX_WORK;
   snd_msg("CFG0000",msg_dta,sizeof(int)*2);
   return -1;
   }
// set up the listening port
Server_Port = CfgRec.SVRPORT;
num_wrk = CfgRec.NUMSVR;
// set up the worker program spawn string
strcpy(SpawnStr,_DFT_SPAWN_LIB);
strcat(SpawnStr,"IRP0001.PGM");
// Clear out any existing stop messages in control queue
QCLRDTAQ(DQueue,
         DQLib,
         "EQ",
         KeyLength,
         DQKey,
         &ErrorCode);
if(ErrorCode.EC.Bytes_Available) {
   snd_error_msg(ErrorCode);
   }
// Set up the listening socket
listen_sd = socket(AF_INET, SOCK_STREAM, 0);
if(listen_sd < 0) {
   sprintf(msg_dta," socket() failed %s",strerror(errno));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   close(listen_sd);
   return -1;
   }
setsockopt(listen_sd,SOL_SOCKET,SO_REUSEADDR,(char *)&on,sizeof(on));
setsockopt(listen_sd,SOL_SOCKET,SO_RCVBUF,CHAR_32K,sizeof(CHAR_32K));
memset(&addr, 0, sizeof(addr));
addr.sin_family = AF_INET;
addr.sin_addr.s_addr = htonl(INADDR_ANY);
addr.sin_port = htons(Server_Port);
rc = bind(listen_sd,(struct sockaddr *) &addr, sizeof(addr));
if(rc < 0)  {
   sprintf(msg_dta," bind() failed %s",strerror(errno));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   close(listen_sd);
   return -1;
   }
rc = listen(listen_sd, 5);
if(rc < 0) {
   sprintf(msg_dta," bind() failed %s",strerror(errno));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   close(listen_sd);
   return -1;
   }
memset(&inherit, 0, sizeof(inherit));
inherit.flags = SPAWN_SETJOBNAMEARGV_NP;
sprintf(buffer, "%d", listen_sd);
if(*CfgRec.SECSVR == 'Y') {
   sprintf(secSvr, "%.1s", CfgRec.SECSVR);
   // make sure DCM is installed first
   if(get_lpp_status("5770SS1","*CUR  ","0034") != 1) {
      sprintf(secSvr, "%.1s","N");
      snd_msg("SEC0001"," ",0);
      }
   else {
      // register the application ID
      if(reg_appid(_IRPT_APPID,_IRPT_APPID_DESC,'1') != 1) {
         snd_msg("SEC0002",msg_dta,strlen(msg_dta));
         sprintf(secSvr, "%.1s","N");
         }
      }
   }
// argv[0] generally stores the program name etc we send in NULL string
spawn_argv[1] = buffer;
spawn_argv[2] = secSvr;
spawn_argv[3] = NULL;
spawn_envp[0] = NULL;
// load the listening jobs Non Secure
for(i = 0; i < num_wrk; i++)  {
   if(*CfgRec.SECSVR == 'Y') {
      sprintf(progName,"SECRSP%.4d",i);
      }
   else {
      sprintf(progName,"RESPND%.4d",i);
      }
   spawn_argv[0] = progName;
   pid = spawn(SpawnStr,listen_sd + 1, NULL, &inherit,spawn_argv, spawn_envp);
   if(pid < 0)  {
      sprintf(msg_dta," spawn() failed %s",strerror(errno));
      snd_msg("GEN0001",msg_dta,strlen(msg_dta));
      close(listen_sd);
      return -1;
      }
   pid_list.pid_num[i] = pid;
   }
// Check for signal to end
do {
   recptr = QueueData;
   QRCVDTAQ(DQueue,
            DQLib,
            &DataLength,
            &QueueData,
            WaitTime,
            "LE",
            KeyLength,
            &DQKey,
            SInfLength,
            &SInfo);
   memset(Key,'\0',5);
   memcpy(Key,DQKey,4);
   type = atoi(Key);
   switch(type)  {
      case  0     :   {  // End the process */
         for(i = 0; i < num_wrk; i++) {
            kill(pid_list.pid_num[i], SIGTERM);
            }
         stop = 1;
         break;
         }
      case  1     :   {  // load more workers
         new_wrk = atoi(recptr);
         for(i = 0; i < new_wrk; i++,num_wrk++) {
            if(num_wrk == _MAX_WORK) {
               // send a message stating no more jobs can be started?
               break;
               }
               if(*CfgRec.SECSVR == 'Y') {
                  sprintf(progName,"SECRSP%.4d",num_wrk);
                  }
               else {
                  sprintf(progName,"RESPND%.4d",num_wrk);
                  }
            pid = spawn(SpawnStr,listen_sd + 1, NULL, &inherit,spawn_argv, spawn_envp);
            if(pid < 0) {
               sprintf(msg_dta,"Spawn Error %s",strerror(errno));
               snd_msg("GEN0001",msg_dta,strlen(msg_dta));
               stop =1;
               break;
               }
            pid_list.pid_num[num_wrk] = pid;
            num_wrk++;
            }
         break;
         }
      Default :  { // do nothing
         break;
         }
      }
   }while(stop != 1);
close(listen_sd);
return 0;
}
