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

#include <H/SVRFUNC>                             // server functions
#include <H/MSGFUNC>                             // message funcs

// Function Handle_SO()
// purpose: Allocate session ID and store with profile handle
// @parms
//      socket
//      Received buffer in EBCDIC
//      conversion table
//      conversion table
// returns 1 on success

int Handle_SO(int accept_sd,
              char *convBuf,
              iconv_t e_a_ccsid) {
int pwdLen = 0;                                  // password length
int msgLen = 0;                                  // Message length
int rc = 0;                                      // return value
char outputFmt[10] = "*YMD      ";               // Time stamp input fmt
char timeStamp[18];                              // time stamp
char Profile[10] = {' '};                        // profile name
char Pwd[128] = {' '};                           // password length
char msg_dta[_MAX_MSG];                          // message buffer
char tmpBuf[_MAX_MSG];                           // temp buffer
char value[128] = {0};                           // returned value
char *tmp;                                       // temp ptr
sessInfo_t sessInf;                              // IDX struct
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
// retrieve the sign on information
// format should follow 0000{"profile":"PROFILE","pass":"PASSWD"}
// index relates to the key:value pair 1 based
tmp = convBuf;
// skip the request key
tmp += 4;
if(extract_value(tmp,1,value) != 1) {
   send_client_error(accept_sd,_PRF0000,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
memcpy(Profile,value,strlen(value));
if(extract_value(tmp,2,value) != 1) {
   send_client_error(accept_sd,_PRF0001,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
pwdLen = strlen(value);
memcpy(Pwd,value,pwdLen);
// get the profile handle
QsyGetProfileHandle(sessInf.UsrHndl,
                    Profile,
                    Pwd,
                    pwdLen,
                    0,
                    &errorCode);
if(errorCode.EC.Bytes_Available) {
   snd_error_msg(errorCode);
   send_client_error(accept_sd,_PRF0002,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
// create the session ID
QWCCVTDT("*CURRENT  ",
         " ",
         outputFmt,
         timeStamp,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   send_client_error(accept_sd,_ERR0000,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
// sign on means the lastAct value is same as signon
memcpy(sessInf.sessId,timeStamp,16);
memcpy(sessInf.lastAct,timeStamp,16);
// store session ID with Profile Handle
if(store_session(&sessInf) != 1) {
   send_client_error(accept_sd,_SSN0001,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
// send back the session ID as JSON.
sprintf(msg_dta,"{\"SESSIONID\":\"%s\"}",timeStamp);
// length needs to include NLL terminator
msgLen = strlen(msg_dta) + 1;
convert_buffer(msg_dta,tmpBuf,msgLen,_MAX_MSG,e_a_ccsid);
rc = send(accept_sd,tmpBuf,msgLen,0);
// this is stateless so close the socket
close(accept_sd);
return 1;
}

// Function Handle_LO()
// purpose: Remove session ID and handle from the UIDX
// @parms
//      socket
//      Received buffer in EBCDIC
//      conversion table
//      conversion table
// returns 1 on success

int Handle_LO(int accept_sd,
              char *convBuf,
              iconv_t e_a_ccsid) {
int msgLen = 0;                                  // message length
char sessId[17];                                 // session ID
char msg_dta[_MAX_MSG];                          // message buffer
char tmpBuf[_MAX_MSG];                           // temp buffer
char *tmp;                                       // temp ptr

// format should follow 0001{"sessid":"SESSIONID"}
tmp = convBuf;
// skip the key
tmp += 4;
if(extract_value(tmp,1,sessId) != 1) {
   send_client_error(accept_sd,_SSN0000,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
// remove from the User Index
if(rmv_session(sessId) != 1) {
   send_client_error(accept_sd,_SSN0000,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
sprintf(msg_dta,"{\"OK\":\"%s\"}",sessId);
// convert to ASCII
msgLen = strlen(msg_dta) + 1;
convert_buffer(msg_dta,tmpBuf,msgLen,_MAX_MSG,e_a_ccsid);
send(accept_sd,tmpBuf,msgLen,0);
close(accept_sd);
return 1;
}

// function Handle_0002()
// purpose : To handle request with a key of 2
// @parms
//      socket
//      Received buffer in EBCDIC
//      conversion table
//      conversion table
// returns 1 on success

int Handle_0002(int accept_sd,
                char *convBuf,
                iconv_t e_a_ccsid) {
int msgLen = 0;                                  // message length
char sessId[17];                                 // session ID
char msg_dta[_MAX_MSG];                          // message buffer
char tmpBuf[_MAX_MSG];                           // temp buffer
char *tmp;                                       // temp ptr
sessInfo_t sessInf;                              // IDX struct

// get the session ID 0002{"sessid":"SESSIONID","msg":"MSG"}
tmp = convBuf;
// skip the key
tmp += 4;
if(extract_value(tmp,1,sessId) != 1) {
   send_client_error(accept_sd,_SSN0000,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
if(rtv_session(&sessInf,sessId) != 1) {
   send_client_error(accept_sd,_SSN0003,e_a_ccsid);
   close(accept_sd);
   return -1;
   }
sprintf(msg_dta,"{\"OK\":\"%s\"}",sessId);
// convert to ASCII
msgLen = strlen(msg_dta) + 1;
convert_buffer(msg_dta,tmpBuf,msgLen,_MAX_MSG,e_a_ccsid);
send(accept_sd,tmpBuf,msgLen,0);
close(accept_sd);
return 1;
}
// Function convert_buffer()
// purpose: Convert buffer to and from ASCII
// @parms
//      input buffer
//      conversion buffer
//      in length
//      out length
//      buffer len
//      conversion table
// returns 1 on success

int convert_buffer(char *inBuf,
                   char *outBuf,
                   int inBufLen,
                   int outBufLen,
                   iconv_t table) {
int ret = 0;                                     // return value
size_t insz;                                     // input len
size_t outsz;                                    // output size
char *out_ptr;                                   // buffer ptr
char *in_ptr;                                    // buffer ptr

insz = inBufLen;
outsz = outBufLen;
in_ptr = inBuf;
out_ptr = outBuf;
ret = (iconv(table,(char **)&(in_ptr),&insz,(char **)&(out_ptr),&outsz));
return 1;
}

// Function crt_sessidx()
// purpose: Create the User IDX for holding session information
// @parms
//      session ID
// returns 1 on success

int crt_sessidx(char *Idx) {
char extAtr[10] = "          ";                  // Extended Attr
char entryLen = 'F';                             // Fixed length
char keyInsert = '1';                            // non keyed
char update = '1';                               // update to Aux Stg
char optimize = '0';                             // Optimize for random requests
char pubAut[10] = "*EXCLUDE  ";                  // Public Authority
char text[50] = " ";                             // description
char replace[10] = "*YES      ";                 // replace
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
QUSCRTUI(Idx,
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

// Function store_session()
// purpose: Store profile handles with session ID
// @parms
//      profile handle
//      session ID
// returns 1 on success

int store_session(sessInfo_t *sessInf) {
int numAdd = 0;                                  // Number of entries added
int insType = 3;                                 // insert unique by key
char offsets[16];                                // returned offsets
char libName[10];                                // returned lib name
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
// keyed by sessid, handle is the profile handle
QUSADDUI(libName,
         &numAdd,
         _SESS_IDX,
         insType,
         (char *)sessInf,
         _IDX_ENT_LEN,
         offsets,
         1,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   if(memcmp(errorCode.EC.Exception_Id,"CPF3C74",7) == 0) {
      // session ID already exists
      return 1;
      }
   else if(memcmp(errorCode.EC.Exception_Id,"CPF9801",7) == 0) {
      // IDX not found so create and add entry
      if(crt_sessidx(_SESS_IDX) == 1) {
         QUSADDUI(libName,
                  &numAdd,
                  _SESS_IDX,
                  insType,
                  (char *)sessInf,
                  _IDX_ENT_LEN,
                  offsets,
                  1,
                  &errorCode);
         if(errorCode.EC.Bytes_Available > 0) {
            snd_error_msg(errorCode);
            return -1;
            }
         // success
         return numAdd;
         }
      else {
         return -1;
         }
      }
   else {
      snd_error_msg(errorCode);
      return -1;
      }
   }
// success first time
return numAdd;
}

// Function rtv_session()
// purpose: Retrieve profile handles using session ID
// @parms
//      profile handle
//      session ID
// returns 1 on success

int rtv_session(sessInfo_t *sessInf,
                char *sessId) {
int offsetsLen = 16;                             // length of offset buffer
int numRet = 0;                                  // number of entries found
int numAdd = 0;                                  // number of entries Added
int maxEnt = 1;                                  // maximum entries to return
int searchType = 1;                              // Search equals
int searchCritOffset = 0;                        // not used
char offsets[16];                                // returned offsets
char libName[10];                                // returned lib name
char idxFormat[8] = "IDXE0100";                  // Index format returned
char outputFmt[10] = "*YMD      ";               // Time stamp input fmt
char timeStamp[18];                              // time stamp
char outputBuf[_IDX_ENT_LEN + 8];                // output from retrieve
char msg_dta[_MAX_MSG];                          // message buffer
char *tmp;                                       // temp ptr
sessInfo_t *ptr;                                 // ptr
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
ptr = (sessInfo_t *)outputBuf;
QUSRTVUI(outputBuf,
         _IDX_ENT_LEN + 8,
         offsets,
         offsetsLen,
         &numRet,
         libName,
         _SESS_IDX,
         idxFormat,
         maxEnt,
         searchType,
         sessId,
         _IDX_KEY_LEN,
         searchCritOffset,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
// first 8 bytes are the bytes return info etc
tmp = outputBuf;
tmp += 8;
ptr = (sessInfo_t *)tmp;
// need to update last active part of the session info
rmv_session(sessId);
// create the session ID
QWCCVTDT("*CURRENT  ",
         " ",
         outputFmt,
         timeStamp,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
memcpy(sessInf->sessId,ptr->sessId,16);
memcpy(sessInf->lastAct,timeStamp,16);
memcpy(sessInf->UsrHndl,ptr->UsrHndl,12);
store_session(sessInf);
return 1;
}

// Function rmv_session()
// purpose: Retrieve profile handles using session ID
// @parms
//      session ID
// returns 1 on success

int rmv_session(char *sessid) {
int outputLen = _IDX_ENT_LEN;                    // length buffer
int offsetsLen = 16;                             // length of offset buffer
int numRmv = 0;                                  // number of entries found
int maxEnt = 1;                                  // maximum entries to return
int rmvType = 1;                                 // Search equals
int rmvCritOffset = 0;                           // not used
int idxKeyLen = _IDX_KEY_LEN;                    // Idx key length
char output[_IDX_ENT_LEN];                       // Output buffer
char offsets[16];                                // returned offsets
char libName[10];                                // returned lib name
char idxFormat[8] = "IDXE0100";                  // Index format returned
char Idx[20] = _SESS_IDX;                        // User Index name
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
QUSRMVUI(&numRmv,
         output,
         outputLen,
         offsets,
         offsetsLen,
         libName,
         Idx,
         idxFormat,
         maxEnt,
         rmvType,
         sessid,
         idxKeyLen,
         rmvCritOffset,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
return 1;
}

// Function extract_value()
// purpose: Extract the value from a key:value pair by index.
// @parms
//      json String
//      index
//      return value
// returns 1 on success

int extract_value(char *json_str,
                  int index,
                  char *value) {
int count = 0,i = 0,j = 0,inc = 0;                // counters
char *token,*newString;                           // buf ptrs

// index relates to the pair of values so need to increment accordingly
for(i = 1; i < index; i++) {
   inc++;
   }
index += inc;
count = strlen(json_str);
// allocate buffer to hold new string
newString = malloc(count);
// remove the quote marks and open brackets
for(i = 0,j = 0; i < count;i++) {
   if((json_str[i] != '{') && (json_str[i] != '}') && (json_str[i] != '"')) {
      newString[j] = json_str[i];
      j++;
      }
   }
// extract the key value pairs
token = strtok(newString, ",:");
i = 0;
do {
   // we know the position in the passed string
   if(i == index) {
      strcpy(value,token);
      break;
      }
   i++;
   } while (token = strtok(NULL, ",:"));
free(newString);
return 1;
}

// Function send_client_error()
// purpose: Format and send error message to client
// @parms
//      socket
//      message
// returns 1 on success

int send_client_error(int accept_sd,
                      char *msg,
                      iconv_t e_a_ccsid) {
int msgLen = 0;                                  // message length
char msg_dta[_MAX_MSG];                          // message buffer
char tmpBuf[_MAX_MSG];                           // temp buffer

// format to send
sprintf(msg_dta,"{\"ERROR\":\"%s\"}",msg);
msgLen = strlen(msg_dta) + 1;
convert_buffer(msg_dta,tmpBuf,msgLen,_MAX_MSG,e_a_ccsid);
send(accept_sd,tmpBuf,msgLen,0);
return 1;
}

// Function expire_sessid()
// purpose: remove session ID's from user index that are older than CFGREC.SESSTIMEO
// @parms
//      Config File
// returns 1 on success

int expire_sessid(CFGREC *CfgRec) {
double secs = 0;                                 // seconds holder
int junkl = 0;                                   // Int holder
int atrLen;                                      // Length of Ouput buffer
int idxEnt = 0;                                  // entries in USRIDX
int offsetsLen = 16;                             // offset length
int numRmv = 0;                                  // number entries removed
int maxEnt = 4095;                               // maximum entries to return
int rmvType = 3;                                 // remove if less than (before time stamp)
int searchType = 6;                              // search type 6 = first
int rmvCritOffset = _IDX_KEY_LEN;                // offset to remove critera (16)
char offsets[16];                                // offset buffer
char output[8];                                  // not used as not returned
char libName[10];                                // returned library name
char timeStamp[17];                              // Time Stamp holder
char date[17];                                   // Holds returned date
char atrFormat[8] = "IDXA0100";                  // IDX Atr format
char entFormat[8] = "IDXE0100";                  // IDX Entry Format
unsigned char junk2[24];                         // Junk char string
Qus_IDXA0100_t idxAtr;                           // IDX Atr
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
// retrieve UserIDX attributes
QUSRUIAT(&idxAtr,
         atrLen,
         atrFormat,
         _SESS_IDX,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
// read through the UserIDX and remove any entries which have a lastAct time before date
idxEnt = idxAtr.Number_Entries_Added - idxAtr.Number_Entries_Removed;
if(idxEnt <= 0) {
   snd_msg("IDX0000",(char *)&numRmv,sizeof(int));
   return 1;
   }
// create a date which is CfgRec->SESSTIMEO minutes before now
CEELOCT(&junkl,
        &secs,
        junk2,
        NULL);
secs -= ((int)CfgRec->SESSTIMEO * 60);
CEEDATM(&secs,
        "YYYYMMDDHHMISS999",
        timeStamp,
        NULL);
QWCCVTDT("*YYMD     ",
         timeStamp,
         "*YMD      ",
         date,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
// remove using the date as the key against the lastAct content (bytes 16 - 31)
// key is the same as the session ID because both are 16 byte time stamps
// rmvCritOffset is same a sessionID (16bytes)
QUSRMVUI(&numRmv,
         output,
         0,
         offsets,
         offsetsLen,
         libName,
         _SESS_IDX,
         entFormat,
         maxEnt,
         rmvType,
         date,
         _IDX_KEY_LEN,
         rmvCritOffset,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
snd_msg("IDX0000",(char *)&numRmv,sizeof(int));
return 1;
}
