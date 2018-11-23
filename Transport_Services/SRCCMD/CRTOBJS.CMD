/*                                                                                       */
/* Copyright (c) 2018 Shield Advanced Solutions Ltd                                      */
/* Created by Shield advanced Solutions Ltd - www.shieldadvanced.com                     */
/* Original code : Chris Hird Director                                                   */
/*                                                                                       */
/* Licensed under the Apache License, Version 2.0 (the "License");                       */
/* you may not use this file except in compliance with the License.                      */
/* You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0    */
/*                                                                                       */
/* Unless required by applicable law or agreed to in writing, software                   */
/* distributed under the License is distributed on an "AS IS" BASIS,                     */
/* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.              */
/* See the License for the specific language governing permissions and                   */
/* limitations under the License.                                                        */
/*                                                                                       */
/* The above copyright notice and this permission notice shall be included in all copies */
/* or substantial portions of the Software.                                              */
/* Purpose: Build the Transport Serices objects */
/* CPP CRTOBJS */

             CMD        PROMPT('Create IRPT Objects')
             PARM       KWD(SPT) TYPE(*CHAR) LEN(10) RSTD(*YES) DFT(START) VALUES(START LIB SBS MSGQ TABLES BND DQ SRVMOD BNDSRC +
                          PGMMOD SRVPGM PGM CMD UIM) PROMPT('Start Point Label')
             PARM       KWD(FLOW) TYPE(*CHAR) LEN(5) RSTD(*YES) DFT(*CONT) VALUES(*CONT *STOP) PROMPT('Program flow')
