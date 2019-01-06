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

// function snd_error_msg()
// Purpose: Forward an Error Message to the message queue.
// @parms
//      Error Code Structure
// returns void

void snd_error_msg(Os_EC_t Error_Code) {
int data_len = 0;
char Msg_Type[10] = "*INFO     ";                // msg type
char Msg_File[20] = "QCPFMSG   *LIBL     ";      // Message file to use
char Msg_Key[4] = {' '};                         // msg key
char QRpy_Q[20] = {' '};                         // reply queue
Os_EC_t E_Code = {0};                            // error code struct

E_Code.EC.Bytes_Provided = _ERR_REC;
data_len = Error_Code.EC.Bytes_Available - 16;
QMHSNDM(Error_Code.EC.Exception_Id,
        Msg_File,
        Error_Code.Exception_Data,
        data_len,
        Msg_Type,
        _DFT_MSGQ,
        1,
        QRpy_Q,
        Msg_Key,
        &E_Code);
if(E_Code.EC.Bytes_Available > 0) {
   // if we get an error on sending the message send it
   snd_error_msg(E_Code);
   }
return;
}

// function snd_msg()
// Purpose: Place a message in the message queue.
// @parms
//      string MsgID
//      string Msg_Data
//      int Msg_Dta_Len
// returns void

void snd_msg(char * MsgID,
             char * Msg_Data,
             int Msg_Dta_Len) {
char Msg_Type[10] = "*INFO     ";                // msg type
char Call_Stack[10] = {"*EXT      "};            // call stack entry
char QRpy_Q[20] = {' '};                         // reply queue
char Msg_Key[4] = {' '};                         // msg key
Os_EC_t Error_Code = {0};                        // error code struct

Error_Code.EC.Bytes_Provided = _ERR_REC;
// send the message to the message queue
QMHSNDM(MsgID,
        _DFT_MSGF,
        Msg_Data,
        Msg_Dta_Len,
        Msg_Type,
        _DFT_MSGQ,
        1,
        QRpy_Q,
        Msg_Key,
        &Error_Code);
if(Error_Code.EC.Bytes_Available > 0) {
   snd_error_msg(Error_Code);
   }
// add a diag message to the program message queue
QMHSNDPM(MsgID,
         _DFT_MSGF,
         Msg_Data,
         Msg_Dta_Len,
         "*DIAG     ",
         "*         ",
         0,
         Msg_Key,
         &Error_Code);
if(Error_Code.EC.Bytes_Available > 0) {
   snd_error_msg(Error_Code);
   }
return;
}

