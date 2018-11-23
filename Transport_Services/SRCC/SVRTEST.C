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
#include <H/COMMON>                              // common header file
#include <H/MSGFUNC>                             // msg header file
#include <H/SVRFUNC>                             // Server header file
#include <H/FILEDEF>                             // File definitions header file

//
// function Get_Host_Addr()
// Purpose: get the Host address.
// @parms
//      string server name
//      struct socket address
//      int server port
// returns 1 on sucess


int Get_Host_Addr(char *server,
                  struct sockaddr_in *addr,
                  int Server_Port)  {
struct hostent *hostp;                      // host struct pointer
char msg_dta[_MAX_MSG];                     // msg array

addr->sin_family = AF_INET;
addr->sin_port = htons(Server_Port);
if((addr->sin_addr.s_addr  = inet_addr(server)) == (unsigned long) INADDR_NONE) {
   hostp = gethostbyname(server);
   if(hostp == (struct hostent *)NULL) {
      sprintf(msg_dta,"%s",hstrerror(h_errno));
      snd_msg("GEN0001",msg_dta,strlen(msg_dta));
      return -1;
      }
   memcpy(&addr->sin_addr,hostp->h_addr,sizeof(addr->sin_addr));
   }
return 1;
}


// (function) rmt_connect
// Connect to the remote system
// @parms
//     Configuration record
//                       socket decriptor
// returns 1 connected, socket set to connection

int rmt_connect(char *server,
                int serverPort,
                int *sockfd) {
int rc = 0;                                 // return value
char msg_dta[_MAX_MSG] = {'\0'};            // msg data
struct sockaddr_in addr;                    // socket struct

memset(&addr, 0, sizeof(addr));
*sockfd = socket(AF_INET, SOCK_STREAM, 0);
if(*sockfd < 0) {
   sprintf(msg_dta,"%s",strerror(errno));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   return -1;
   }
// get correct IP address
if(Get_Host_Addr(server,&addr,serverPort) != 1) {
   //close the socket
   close(*sockfd);
   return -1;
   }
rc = connect(*sockfd, (struct sockaddr *) &addr, sizeof(addr));
if(rc < 0) {
   sprintf(msg_dta,"Failed to connect to socket : %s",strerror(errno));
   snd_msg("GEN0001",msg_dta,strlen(msg_dta));
   close(*sockfd);
   return -1;
   }
return 1;
}

int main(int argc,char **argv) {
_RFILE *fp;                                      // file ptr
_RIOFB_T *fdbk;                                  // feed back
CFGREC CfgRec;                                   // Configuration information
int sockfd = 0;                                  // socket
int serverPort = 0;                              // connection port
int msgLen = 1;                                  // msg Length
int rc = 0;                                      // return count
int i = 0;                                       // counter
char msg_dta[_MAX_MSG];                          // msg buffer
char tmpBuf[_MAX_MSG];                           // conversion buffer
char recvBuf[_MAX_MSG];                          // recv buffer
char sessId[17];                                 // sessionID
char prf[11];                                    // profile
char pwd[11];                                    // password
QtqCode_T jobCode = {0,0,0,0,0,0};               // (Job) CCSID to struct
QtqCode_T asciiCode = {819,0,0,0,0,0};           // (ASCII) CCSID from struct
iconv_t a_e_ccsid;                               // convert table struct
iconv_t e_a_ccsid;                               // convert table struct

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
// get the profile and password
for(i = 0; i < 10; i++) {
   prf[i] = (argv[2][i] == ' ')? '\0' : argv[2][i];
   pwd[i] = (argv[3][i] == ' ')? '\0' : argv[3][i];
   }
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
serverPort = CfgRec.SVRPORT;
// connect to the remote Server
if(rmt_connect(argv[1],serverPort,&sockfd) != 1) {
  return -1;
  }
// need to send as EBCDIC so will convert each time
// first lets sign on
sprintf(msg_dta,"0000{\"profile\":\"%s\",\"passwd\":\"%s\"}",prf,pwd);
printf("JSON to be sent %s\n",msg_dta);
msgLen = strlen(msg_dta) + 1;
convert_buffer(msg_dta,tmpBuf,msgLen,_MAX_MSG,e_a_ccsid);
send(sockfd,tmpBuf,msgLen,0);
// get the response
rc = recv(sockfd,recvBuf,_MAX_MSG,0);
convert_buffer(recvBuf,tmpBuf,rc,_MAX_MSG,a_e_ccsid);
printf("Sign on response %s\n",tmpBuf);
// need to close and reconnect
close(sockfd);
// make sure its a correct respone
if(memcmp(tmpBuf,"{\"SESSIONID\":",10) != 0) {
  printf("Invalid Response\n");
  return -1;
  }
getchar();
// lets test retrieve of handle
extract_value(tmpBuf,1,sessId);
sprintf(msg_dta,"0002{\"sessid\":\"%s\",\"msg\":\"Hello World\"}",sessId);
printf("JSON to be sent %s\n",msg_dta);
msgLen = strlen(msg_dta) + 1;
if(rmt_connect(argv[1],serverPort,&sockfd) != 1) {
  return -1;
  }
convert_buffer(msg_dta,tmpBuf,msgLen,_MAX_MSG,e_a_ccsid);
send(sockfd,tmpBuf,msgLen,0);
// get the response
rc = recv(sockfd,recvBuf,_MAX_MSG,0);
convert_buffer(recvBuf,tmpBuf,rc,_MAX_MSG,a_e_ccsid);
printf("0002 response %s\n",tmpBuf);
// need to close and reconnect
close(sockfd);
getchar();
// now send signoff
sprintf(msg_dta,"0001{\"sessid\":\"%s\"}",sessId);
printf("JSON to be sent %s\n",msg_dta);
msgLen = strlen(msg_dta) + 1;
if(rmt_connect(argv[1],serverPort,&sockfd) != 1) {
  return -1;
  }
convert_buffer(msg_dta,tmpBuf,msgLen,_MAX_MSG,e_a_ccsid);
send(sockfd,tmpBuf,msgLen,0);
// get the response
rc = recv(sockfd,recvBuf,_MAX_MSG,0);
convert_buffer(recvBuf,tmpBuf,rc,_MAX_MSG,a_e_ccsid);
printf("Sign off response %s\n",tmpBuf);
// need to close and reconnect
close(sockfd);
return 1;
}
