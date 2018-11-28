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

#ifndef SVRFUNC_h
   #define SVRFUNC_h
   #include <H/FILEDEF>                          // file definitions
   #include <H/GSKFUNC>                          // GSK hdr
   #include <qwccvtdt.h>                         // date and time
   #include <qusrmvui.h>                         // rmv usridx
   #include <quscrtui.h>                         // create usridx
   #include <qusrtvui.h>                         // retrieve usridx ent
   #include <qusruiat.h>                         // retrieve usridx attr
   #include <qusaddui.h>                         // add usridx ent
   #include <ledate.h>                           // CEE date functions
   #include <qsyphandle.h>                       // profile handles
   #include <iconv.h>                            // conversion header
   #include <sys/socket.h>                       // socket
   #include <netinet/in.h>                       // net addr
   #include <spawn.h>                            // spawn job
   #include <errno.h>                            // error number
   #include <signal.h>                           // Exception signals
   #include <qtqiconv.h>                         // iconv header
   #include <netdb.h>                            // network Db func
   #include <arpa/inet.h>                        // inet_addr header
   #include <resolv.h>                           // hstrerror header
   #include <sys/types.h>                        // types header
   #include <netinet/tcp.h>                      // TCP Options

   typedef _Packed struct sessInfo_x {
                          char sessId[16];
                          char lastAct[16];
                          char UsrPrf[10];
                          } sessInfo_t;

   #define _IDX_ENT_LEN sizeof(_Packed struct sessInfo_x)
   #define _IDX_KEY_LEN 16
   #define _SESS_IDX "SESSIDX   IRPT_OBJ  "

   int Handle_SO(int,char *,iconv_t,int,gsk_handle);
   int Handle_LO(int,char *,iconv_t,int,gsk_handle);
   int Handle_0002(int,char *,char *,iconv_t,int,gsk_handle);
   int convert_buffer(char *,char *,int,int,iconv_t);
   int crt_sessidx(char *);
   int store_session(sessInfo_t *);
   int rtv_session(sessInfo_t *,char *);
   int rmv_session(char *);
   int extract_value(char *,int,char *);
   int send_client_error(int,char *,iconv_t,int,gsk_handle);
   int expire_sessid(CFGREC *);
   #endif
