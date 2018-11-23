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

#ifndef MSGFUNC_h
   #define MSGFUNC_h
   #include <H/COMMON>                           // common header
   #include <H/CLTMSG>                           // Client messages
   #include <qmhsndm.h>                          // snd msg
   #include <qmhsndpm.h>                         // snd program msg
   #include <qmhrcvpm.h>                         // receive program message
   #include <qmhchgem.h>                         // change error message

   // error code structure with 1KB message data
   typedef _Packed struct  Os_EC_x {
                           Qus_EC_t EC;
                           char Exception_Data[1024];
                           } Os_EC_t;


   //the default message objects
   #define _DFT_MSGQ "IRPTMSGQ  *LIBL     "
   #define _DFT_MSGF "IRPTMSGF  *LIBL     "
   #define _ERR_REC sizeof(struct Os_EC_x);
   #define _MAX_MSG 1024

   // function declarations
   void snd_error_msg(Os_EC_t);
   void snd_msg(char *,char *,int);
   #endif
