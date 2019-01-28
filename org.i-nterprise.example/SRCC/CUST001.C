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
#include <H/JFMT>                                // JSON string formats

#define PNLGRP          "CUST001PG *LIBL     "
#define ILEPGMLIB       "CUST001   *LIBL     "

#pragma mapinc("cst","CUSMSTF(CUSMSTFR)","both","_P","","DATA_F")
#include "cst"
typedef DATA_F_CUSMSTFR_both_t CUSREC;
#define _CUS_REC sizeof(CUSREC)

typedef struct parm_s {
                int count;
                char data[4096];
                } parm_t;

#pragma linkage(CUSTST, OS)
void CUSTST(char *,char *);

extern void AppDspCust(void);
extern void UIMExit(Qui_ALC_t *);
void ProcessListOption(Qui_ALC_t *);
void ProcessListExit(Qui_ALX_t *);
void ProcessFuncKeyAct(Qui_FKC_t *);
int Load_Cust_Pnl(char *);
int add_cust(char *);
void vout(char *,char *,...);

int main(int argc,char *argv[]) {
int CallType;                                    // call type passed
char **tmp_ptr;                                  // ptr
Qui_ALC_t *call_lopt;                            // call opt

if(argc == 1) {
   AppDspCust();
   }
else {
  tmp_ptr = argv;
  call_lopt = (Qui_ALC_t *) tmp_ptr[1];
  UIMExit(call_lopt);
  }
exit(0);
}

// Function AppDspCust()
// purpose: Display the Customer List
// @parms
//      void
// returns nothing

void AppDspCust() {
int Function_Requested,                          // Func requested
*Func_Req = &Function_Requested;
char applHandle[8];                              // app handle
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
        "EXITPGM   ",
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return;
   }
// list the existing entries
Load_Cust_Pnl(applHandle);
QUIDSPP(applHandle,
        Func_Req,
        "CUSLSTPNL ",
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
Qui_ALC_t listOpt;                               // List Option
Os_EC_t errorCode = {0};                         // Error_Code struct

listOpt = *listOptAction;
errorCode.EC.Bytes_Provided = _ERR_REC;
// Option 4 means remove
if(listOpt.ListOption == 4) {
   // will driver program to remove
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
if((FKeyAct.FunctionKey == 5) && (memcmp(FKeyAct.PanelName,"CUSLSTPNL ",10) == 0)) {
   // load the current content
   Load_Cust_Pnl(FKeyAct.ApplHandle);
   return;
   }
if((FKeyAct.FunctionKey == 6) && (memcmp(FKeyAct.PanelName,"CUSLSTPNL ",10) == 0)) {
   add_cust(FKeyAct.ApplHandle);
   return;
   }
return;
}

// Function Load_Cust_Pnl()
// purpose: list Customers
// @parms
//      profile handle
// returns 1 on success

int Load_Cust_Pnl(char *ApplHandle) {
_RFILE    *fp;                                   // file Ptr
_RIOFB_T  *fdbk;                                 // Feed back Ptr
CUSREC CusRec;                                   // Customer record
char msg_dta[_MAX_MSG];                          // message buffer
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
// delete the existing list
QUIDLTL(ApplHandle,
        "CUSTLIST  ",
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   if(memcmp(errorCode.EC.Exception_Id,"CPF6A92",7) != 0) {
      snd_error_msg(errorCode);
      return -1;
      }
   }
// Open the Customer File
if((fp =_Ropen("CUSMSTF","rr")) == NULL) {
   snd_msg("F000000","CUSMSTF   *LIBL     ",20);
   return -1;
   }
fdbk = _Rreadf(fp,&CusRec,_CUS_REC,__DFT);
if(fdbk->num_bytes == EOF) {
   QUISETLA(ApplHandle,
           "CUSTLIST  ",
           "ALL ",
           "*SAME     ",
           "SAME",
           "S",
           &errorCode);
   if(errorCode.EC.Bytes_Available > 0) {
      snd_error_msg(errorCode);
      return -1;
      }
   _Rclose(fp);
   return -1;
   }
// walk through and add to the panel
do {
   // add to the list
   QUIADDLE(ApplHandle,
            &CusRec,
            _CUS_REC,
            "CUSTINFO  ",
            "CUSTLIST  ",
            "NEXT",
            "    ",
            &errorCode);
   if(errorCode.EC.Bytes_Available > 0) {
      snd_error_msg(errorCode);
      return -1;
      }
   fdbk = _Rreadn(fp,&CusRec,_CUS_REC,__DFT);
   }while(fdbk->num_bytes == _CUS_REC);
_Rclose(fp);
return 1;
}


int add_cust(char *applHandle) {
CUSREC CusRec;                                   // customer record
int Function_Requested;                          // indicator
int *Func_Req;                                   // Pointer
int *len;                                        // int ptr
char json_str[1024];                             // passed string
char ret_str[1024];                              // returned string
char buf[256];                                   // holding buffer
char t_buf[256];                                 // holding buffer
parm_t inParm;                                   // input parameters
parm_t outParm;                                  // ouput parameters
char *tmp;                                       // Temp ptr
Os_EC_t errorCode = {0};                         // Error code data

errorCode.EC.Bytes_Provided = _ERR_REC;
Func_Req = &Function_Requested;
// push up blank request
memset(&CusRec,' ',_CUS_REC);
QUIPUTV(applHandle,
        &CusRec,
        _CUS_REC,
        "CUSTINFO  ",
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
// display the panel group
QUIDSPP(applHandle,
        Func_Req,
        "ADDCUSPNL ",
        _REDISPLAY_NO,
        &errorCode);
if(errorCode.EC.Bytes_Available > 0) {
   snd_error_msg(errorCode);
   return -1;
   }
// if enter pressed process
if(*Func_Req == 500) {
   QUIGETV(applHandle,
           &CusRec,
           _CUS_REC,
           "CUSTINFO  ",
           &errorCode);
   if(errorCode.EC.Bytes_Available > 0) {
      snd_error_msg(errorCode);
      return -1;
      }
   // format to JSON
   vout(inParm.data,_CUS_FMT,CusRec._Customer_Name_,CusRec.ADRLN1,CusRec.ADRLN2,CusRec.ADRLN3,CusRec._Post_Code_,CusRec._Phone_Number_);
   inParm.count = strlen(inParm.data);
   CUSTST((char *)&inParm,(char *)&outParm);
   }
return 1;
}

// function vout
// Embed a set of parameters in a string using the passed format
// @parms
//      char * returned string
//      char * format to use
//      int file desc
//      unsigned int debug
//      any number of parameters
// returns 1

void vout(char *string,
          char *fmt,
          ...) {
char msg_dta[_MAX_MSG];                     /* message buffer */
va_list arg_ptr;                            /* arg ptr */

va_start(arg_ptr,fmt);
vsprintf(string, fmt, arg_ptr);
va_end(arg_ptr);
return;
}
