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

#ifndef UIMFUNC_h
   #define UIMFUNC_h
   #include <quidspp.h>                          // display panel
   #include <quicloa.h>                          // close UIM app
   #include <quiputv.h>                          // put variable
   #include <quiopnda.h>                         // open display app
   #include <quigetv.h>                          // get variable rec
   #include <euiafex.h>                          // app formatted data exit pgm
   #include <euialcl.h>                          // Act Lst Opt/Pull down  call
   #include <euialex.h>                          // act LstOpt /Pulldownepgm
   #include <euicsex.h>                          // Cursor sensitive prompt epgm
   #include <euifkcl.h>                          // Function Key call exit pgm
   #include <euigpex.h>                          // General Panel Exit Pgm
   #include <euiilex.h>                          // Incomplete list processing
   #include <euimicl.h>                          // Menu Item Exit Program
   #include <euitaex.h>                          // Text Area Data exit program

   #define _EXITPROG        "EXITPROG  "
   #define _SAME            "SAME"
   #define _HELPFULL_NO     "NO"
   #define _CLOSEOPT_NORMAL "M"
   #define _REDISPLAY_NO    "N"
   #define _REDISPLAY_YES   "Y"
   #define _EXTEND_NO       "N"
   #define _APPSCOPE_CALLER -1
   #define _EXITPARM_STR    0
   #define _EXITPROG_BUFLEN 20

   #endif
