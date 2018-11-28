      *===============================================================
      *
      *  Copyright (c) 2008-2018 TEMBO Technology Lab (Pty) Ltd.
      *  Created by AO Foundation - www.adsero-optima.com
      *  Original TEMPLATE author: Tommy Atkins - Chief Development Officer
      *
      *  Licensed under the Apache License, Version 2.0 (the "License");
      *  you may not use this file except in compliance with the License.
      *  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
      *
      *  Unless required by applicable law or agreed to in writing, software
      *  distributed under the License is distributed on an "AS IS" BASIS,
      *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
      *  See the License for the specific language governing permissions and
      *  limitations under the License.
      *
      *  The above copyright notice and this permission notice shall be included in all
      *  copies or substantial portions of the Software.
      *
      *                      http://www.adsero-optima.com/
      *
      *===============================================================
     h main(CUSMST_D) Copyright('© TEMBO Technologies (Pty) Ltd.')
     h dftactgrp(*no) actgrp(*caller) bnddir('AOOSRV') usrprf(*owner)
     h aut(*use) extbinint(*yes) option(*srcstmt:*nodebugio) debug
      *===============================================================
     d CUSMST_D        pr                  extpgm('CUSMST_D')
     d  Action                        7    const
     d  Applic                         *   const
     d  QueCtl                       20    const
     d  InpLen                       10i 0 const
     d  InpPtr                         *   const
     d  OutLen                       10i 0
     d  OutPtr                         *   const
      *===============================================================
     d ParmLP          s               *   import
     d ParmL           ds                  based(ParmLP) qualified
     d  Applic                         *
     d  InpPtr                         *
     d  OutPtr                         *
     d  QueCtl                       20
     d  InpLen                       10i 0
     d  OutLen                       10i 0
      *===============================================================
     d W               ds                  import qualified
     d  ProgName                     10
     d  ProgDescr                    50
     d  Audit                          n
     d  Handle                        6
     d  SysName                       8
      *===============================================================
      /copy SRCCPY,ERR00#                        Clear Current Message Queue
      /copy SRCCPY,ERR03#                        Move *DIAG and Resend *ESCAPE Messages
      /copy SRCCPY,ERR11#                        Send *ESCAPE Message
      /copy SRCCPY,CMD#                          Execute Command - Processor
      *===============================================================
     d Initialize      pr
     d  WEBSRVCFGP                     *         const
     d Process         pr
      *===============================================================
     d Identify        pr             3    extproc('AOOSRV@04A')
     d ErrorResp       pr                  extproc('AOOSRV@04B')
      *===============================================================
     d PrintAudit      pr                  extproc('PRINTAUDIT')
      *===============================================================
     d Filter          pr                  extproc('CUSMST@01A')
     d AddCus          pr                  extproc('CUSMST@02A')
     d UpdCus          pr                  extproc('CUSMST@02B')
     d DltCus          pr                  extproc('CUSMST@02C')
     d DspCus          pr                  extproc('CUSMST@02D')
      *===============================================================
      /copy SRCCPY,CUSMSTF@#                     IOS [PLKR] import
      *===============================================================
     d InpDataP        s               *   import
     d InpData         s           4096    based(InpDataP)
     d OutDataP        s               *   import
     d OutData         s           4096    based(OutDataP)
     d OutData5        s              5    based(OutDataP)
      *===============================================================
      *& Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p CUSMST_D        b
     d                 pi
     d  Action                        7    const
     d  Applic                         *   const
     d  QueCtl                       20    const
     d  InpLen                       10i 0 const
     d  InpPtr                         *   const
     d  OutLen                       10i 0
     d  OutPtr                         *   const
      *====================================================
      /free
       //==================================================
       monitor;
          //===============================================
          ERR00();
          //===============================================
          select;
             when Action = 'START';
                  Initialize(Applic);
                  ParmL.Applic = Applic;
                  W.ProgName  = 'CUSMST_D';
                  W.ProgDescr = 'Customer Master Maintenence (CUSMSTF)';
                  Cmd('STRCMTCTL *CHG');
                  CUSMSTF@('FO');
             when Action = 'PROCESS';
                  ParmL.QueCtl = QueCtl;
                  ParmL.InpLen = InpLen;
                  ParmL.InpPtr = InpPtr;
                  ParmL.OutLen = OutLen;
                  ParmL.OutPtr = OutPtr;
                  InpDataP = InpPtr;
                  OutDataP = OutPtr;
                  Process();
                  OutLen = (OutDataP - OutPtr);
                  ParmL.OutLen = OutLen;
                  PrintAudit();
             when Action = 'ENDPGM';
                  CUSMSTF@('FC');
                  W.Audit = *off;
                  PrintAudit();
          endsl;
          //===============================================
       on-error;
          ErrorResp();
          PrintAudit();
       endmon;
       //?==================================================
      /end-free
     p                 e
      *===============================================================
      * Process Request <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p Process         b
      *====================================================
     d Action          s              3
      *====================================================
      /free
       //==================================================
       monitor;
          //===============================================
          Action = Identify();
          //===============================================
          select;
              when Action = 'Flt';
                   Filter();
              when Action = 'Add';
                   AddCus();
              when Action = 'Upd';
                   UpdCus();
              when Action = 'Dlt';
                   DltCus();
              when Action = 'Dsp';
                   DspCus();
          endsl;
          //===============================================
       on-error;
          ERR03();
       endmon;
       //==================================================
      /end-free
     p                 e
      *?==============================================================
