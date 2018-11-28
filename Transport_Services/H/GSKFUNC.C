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

#ifndef GSKFUNC_h
   #define GSKFUNC_h
   #include <gskssl.h>                           // gsk hdr
   #include <qsyrgap1.h>                         // dcm registration

   typedef _Packed struct App_Type_x {
                          int size;
                          int key;
                          int dtaLen;
                          char dta;
                          char reserved[3];
                          } App_Type_t;

   typedef _Packed struct App_Desc_x {
                          int size;
                          int key;
                          int dtaLen;
                          char dta[50];
                          char reserved[2];
                          } App_Desc_t;

   typedef _Packed struct CA_Trust_x {
                          int size;
                          int key;
                          int dtaLen;
                          char dta;
                          char reserved[3];
                          } CA_Trust_t;

   typedef _Packed struct Cert_Rpl_x {
                          int size;
                          int key;
                          int dtaLen;
                          char dta;
                          char reserved[3];
                          } Cert_Rpl_t;

   typedef _Packed struct Ctl_Rec_x {
                          int numRecs;
                          App_Type_t appType;
                          App_Desc_t appDesc;
                          CA_Trust_t caTrust;
                          Cert_Rpl_t certRpl;
                          } Ctl_Rec_t;

   #define _CIPHER_SUITE "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"
   #define _IRPT_APPID "IRPTSECSVR_APP"
   #define _IRPT_APPID_DESC "intERPrise Secure Server"

   int crt_secure_env(gsk_handle *,char *);
   int reg_appid(char *,char *,char);
   int gsk_clean(gsk_handle *,gsk_handle *);
   #endif
