000100190116      *& Apache License
000200181224      *===================================================================================
000300181224      *  Copyright (c) 2008-2018 TEMBO Technology Lab (Pty) Ltd.
000400181224      *  Created by AO Foundation - www.adsero-optima.com
000500181224      *  Original TEMPLATE author: Tommy Atkins - Chief Development Officer
000600181224      *
000700181224      *  Licensed under the Apache License, Version 2.0 (the "License");
000800181224      *  you may not use this file except in compliance with the License.
000900181224      *  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2
001000181224      *
001100181224      *  Unless required by applicable law or agreed to in writing, software
001200181224      *  distributed under the License is distributed on an "AS IS" BASIS,
001300181224      *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
001400181224      *  See the License for the specific language governing permissions and
001500181224      *  limitations under the License.
001600181224      *
001700181224      *  The above copyright notice and this permission notice shall be included in all
001800181224      *  copies or substantial portions of the Software.
001900181224      *
002000181224      *                      http://www.adsero-optima.com/
002100190124      *& =============================================================
002200190124     h main(CUSMST_JD) Copyright('© TEMBO Technologies (Pty) Ltd.')
002300190124     h dftactgrp(*no) actgrp(*caller) bnddir('EXPSRV') usrprf(*owner)
002400181222     h aut(*use) extbinint(*yes) option(*nodebugio) debug
002500180416      *===============================================================
002600190124     d CUSMST_JD       pr                  extpgm('CUSMST_JD')
002701190125     d  Action                        7
002702190125     d  Applic                         *
002703190125     d  QueCtl                       20
002704190125     d  InpLen                       10i 0
002705190125     d  InpPtr                         *
002706190125     d  OutLen                       10i 0
002707190125     d  OutPtr                         *
002800180927      *===============================================================
002900190124     d iWebPL          ds                  import qualified
003000190124     d  Action                        7
003100190124     d  Applic                         *
003200190124     d  QueCtl                       20
003300190124     d  InpLen                       10i 0
003400190124     d  InpPtr                         *
003500190124     d  OutLen                       10i 0
003600190124     d  OutPtr                         *
003700190124      *===============================================================
003800190124     d W               ds                  import qualified
003900190124     d  ProgName                     10
004000190124     d  ProgDescr                    50
004100190124     d  Audit                          n
004200190124     d  Handle                        6
004300190124     d  SysName                       8
004400190124      *===============================================================
004500181222      /copy SRCCPY,ERR00                         Clear Current Message Queue
004600181222      /copy SRCCPY,ERR03                         Move *DIAG and Resend *ESCAPE Messages
004700181222      /copy SRCCPY,ERR11                         Send *ESCAPE Message
004800181222      /copy SRCCPY,CMD                           Execute Command - Processor
004900181224      *===============================================================
005000181227     d Initialize      pr
005100190124     d  WEBSRVCFGP                     *         const
005200181227      *===============================================================
005300181227     d Identify        pr             3    extproc('DRVSRV@04A')
005400181227     d ErrorResp       pr                  extproc('DRVSRV@04B')
005500180929      *===============================================================
005600190124     d PrintAudit      pr                  extproc('PRINTAUDIT')
005700190124      *===============================================================
005800180928     d Filter          pr                  extproc('CUSMST@01A')
005900181002     d AddCus          pr                  extproc('CUSMST@02A')
006000181004     d UpdCus          pr                  extproc('CUSMST@02B')
006100181004     d DltCus          pr                  extproc('CUSMST@02C')
006200181004     d DspCus          pr                  extproc('CUSMST@02D')
006300180926      *===============================================================
006400181224      /copy SRCCPY,CUSMSTF@                      IOS [PLKR] import
006500180430      *===============================================================
006600181227     d IDP             s               *   import
006700190124     d InpData         s           4096    based(IDP)
006800181224      *===============================================================
006900181227     d ODP             s               *   import
007000190124     d OutData         s           4096    based(ODP)
007100180927      *===============================================================
007200181001      *& Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
007300180413      *===============================================================
007400190124     p CUSMST_JD       b
007500180924     d                 pi
007601190125     d  Action                        7
007602190125     d  Applic                         *
007603190125     d  QueCtl                       20
007604190125     d  InpLen                       10i 0
007605190125     d  InpPtr                         *
007606190125     d  OutLen                       10i 0
007607190125     d  OutPtr                         *
007700180416      *====================================================
007701190128     d OutTest         s           4096    based(OutPtr)
007702190128      *====================================================
007800180215      /free
007900181227       //==================================================
008000180416       monitor;
008100180416          //===============================================
008200180928          ERR00();
008300190124          //===============================================
008400190124          select;
008500190125             when Action = 'START';
008600190125                  Initialize(Applic);
008700190124                  W.ProgName  = 'CUSMST_D';
008800190124                  W.ProgDescr = 'Customer Master Maintenence (CUSMSTF)';
008801190125                  Cmd('STRCMTCTL *CHG');
008900190124                  CUSMSTF@('FO');
009000190125             when Action = 'PROCESS';
009100190125                  iWebPL.Action = Action;
009101190125                  iWebPL.Applic = Applic;
009102190125                  iWebPL.QueCtl = QueCtl;
009200190125                  iWebPL.InpLen = InpLen;
009300190125                  iWebPL.InpPtr = InpPtr;
009400190125                  iWebPL.OutLen = OutLen;
009500190125                  iWebPL.OutPtr = OutPtr;
009600190125                  IDP = InpPtr;
009700190125                  ODP = OutPtr;
009800190124                  Process();
009801190128                  OutLen = iWebPL.OutLen;
009900190124                  PrintAudit();
010000190125             when Action = 'ENDPGM';
010100190124                  CUSMSTF@('FC');
010200190124                  W.Audit = *off;
010300190124                  PrintAudit();
010400190124          endsl;
010500190124          //===============================================
010600180416       on-error;
010700180930          ErrorResp();
010800180416       endmon;
010900180424       //?==================================================
011000180424      /end-free
011100180424     p                 e
011200180424      *===============================================================
011300180925      * Process Request <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
011400180925      *===============================================================
011500180424     p Process         b
011600180424      *====================================================
011700180929     d Action          s              3
011800180925      *====================================================
011900180424      /free
012000180424       //==================================================
012100180424       monitor;
012200180416          //===============================================
012300180925          Action = Identify();
012400180925          //===============================================
012500180926          select;
012600181001              when Action = 'Flt';
012700180928                   Filter();
012800181001              when Action = 'Add';
012900181002                   AddCus();
013000181001              when Action = 'Upd';
013100181004                   UpdCus();
013200181001              when Action = 'Dlt';
013300181004                   DltCus();
013400181001              when Action = 'Dsp';
013500181004                   DspCus();
013600180926          endsl;
013700180925          //===============================================
013800180514       on-error;
013900180925          ERR03();
014000180514       endmon;
014100181004       //==================================================
014200180416      /end-free
014300180416     p                 e
014400180416      *?==============================================================
