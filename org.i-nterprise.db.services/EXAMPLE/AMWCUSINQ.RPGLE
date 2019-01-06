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
     h main(AMWCUSINQ) Copyright('© TEMBO Technologies (Pty) Ltd.')
     h dftactgrp(*no) actgrp(*caller) bnddir('WEBSRVDIR') usrprf(*owner)
     h aut(*use) extbinint(*yes) option(*srcstmt:*nodebugio) debug
      *===============================================================
     d AMWCUSINQ       pr                  extpgm('AMWCUSINQ')
     d  Action                        7    const
     d  Applic                         *   const
     d  QueCtl                       20    const
     d  InpLen                       10i 0 const
     d  InpPtr                         *   const
     d  OutLen                       10i 0
     d  OutPtr                         *   const
      *===============================================================
     d P               ds                  qualified
     d  Action                        7
     d  Applic                         *
     d  QueCtl                       20
     d  InpLen                       10i 0
     d  InpPtr                         *
     d  OutLen                       10i 0
     d  OutPtr                         *
      *===============================================================
     d MsgId           s              7
     d MsgText         s            132
      *===============================================================
     d WEH03           pr
     d WEH07           pr              n
     d  MsgId                         7
     d  MsgText                     132
     d WEH11           pr
     d  MI                            7    const
     d  MF                           10    const options(*omit:*nopass)
     d  MD                          128    const options(*nopass)
      *===============================================================
     d GETSYS          pr             8
      *===============================================================
     d Process         pr
     d Request         pr
     d Response        pr
      *===============================================================
     d ALPHAU          pr                  extproc('WEBSRV@02A')
     d  UIName                       50    const
     d  DBName                       10    const
     d ALPHA           pr                  extproc('WEBSRV@02B')
     d  UIName                       50    const
     d  DBName                       10    const
     d NUMERIC         pr                  extproc('WEBSRV@02C')
     d  UIName                       50    const
     d  DBName                       10    const
     d DATEISO         pr                  extproc('WEBSRV@02D')
     d  UIName                       50    const
     d  DBName                       10    const
      *===============================================================
     d Encode          pr           256    extproc('WEBSRV@02E') varying
     d  Value                       256    options(*varsize)
     d  Length                        5i 0 const
      *===============================================================
     d Audit           pr                  extproc('AUDIT')                     WEBSRV@01
     d  AudPtr                         *   const
      *===============================================================
      /copy SRCDB_,CUSMSTF#@
      *===============================================================
     d InpData         s          65535    based(P.InpPtr)
      *===============================================================
     d ReqDataP        s               *   import
     d ReqData         s          65535    based(ReqDataP)
     d ReqData1        s              1    based(ReqDataP)
     d ReqData3        s              3    based(ReqDataP)
      *===============================================================
     d NextKV          pr                  extproc('WEBSRV@02F')
      *===============================================================
     d KVP             s               *   import
     d KV              ds                  based(KVP) qualified
     d  Key                         256    varying
     d  Value                       256    varying
      *===============================================================
     d OutDataP        s               *
     d OutData         s          65535    based(OutDataP)
      *===============================================================
     d SQL$P           s               *   import
     d SQL$            s          65535    varying
      *===============================================================
     d FileOpen        s               n   inz('0')
     d NoRecs          s              5i 0 inz(0)
     d RecsDft         s              5i 0 inz(10)
      *===============================================================
     d PrintDSP        s               *   inz(%addr(PrintDS))
     d PrintDS         ds                  qualified
     d  Applic                         *
     d  InpPtr                         *
     d  OutPtr                         *
     d  QueCtl                       20
     d  InpLen                       10i 0
     d  OutLen                       10i 0
     d  ProgName                     10    inz('AMWCUSINQ')
     d  ProgDescr                    50    inz('Customer Inquiry (CUSMSTF)')
      *===============================================================
      * Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p AMWCUSINQ       b
     d AMWCUSINQ       pi
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
          select;
             when Action = 'PROCESS';
                  clear P;
                  //
                  P.Applic = Applic;
                  P.QueCtl = QueCtl;
                  P.InpLen = InpLen;
                  P.InpPtr = InpPtr;
                  P.OutLen = OutLen;
                  P.OutPtr = OutPtr;
                  //
                  OutDataP = OutPtr;
                  //
                  SQL$P    = %addr(SQL$);
                  clear SQL$;
                  //
                  Process();
                  //
                  OutLen = P.OutLen;
                  //
                  eval-corr PrintDS = P;
                  Audit(PrintDSP);
             when Action = 'ENDPGM';
                  CUSMSTF#('CLOSE');
                  Audit(*NULL);
          endsl;
          //===============================================
       on-error;
          WEH07(MsgId:MsgText); // Fetch *LAST Error
          OutDataP  = P.OutPtr;
          clear OutData;
          OutData  = '{"Error":"Y","MsgDta":"'+MsgId+': '+%Trim(MsgText)+'"}';
          OutLen   = %Len(%trim(OutData));
          P.OutLen = OutLen;
          eval-corr PrintDS = P;
          Audit(PrintDSP);
       endmon;
       //?==================================================
      /end-free
     p                 e
      *===============================================================
      * Process Request <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p Process         b
      *====================================================
     d Pos             s             10i 0
      *====================================================
      /free
       //==================================================
       monitor;
          //===============================================
          Pos = %scan('{':%subst(InpData:1:14));
          //===============================================
          if Pos = 0;  //? Not a JSON Object !
             WEH11('WEB0010':'WEBMSGF');
          else;
             ReqDataP = P.InpPtr + Pos;
          endif;
          //===============================================
          NextKV(); // Next Key/Value pair
          //===============================================
          select;
              when KV.Key = 'Select'; // Filter by following Key/Value Pairs.
                   NoRecs = %dec(KV.Value:5:0);
                   Request();         // Value = Number of Records to Return.
                   Response();        //? Generate Http Response ...
              when KV.Key = 'Next';   // Return Next n Records, Filter Unchanged.
                   NoRecs = %dec(KV.Value:5:0);
                   Response();        //? Generate Http Response ...
              other;
                   WEH11('WEB0040':'WEBMSGF'); // Illegal Name
          endsl;
          //===============================================
       on-error;
          WEH03();
       endmon;
       //==================================================
      /end-free
     p                 e
      *?==============================================================
      *  Process Http Request <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *?==============================================================
     p Request         b
      *?====================================================
      /free
       monitor;
          //===============================================
          SQL$P    = %addr(SQL$);
          clear SQL$;
          //===============================================
          if FileOpen;
             CUSMSTF#('CLOSE');
             FileOpen = *off;
          endif;
          //===============================================
          NUMERIC('CusNbr':'CUSTNO');
          ALPHAU('CusSts':'RECSTS');
          ALPHAU('CusNam':'CUSNME');
          DATEISO('CusStr':'STRDTE');
          ALPHAU('CusPhn':'PHONEN');
          NUMERIC('CusRep':'REPCDE');
          ALPHAU('CusUsr':'USERID');
          //===============================================
          CUSMSTF#('SLT');
          FileOpen = CUSMSTF#('OPEN');
          //===============================================
       on-error;
          WEH03();
       endmon;
      /end-free
     p                 e
     ?*===============================================================
      *  Generate Response <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p Response        b
      *?====================================================
     d Count           s              5i 0
      *?====================================================
      /free
       monitor;
          //===============================================
          OutDataP = P.OutPtr;
          OutData  = *blank;
          //===============================================
          OutData = '{"Error":"N","MsgDta":"","SysNam":"'+%Trim(GETSYS())+
                    '",' + '"Rows":[';
          OutDataP += %len(%trim(OutData));
          //===============================================
          if NoRecs = 0;
             NoRecs = RecsDft;
          endif;
          //===============================================
          for Count = 1 to NoRecs;
              if CUSMSTF#('NEXT'); // Record Found
                 OutData = '["'+%char(CUSMSTFR.CUSTNO)+'","'+
                                %trim(CUSMSTFR.RECSTS)+'","'+
                               Encode(CUSMSTFR.CUSNME:30)+'","'+
                                %char(CUSMSTFR.STRDTE:*ISO)+'","'+
                                %trim(CUSMSTFR.PHONEN)+'","'+
                                %char(CUSMSTFR.REPCDE)+'","'+
                                %trim(CUSMSTFR.USERID)+'"]';
                 OutDataP += %len(%trim(OutData));
                 OutData   = *blank;
              elseif Count = 1;
                     WEH11('WEB0020':'WEBMSGF'); // No Record Found - EOF
              else;
                 leave;
              endif;
          endfor;
          //===============================================
          OutData   = ']}';
          P.OutLen  = (OutDataP+2) - P.OutPtr;
          OutDataP  = P.OutPtr;
          //===============================================
       on-error;
          WEH03();
       endmon;
      /end-free
     p                 e
      *===============================================================
