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

#include <H/MSGFUNC>                             // message hdr
#include <H/UIMFUNC>                             // UIM hdr
#include <H/SVRFUNC>                             // Server hdr
#include <H/COMMON>                              // common hdr

#define PNLGRP          "IRP0004PG *LIBL     "
#define ILEPGMLIB       "IRP0004   *LIBL     "

extern void AppDspSess(void);
extern void UIMExit(Qui_ALC_t *);
void ProcessListOption(Qui_ALC_t *);
void ProcessListExit(Qui_ALX_t *);
void ProcessFuncKeyAct(Qui_FKC_t *);
int Load_Sess_Pnl(char *);

int main(int argc,char *argv[]) {
int CallType;                                    // call type passed
char **tmp_ptr;                                  // ptr
Qui_ALC_t *call_lopt;                            // call opt

if(argc == 1) {
   AppDspSess();
   }
else {
  tmp_ptr = argv;
  call_lopt = (Qui_ALC_t *) tmp_ptr[1];
  UIMExit(call_lopt);
  }
exit(0);
}

// Function AppDspSess()
// purpose: Display the session IDX content
// @parms
//      void
// returns nothing

void AppDspSess() {
int Function_Requested,                          // Func requested
*Func_Req = &Function_Requested;
char applHandle[8];                              // app hanlde
char varBuffer[130];                             // char buffer
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
// open the application
QUIOPNDA(applHandle,
         PNLGRP,
         _APPSCOPE_CALLER,
         _EXITPARM_STR,
         _HELPFULL_NO,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return;
   }
memset(varBuffer,' ',_EXITPROG_BUFLEN);
memcpy(varBuffer,ILEPGMLIB,20);
// push the program information
QUIPUTV(applHandle,
        varBuffer,
        _EXITPROG_BUFLEN,
        "EXITPROG  ",
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return;
   }
// list the existing entries
Load_Sess_Pnl(applHandle);
QUIDSPP(applHandle,
        Func_Req,
        "SESSIDPNL ",
        _REDISPLAY_NO,
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return;
   }
QUICLOA(applHandle,
        _CLOSEOPT_NORMAL,
        &errorCode);
if(errorCode.EC.Bytes_Available > 0)  {
   snd_error_msg(errorCode);
   return;
   }
return;
}

// Function UIMExit()
// purpose: Filter exit requests
// @parms
//      exit struct
// returns nothing

void UIMExit(Qui_ALC_t *uimExitStr) {
Qui_FKC_t *funcKeyAction;                        // FKey struct ptr
Qui_ALC_t *listOptAction;                        // listOpt struct ptr
Qui_ALX_t *listOptExit;                          // list exit struct ptr
int CallType;                                    // call type switch

CallType = uimExitStr->CallType;
switch(CallType) {
   case 1: {
      funcKeyAction = (Qui_FKC_t *) uimExitStr;
      ProcessFuncKeyAct(funcKeyAction);
      break;
      }
   case 3: {
      listOptAction = (Qui_ALC_t *) uimExitStr;
      ProcessListOption(listOptAction);
      break;
      }
   case 5: {
      listOptExit = (Qui_ALX_t *) uimExitStr;
      ProcessListExit(listOptExit);
      break;
      }
   default : {
      break;
      }
   }
return;
}

// Function ProcessListOption()
// purpose: Process List options
// @parms
//      List option struct
// returns nothing

void ProcessListOption(Qui_ALC_t *listOptAction) {
char LeHdl[4];                                   // list entry Hdl
char SelCrt[20];                                 // select Crit
char ExtOpt[1] = "Y";                            // extended option
char SelHdl[4];                                  // slect Handle
sessInfo_t sessInf;                              // session info
Qui_ALC_t listOpt;                               // List Option
Os_EC_t errorCode = {0};                         // Error_Code struct

listOpt = *listOptAction;
errorCode.EC.Bytes_Provided = _ERR_REC;
// Option 4 means remove
if(listOpt.ListOption == 4) {
   // get the list data
   QUIGETLE(listOpt.ApplHandle,
            &sessInf,
            _IDX_ENT_LEN,
            "SESSINF   ",
            "SESSIDLST ",
            "SAME",
            "Y",
            SelCrt,
            SelHdl,
            ExtOpt,
            LeHdl,
            &errorCode);
   if(errorCode.EC.Bytes_Available > 0) {
      snd_error_msg(errorCode);
      return;
      }
   // remove from IDX
   rmv_session(sessInf.sessId);
   return;
   }
return;
}

