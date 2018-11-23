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

#ifndef COMMON_h
   #define COMMON_h
   #include <stdlib.h>                      // standard library
   #include <string.h>                      // string functions
   #include <stdio.h>                       // standard IO
   #include <qusec.h>                       // Error codes

   // so we don't have to remember sizes
   #define _1KB 1024
   #define _8K _1KB * 8
   #define _32K _1KB * 32
   #define _64K _1KB * 64
   #define _1MB _1KB * _1KB
   #define _1GB ((long)_1MB * _1KB)
   #define _1TB ((double)_1GB * _1KB)
   #define _4MB _1MB * 4
   #define _8MB _1MB * 8
   #define _16MB 16773120
   #define CHAR_32K "32768"
   #define _MAX_MSG 1024

   #define _DFT_PGM_LIB "IRPT_OBJ  "
   #define _DFT_SPAWN_LIB "/QSYS.LIB/IRPT_OBJ.LIB/"
   #define _MAX_WORK 200
   #define _QSIZE 1024
   #define _DFT_CFG "IRPTCFG   *LIBL     "



   #endif
