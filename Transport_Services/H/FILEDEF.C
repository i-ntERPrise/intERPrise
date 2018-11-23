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

#ifndef FILEDEF_h
   #define FILEDEF_h
   #include <recio.h>                            // Record I/O

   // default configuration file
   #pragma mapinc("dft","IRPTCFG(CFGREC)","both","_P","","DATA_F")
   #include "dft"
   typedef DATA_F_CFGREC_both_t CFGREC;
   #define _CFG_REC sizeof(CFGREC)

   #endif

