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
     h Copyright('© TEMBO Technologies (Pty) Ltd.')
     h dftactgrp(*no) actgrp(*new) bnddir('WEBSRVDIR') usrprf(*owner)
     h aut(*use) extbinint(*yes) option(*srcstmt:*nodebugio) debug
      *===============================================================
     fWebApiTstdcf   e             Workstn Infds(@#fids)
     fqsysprt   o    f  198        Printer Usropn Oflind(*Inof)
      *===============================================================
     d qCmdExc         Pr                  ExtPgm('QCMDEXC')
     d   Cmd                      65535A   Options(*VarSize) Const
     d   CmdLen                      15P 5 const
      *===============================================================
     d CRTUS           pr              *
     d  US                           10    const
     d  USInit                        1    const
     d DLTUS           pr
     d  US                           10    const
      *===============================================================
     d MemCpy          Pr                  ExtProc('memcpy')
     d  pTarget                        *   Value
     d  pSource                        *   Value
     d  pLength                      10i 0 Value
      *===============================================================
     d ApplicationPgm  Pr                  ExtPgm('CUSMST_D')                   *
     d  pAction                       7    Const
     d  pApl_Ptr                       *   Const Options(*NoPass)
     d  pQue_Ctl                     20    Const Options(*NoPass)
     d  pInp_Len                     10i 0 Const Options(*NoPass)
     d  pInp_Ptr                       *   Const Options(*NoPass)
     d  pOut_Len                     10i 0       Options(*NoPass)
     d  pOut_Ptr                       *   Const Options(*NoPass)
      *===============================================================
     d CenterText      Pr
     d   Txt_Ptr                       *   const
     d ApiTst          Pr
     d DATETIME        Pr
     d DSPCTL          Pr
     d ENDAPITST       Pr
     d INZIND          Pr
     d INZINP          Pr
     d INZPGM          Pr
     d INZPRT          Pr
     d NEWRQS          Pr
     d PRTADT          Pr
     d STRAPITST       Pr
     d WRKJOB          Pr
      *===============================================================
     d qPsds          sds
     d  qPgm             *Proc
     d  qParms           *Parms
     d  qsts                  11     15  0
     d  qmsgn                 40     46
     d  qpgmL                 81     90
     d  qmsgt                 91    170
     d  qdmft                191    198
     d  qlof                 201    208
     d  qfsts                209    243
     d  qjob                 244    253
     d  quser                254    263
     d  qjobn                264    269
      *===============================================================
     d @#Fids          ds
     d  FdsNam                 1      8
     d  OdpTyp                81     82
     d  FdFile                83     92
     d  FdLib                 93    102
     d  PriRln               125    126B 0
     d  SecRln               127    128B 0
     d  FdMbr                129    138
     d  BufIn                139    142B 0
     d  BufOut               143    146B 0
     d  NbrRcd               156    159B 0
     d  AccTyp               160    161
     d  DupKey               162    162
     d  SrcFle               163    163
     d  Block                190    191B 0
      *===============================================================
     d wErrords        ds
     d  wErr_Byt_Avl                 10u 0 Inz(%Size(wErrords))
     d  wErr_Byt_Use                 10u 0 Inz(0)
     d  wErr_Msg_Id                   7
     d  wErr_#                        1
     d  wErr_Dta                    256
     d  wErr_Txt              17     56
      *===============================================================
     d wWeb_Cfg      e ds                  ExtName(WebSrvCfg)
      *===============================================================
      * T a b l e s   &   A r r a y s
     d wTbl            s            100    DIM(01) Ctdata Perrcd(1)
     d wFkey           s            100    DIM(01) Ctdata Perrcd(1)
     d wHdg            s             50    Dim(04) CtData Perrcd(1)
     d wMsg            s            100    Dim(01) CtData Perrcd(1)
      *===============================================================
      * Data Structure:  Standard Literals
     d wLiterals       ds
     d  L@jobh                             Inz(' Job:')
     d  L@usrh                             Inz('User:')
     d  L@pgmh                             Inz('Program:')
     d  L@sys                              Inz('System:')
     d  L@msg                         7    Inz('InfMsg:')
     d  L@err                         7    Inz(' Error:')
      *===============================================================
      *  User Space Variables/Values
     d wUsp_Nam        s             20
     d wUsp_Atr        s             10
     d wUsp_Aut        s             10    Inz('*ALL')
     d wUsp_Dom        s             10    Inz('*DEFAULT')
     d wUsp_Int        s              1    Inz(x'00')
     d wUsp_Ptr        s               *
     d wUsp_Rpl        s             10    Inz('*NO')
     d wUsp_Siz        s             10i 0 Inz(4000)
     d wUsp_Max        s             10i 0 Inz(16773120)
     d wUsp_Txt        s             50

     d wUsp_Inp        s             20
     d wUsp_Out        s             20

     d wInp_Ptr        s               *
     d wOut_Ptr        s               *

     d wInp_Len        s             10i 0 Inz(0)
     d wOut_Len        s             10i 0 Inz(0)
      *===============================================================
      * Data Structure:  User Space Attribute
     d wSpc_Atr        ds
     d  wAtr_Nbr                      9B 0 Inz(1)
     d  wAtr_Key1                     9B 0 Inz(3)
     d  wAtr_Len1                     9B 0 Inz(1)
     d  wAtr_Dta1                     1    Inz('1')
      *===============================================================
      * Date/Time Data Type Fields:
     d wDate_Iso       s               D   DatFmt(*Iso)
     d wTime_Iso       s               T   TimFmt(*Iso)
     d wCur_Tsp        s               Z
     d wDate           s             10
     d wTime           s              8
      *===============================================================
      * P r o g r a m   U n i q u e   F i e l d s
     d wApl_Pgm        s                   Like(WsCode)
     d wCmd            s          65535    Varying
     d wQue_Ctl        s             20
     d wDyn_Sql        s           4096
     d wEnd_Rpt        s             15    Inz(' End-of-Report ')
     d wIdx            s             10i 0 Inz(0)
     d wLoop           s               N   Inz(*On)
     d wPrt_Adt        s              1    Inz('Y')
     d wPrt_Dta        s          65535    Varying
     d wPrt_Lin        s            198
     d wPrt_Xtr        s            198
     d wRpask          s            198    Inz(*All'*')
     d wRpdsh          s            198    Inz(*All'-')
     d wRpeor          s            198    Inz(*All'*')
     d wRtn_Lib        s             10
     d wSav_Cde        s                   Like(WsCode)
     d wSav_Env        s                   Like(WsEnv)
     d wSav_Bes        s                   Like(WsEnv)
     d wSys_Nam        s              8
     d wWork           s          65535    Varying
      *===============================================================
      * G l o b a l   D a t a   A r e a s
      * System Control
     d wSysCtl         ds          2000    DtaAra(SysCtl)
     d  wOrgNam                      50
      *===============================================================
      /free
       //?=============================================================
       //? M a i n l i n e <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
       //?=============================================================
       exec sql set option closqlcsr=*endmod, DLYPRP=*yes, commit=*none;
       //?==================================================
       InzPgm();
       //?==================================================
       D@Code = 'AMWCUSINQ';
       D@Env  = 'TEMBO';
       D@Bes  = wSys_Nam;
       D@Pip  = 'AcctId';
       D@Piv  = '1000';
       D@Rqs  = '{"Handle":"******",+
                  "Action":"Add",+
                  "CUSTNO":"0",+
                  "RECSTS":"",+
                  "CUSNME":"Testing Add",+
                  "ADRLN1":"Address 1",+
                  "ADRLN2":"Address 2",+
                  "ADRLN3":"Address 3",+
                  "PSTCDE":"1546",+
                  "STRDTE":"0001-01-01",+
                  "PHONEN":"0116096278",+
                  "REPCDE":"2",+
                  "USERID":""+
                  }';
       //?==================================================
       Dow wLoop = *On;
           //?==============================================
           Select;
               When @MsgTxt = *Blanks;
               When *In91 = *On;
                    @MsgTyp = L@Err;
               Other;
                    @MsgTyp = L@Msg;
                    *In92 = *On;
           Endsl;
           //?==============================================
           Datetime();
           //?==============================================
           Write Heading1;
           Write Message;
           //?==============================================
           Select;
               When (D@Code <> wSav_Cde) or
                    (D@Env  <> wSav_Env) or
                    (D@Bes  <> wSav_Bes);
                    Write NonDsp;
                    Exfmt Heading2;
               Other;
                    Write Heading2;
                    Exfmt Display;
                    Read  Heading2;
           Endsl;
           //?==============================================
           If *Inlr = *On;
              Leave;
           Endif;
           //?==============================================
           *In91 = *Off;
           *In92 = *Off;
           @MsgTxt = *Blanks;
           //?==============================================
           Select;
               When *InKc = *On or *InKl = *On;
                    Leave;
               When *InKd = *On;
                    WrkJob();
               When (D@Code <> wSav_Cde) or
                    (D@Env  <> wSav_Env) or
                    (D@Bes  <> wSav_Bes);
                    DspCtl();
               When *InKe = *On;
                    wSav_Cde = *Blanks;
                    wSav_Env = *Blanks;
                    wSav_Bes = *Blanks;
                    D@Rqs = *Blanks;
                    DspCtl();
               When *InKk = *On;
                    ApiTst();
               Other;
                    DspCtl();
           endsl;
           //?==============================================
       Enddo;
       //?==================================================
       //?End API Testing ...
       EndApiTst();
       //?==================================================
       //?Delete Temporary User Spaces ...
       DLTUS('WS_APL_INP');
       DLTUS('WS_APL_OUT');
       //?==================================================
       *Inlr = *On;
       Return;
       //?==================================================
      /End-Free
      *================================================================
      * O u t p u t   S p e c i f i c a t i o n s
      *================================================================
     oqSysPrt   e            #Hdg1            01                                *
     o         or    of                                                         *
     o                                          + 0 'User:'                     *
     o                       qUser              + 1                             *
     o                       wHdg(1)            124                             *
     o                                          187 'Date:'                     *
     o                       wDate              + 1                             *
     ?*-------------------------------------------------------------------------*
     o          e            #Hdg1       1                                      *
     o         or    of                                                         *
     o                                          + 0 ' Job:'                     *
     o                       qJob               + 1                             *
     o                       wHdg(2)            124                             *
     o                                          187 'Time:'                     *
     o                       wTime              198                             *
     ?*-------------------------------------------------------------------------*
     o          e            #Hdg1       1                                      *
     o         or    of                                                         *
     o                                          + 0 ' Pgm:'                     *
     o                       qPgm               + 1                             *
     o                       wHdg(3)            124                             *
     o                       Page          4    198                             *
     o                                          187 'Page:'                     *
     ?*-------------------------------------------------------------------------*
     o          e            #Hdg1       1                                      *
     o         or    of                                                         *
     o                       wRpask             + 0                             *
     ?*-------------------------------------------------------------------------*
     o          ef           #Hdg2       1                                      *
     o                                          + 0 '      Application Code:'   *
     o                       D@Code             + 1                             *
     ?*-------------------------------------------------------------------------*
     o          ef           #Hdg2       1                                      *
     o                                          + 0 '           Environment:'   *
     o                       D@Env              + 1                             *
     ?*-------------------------------------------------------------------------*
     o          ef           #Hdg2       1                                      *
     o                                          + 0 '       Back End-System:'   *
     o                       D@Bes              + 1                             *
     ?*-------------------------------------------------------------------------*
     o          ef           #Hdg2       2                                      *
     o                                          + 0 ' Partner Identity Code:'   *
     o                       D@Pip              + 1                             *
     ?*-------------------------------------------------------------------------*
     o          ef           #Hdg2       1                                      *
     o                                          + 0 'Partner Identity Value:'   *
     o                       D@Piv              + 1                             *
     ?*-------------------------------------------------------------------------*
     o          ef           #Hdg2       1                                      *
     o                                          + 0 'Http Request (Payload):'   *
     ?*-------------------------------------------------------------------------*
     o          ef           #Hdg3       1                                      *
     o                                          + 0 'Http Return/Response:'     *
     ?*-------------------------------------------------------------------------*
     ?*  Audit/Generic Line                                                     *
     ?*-------------------------------------------------------------------------*
     o          ef           #Audit      1                                      *
     o                       wPrt_Lin           + 0                             *
     ?*-------------------------------------------------------------------------*
     ?*  Audit/Generic Line - Extra                                             *
     ?*-------------------------------------------------------------------------*
     o          ef           #Prt_Xtr    1                                      *
     o                       wPrt_Xtr           198                             *
     ?*-------------------------------------------------------------------------*
     ?*  End-of-Report                                                          *
     ?*-------------------------------------------------------------------------*
     o          E            #Eor        1                                      *
     o                       wRpEor           +   0                             *
      *================================================================
      * DspCtl: Display Control <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *================================================================
     p DspCtl          b                                                        *
     d                 pi                                                       *
      *=====================================================
      /free

       InzInd();

       Select;
       When D@Code = *Blanks;
            *In01 = *On;
            *In91 = *On;
            @MsgTxt = 'Application Code ' + wMsg(1);
            Return;

       When D@Env = *Blanks;
            *In02 = *On;
            *In91 = *On;
            @MsgTxt = 'Environment ' + wMsg(1);
            Return;

       When D@BeS = *Blanks;
            *In03 = *On;
            *In91 = *On;
            @MsgTxt = 'Front-End Sys Nam ' + wMsg(1);
            Return;

       When (D@Code <> wSav_Cde) or
            (D@Env  <> wSav_Env) or
            (D@Bes  <> wSav_Bes);
            InzInp();
            NewRqs();
            If *In91 = *On;
               Return;
            Endif;
            wSav_Cde  = D@Code;
            wSav_Env  = D@Env;
            wSav_Bes  = D@Bes;
       Endsl;

       If *InKk = *Off;
          *In06 = *On;
       Endif;

      /end-free
     p                 e
     ?*=========================================================================*
     ?*----------------------*                                                  *
     ?*  NewRqs: New Request *                                                  *
     ?*----------------------*                                                  *
     p NewRqs          b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free

       Exec Sql Open WebSrvCfg_C Using :D@Code,:D@Env,:D@Bes;
       Exec Sql Fetch Next From WebSrvCfg_C Into :wWeb_Cfg;
       If SqlCod <> 0;
          @MsgTxt = '"' + %Trim(D@Code) + '"'
                  + ' NOT found in configuration table "WebSrvCfg".';
          *In01 = *On;
          *In91 = *On;
       Else;
          D@Desc = WsDesc;
          StrApiTst();
       Endif;
       Exec Sql Close WebSrvCfg_C;

      /end-free
     p                 e
     ?*=========================================================================*
     ?*----------------------------------*                                      *
     ?*  InzInp: Initialize Input Values *                                      *
     ?*----------------------------------*                                      *
     p InzInp          b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free
       D@Desc = *Blanks;
       D@Rsp  = *Blanks;
      /end-free
     p                 e
     ?*=========================================================================*
     ?*----------------------------*                                            *
     ?*  StrApiTst: Start API Test *                                            *
     ?*----------------------------*                                            *
     p StrApiTst       b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free

       If wSav_Cde <> *Hival;
          EndApiTst();
       Endif;

       *InOf = *Off;
       Page = 0;
       Open(e) Qsysprt;
       Except #Hdg1;

       wApl_Pgm = D@Code;

       //?ApplicationPgm('START');
       Callp(e) ApplicationPgm('START'            //?Action
                               :%Addr(wWeb_Cfg)); //?WebSrvCfg Data Structure
       If %Error();
          wPrt_Dta = 'Error StrApiTst: ' + qMsgN + '=' + %Trim(qMsgT);
          PrtAdt();
       Endif;

      /end-free
     p                 e
     ?*=========================================================================*
     ?*-------------------*                                                     *
     ?*  ApiTst: API Test *                                                     *
     ?*-------------------*                                                     *
     p ApiTst          b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free

       Except #Hdg2;
       wPrt_Dta = D@Rqs;
       PrtAdt();

       //?ApplicationPgm('PROCESS');
       wQue_Ctl = 't-' + %Char(%Dec(%TimeStamp()));
       wWork = %Trim(D@Pip) + '=' + %Trim(D@Piv) + %Trim(D@Rqs);
       wInp_Len = %Len(wWork);
       MemCpy(wInp_Ptr:%Addr(wWork:*Data):wInp_Len);

       //?Display Input User Space ...
       wCmd = 'Dspf Stmf(' + '''/qsys.lib/qtemp.lib/WS_APL_INP.usrspc''' + ')';
       Callp(e) qCmdExc(wCmd:%Len(%Trim(wCmd)));

       wOut_Len = 0;
       Callp(e) ApplicationPgm('PROCESS'        // Action
                               :%Addr(wWeb_Cfg) //?WebSrvCfg Data Structure
                               :wQue_Ctl        // Sequence/Transaction Id
                               :wInp_Len        // Input Length
                               :wInp_Ptr        // Input Pointer
                               :wOut_Len        // Output Length
                               :wOut_Ptr);      // Output Pointer
       If %Error();
          wPrt_Dta = 'Error ApiTst: ' + qMsgN + '=' + %Trim(qMsgT);
          PrtAdt();
          Return;
       Endif;

       //?Display Output User Space ...
       wCmd = 'Dspf Stmf(' + '''/qsys.lib/qtemp.lib/WS_APL_OUT.usrspc''' + ')';
       Callp(e) qCmdExc(wCmd:%Len(%Trim(wCmd)));

       D@Rsp = *Blanks;
       MemCpy(%Addr(D@Rsp):wOut_Ptr:wOut_Len);

       Except #Hdg3;
       wPrt_Dta = D@Rsp;
       PrtAdt();

       wPrt_Lin = *All'-';
       Except #Audit;

      /end-free
     p                 e
     ?*=========================================================================*
     ?*--------------------------*                                              *
     ?*  EndApiTst: End API Test *                                              *
     ?*--------------------------*                                              *
     p EndApiTst       b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free

       //?ApplicationPgm('ENDPGM');
       Callp(e) ApplicationPgm('ENDPGM');
       If %Error();
          wPrt_Dta = 'Error EndApiTst: ' + qMsgN + '=' + %Trim(qMsgT);
          PrtAdt();
       Endif;

       If %Open(Qsysprt);
          Except #Eor;
          Close(e) Qsysprt;
       Endif;

      /end-free
     p                 e
     ?*=========================================================================*
     ?*--------------------------------*                                        *
     ?*  InzInd: Initialize Indicators *                                        *
     ?*--------------------------------*                                        *
     p InzInd          b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free
       *In01 = *Off;
       *In02 = *Off;
       *In03 = *Off;
       *In06 = *Off;
      /end-free
     p                 e
     ?*=========================================================================*
     ?*-------------------------------*                                         *
     ?*  WrkJob: WrkJob Option(*SPLF) *                                         *
     ?*-------------------------------*                                         *
     p WrkJob          b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free
       wCmd = 'WrkJob Option(*Splf)';
       Callp(e) qCmdExc(wCmd:%Len(%Trim(wCmd)));
      /end-free
     p                 e
     ?*=========================================================================*
     ?*---------------------------*                                             *
     ?*  PrtAdt: Print Audit LIne *                                             *
     ?*---------------------------*                                             *
     p PrtAdt          b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free
       If wPrt_Adt <> 'Y';
          Return;
       Endif;
       wPrt_Dta = %TrimR(wPrt_Dta);
       wPrt_Lin = wPrt_Dta;
       Except #Audit;
       If %Len(wPrt_Dta) <= %Size(wPrt_Lin);
          Return;
       Endif;
       wPrt_Dta = %Subst(wPrt_Dta:%Size(wPrt_Lin)+1);
       Dow wLoop = *On;
           wPrt_Xtr = wPrt_Dta;
           Except #Prt_Xtr;
           If %Len(wPrt_Dta) <= %Size(wPrt_Xtr);
              Leave;
           Else;
              wPrt_Dta = %Subst(wPrt_Dta:%Size(wPrt_Xtr)+1);
           Endif;
       Enddo;
      /end-free
     p                 e
     ?*=========================================================================*
     ?*-----------------------------*                                           *
     ?*  InzPgm: Initialize Program *                                           *
     ?*-----------------------------*                                           *
     p InzPgm          b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free

       //?Create WebSrvCfg SQL Prepare(s) and Declare(s) ...
       wDyn_Sql = 'Select * From WebSrvCfg Where'
                + ' WsCode=? and WsEnv=? and WsBeSn=?'
                + ' For Read Only with Nc';
       Exec Sql Prepare WebSrvCfg_S from: wDyn_Sql;
       Exec Sql Declare WebSrvCfg_C Cursor for WebSrvCfg_S;

       SqlCod = 0;

       Datetime();

       In(e) wSysCtl;   //?System Control Data Area;
       wHdg(1) = wOrgNam;
       //===================================================
       //?Create User Space: Web Service Application Request Input ...
       wInp_Ptr = CRTUS('WS_APL_INP':x'00');
       //?Create User Space: Web Service Application Response Output ...
       wOut_Ptr = CRTUS('WS_APL_OUT':x'00');
       //===================================================
       Exec Sql Set :wSys_Nam = Current Server;
       wHdg(3) = 'System: ' + %Trim(wSys_Nam);

       D@Hdg1 = wHdg(1);
       wWork  = D@Hdg1;
       CenterText(%Addr(wWork));
       D@Hdg1 = wWork;

       D@Hdg2 = wHdg(2);
       wWork  = D@Hdg2;
       CenterText(%Addr(wWork));
       D@Hdg2 = wWork;

       For wIdx = 1 to %Elem(wTbl);
           wCmd = %Trim(wTbl(wIdx));
           Callp(e) qCmdExc(wCmd:%Len(%Trim(wCmd)));
       Endfor;

       @Fky1 = wFkey(1);

       wSav_Cde = *Hival;
       wSav_Env = *Hival;
       wSav_Bes = *Hival;

       InzPrt();

      /end-free
     p                 e
     ?*=========================================================================*
     ?*--------------------------------*                                        *
     ?*  InzPrt: Initialize Print File *                                        *
     ?*--------------------------------*                                        *
     p InzPrt          b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free

       If wPrt_Adt <> 'Y';
          Return;
       Endif;

       In(e) wSysCtl;   //?System Control Data Area;
       wHdg(1) = wOrgNam;

       Exec Sql Set :wSys_Nam = Current Server;
       wHdg(3) = 'System: ' + %Trim(wSys_Nam);

       wCmd = wTbl(1);
       Callp(e) qCmdExc(wCmd:%Len(%Trim(wCmd)));

       %Subst(wRpeor:92:15) = wEnd_Rpt;

       For wIdx = 1 to 3;
           wWork = wHdg(wIdx);
           CenterText(%Addr(wWork));
           wHdg(wIdx) = wWork;
       Endfor;

      /end-free
     p                 e
     ?*=========================================================================*
     ?*----------------------------------*                                      *
     ?*  DateTime: Current Date and Time *                                      *
     ?*----------------------------------*                                      *
     p DateTime        b                                                        *
     d                 pi                                                       *
     ?*-------------------------------------------------------------------------*
      /free
       wDate_Iso = %Date();
       wDate = %Char(wDate_Iso);
       wTime_Iso = %Time();
       wTime = %Char(wTime_Iso);
       wCur_Tsp = %TimeStamp();
       D@Time = wTime;
       D@Date = wDate;
      /end-free
     p                 e
     ?*=========================================================================*
     ?*-------------*                                                           *
     ?*  CenterText *                                                           *
     ?*-------------*                                                           *
     p CenterText      b                                                        *
     d                 pi                                                       *
     d  Txt_Ptr                        *   Const                                *
                                                                                *
     d pIdx            s             10i 0 Inz(0)                               *
     d pText           s          65535    Varying Based(Txt_Ptr)               *
     d pWork           s          65535    Varying                              *
     ?*-------------------------------------------------------------------------*
      /free
         pWork = %Trim(pText);
         If %Len(pWork) > 0;
            pIdx = %Int((%Len(pText)-%Len(pWork))/2);
            If pIdx > 0;
               %Subst(pText:1:%Len(pText)) = *Blanks;
               %Subst(pText:pIdx+1) = pWork;
            Endif;
         Endif;
      /end-free
     p                 e
      *===============================================================
**
OVRPRTF    FILE(QSYSPRT) PAGESIZE(72 198) CPI(15) OVRFLW(69) MAXRCDS(*NOMAX)
** Function Keys:
F3/F12=Exit; F4=WrkJob *Splf; F5=Refresh/Reset; F11=Process/Submit.
** Report Headings
TEMBO Technology Labs
Web Service: Test


** Messages
cannot be blank(s).