// Function ProcessListExit()
// purpose: Process list exit requests
// @parms
//      ListOPtExit struct
// returns nothing

void ProcessListExit(Qui_ALX_t *listOptExit) {
Qui_ALX_t listExit;                              // exit struct
char LeHdl[4];                                   // list entry handle
char SelCrt[20];                                 // select Crit
char ExtOpt[1] = "Y";                            // extended option
char SelHdl[4];                                  // select Handle
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
listExit = *listOptExit;
if((listExit.Result == 0) && (listExit.ListOption == 4)) {
   QUIRMVLE(listExit.ApplHandle,listExit.ListName,_EXTEND_NO,LeHdl,&errorCode);
   if(errorCode.EC.Bytes_Available > 0) {
      snd_error_msg(errorCode);
      }
   return;
   }
return;
}

// Function ProcessFunctionKetAct()
// purpose: Process function key requests
// @parms
//      Function key struct
// returns nothing

void ProcessFuncKeyAct(Qui_FKC_t *funcKeyAct) {
Qui_FKC_t FKeyAct;                               // FKey struct
int functionRequested,                           // function requested
*funcReq = &functionRequested;
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
FKeyAct = *funcKeyAct;
// refresh the list
if((FKeyAct.FunctionKey == 5) && (memcmp(FKeyAct.PanelName,"SESSIDPNL ",10) == 0)) {
   // load the current content
   Load_Sess_Pnl(FKeyAct.ApplHandle);
   return;
   }
return;
}

// Function Load_Sess_Pnl()
// purpose: list session ID's stored in USRIDX
// @parms
//      profile handle
// returns 1 on success

int Load_Sess_Pnl(char *ApplHandle) {
int atrLen = 0;                                  // Length of Ouput buffer
int idxEnt = 0;                                  // entries in USRIDX
int offsetsLen = 16;                             // offset length
int maxEnt = 1;                                  // maximum entries to return
int searchType = 6;                              // First entry
int numRet = 0;                                  // number of entries found
int searchCritOffset = 0;                        // not used
char offsets[16];                                // returned offsets
char libName[10];                                // returned lib name
char atrFormat[8] = "IDXA0100";                  // IDX Atr format
char idxFormat[8] = "IDXE0100";                  // Index format returned
char output[_IDX_ENT_LEN + 8];                   // output from retrieve
char msg_dta[_MAX_MSG];                          // message buffer
char sessId[16];                                 // session ID
char *tmp;                                       // temp ptr
Qus_IDXA0100_t idxAtr;                           // IDX Atr
sessInfo_t *ptr;                                 // session info ptr
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
// delete the existing list
QUIDLTL(ApplHandle,
        "SESSIDLST ",
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   if(memcmp(errorCode.EC.Exception_Id,"CPF6A92",7) != 0) {
      snd_error_msg(errorCode);
      return -1;
      }
   }
// read through the IDX entries and display to list
// retrieve UserIDX attributes
QUSRUIAT(&idxAtr,
         sizeof(idxAtr),
         atrFormat,
         _SESS_IDX,
         &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
// if no entries just set empty list
idxEnt = idxAtr.Number_Entries_Added - idxAtr.Number_Entries_Removed;
if(idxEnt <= 0) {
   QUISETLA(ApplHandle,
           "SESSIDLST ",
           "ALL ",
           "*SAME     ",
           "SAME",
           "S",
           &errorCode);
   if(errorCode.EC.Bytes_Available > 0) {
      snd_error_msg(errorCode);
      return -1;
      }
   return 0;
   }
// walk through and add to the panel
tmp = output;
tmp += 8;
ptr = (sessInfo_t *)tmp;
do {
   QUSRTVUI(output,
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
   if(numRet > 0) {
      // add to the list
      QUIADDLE(ApplHandle,
               tmp,
               _IDX_ENT_LEN,
               "SESSINF   ",
               "SESSIDLST ",
               "NEXT",
               "    ",
               &errorCode);
      if(errorCode.EC.Bytes_Available > 0) {
         snd_error_msg(errorCode);
         return -1;
         }
      searchType = 2;
      memcpy(sessId,ptr->sessId,16);
      }
   }while(numRet > 0);
return 1;
}

