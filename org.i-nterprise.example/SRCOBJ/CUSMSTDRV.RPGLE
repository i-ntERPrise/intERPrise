      *& Apache License
      *===================================================================================
      *  Copyright (c) 2008-2018 TEMBO Technology Lab (Pty) Ltd.
      *  Created by AO Foundation - www.adsero-optima.com
      *  Original TEMPLATE author: Tommy Atkins - Chief Development Officer
      *
      *  Licensed under the Apache License, Version 2.0 (the "License");
      *  you may not use this file except in compliance with the License.
      *  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2
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
      *===============================================================
     h main(CUSMSTDRV) Copyright('© TEMBO Technologies (Pty) Ltd.')
     h dftactgrp(*no) actgrp(*new) bnddir('EXPSRV') usrprf(*owner)
     h aut(*use) extbinint(*yes) option(*nodebugio) debug
      *===============================================================
     d CUSMSTDRV       pr                  extpgm('CUSMSTDRV')
     d  InpPtr                         *   const
     d  OutPtr                         *   const
      *===============================================================
      /copy SRCCPY,ERR00                         Clear Current Message Queue
      /copy SRCCPY,ERR03                         Move *DIAG and Resend *ESCAPE Messages
      /copy SRCCPY,ERR11                         Send *ESCAPE Message
      /copy SRCCPY,CMD                           Execute Command - Processor
      *===============================================================
     d Initialize      pr
      *===============================================================
     d Identify        pr             3    extproc('DRVSRV@04A')
     d ErrorResp       pr                  extproc('DRVSRV@04B')
      *===============================================================
     d Filter          pr                  extproc('CUSMST@01A')
     d AddCus          pr                  extproc('CUSMST@02A')
     d UpdCus          pr                  extproc('CUSMST@02B')
     d DltCus          pr                  extproc('CUSMST@02C')
     d DspCus          pr                  extproc('CUSMST@02D')
      *===============================================================
      /copy SRCCPY,CUSMSTF@                      IOS [PLKR] import
      *===============================================================
     d IDP             s               *   import
     d IDLen           s             10i 0 based(IDP)
     d InpDataP        s               *   import
     d InpData         s           4096    based(InpDataP)
      *===============================================================
     d ODP             s               *   import
     d ODLen           s             10i 0 based(ODP)
     d OutDataP        s               *   import
     d OutData         s           4096    based(OutDataP)
      *===============================================================
      *& Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p CUSMSTDRV       b
     d                 pi
     d  InpPtr                         *   const
     d  OutPtr                         *   const
      *====================================================
      /free
       //==================================================
       Cmd('STRCMTCTL *CHG');
       Initialize();
       //==================================================
       IDP = InpPtr;
       InpDataP = IDP + 4;
       ODP = OutPtr;
       OutDataP = ODP + 4;
       //==================================================
       monitor;
          //===============================================
          ERR00();
          CUSMSTF@('FO');
          //===============================================
          Process();
          //===============================================
       on-error;
          ErrorResp();
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
