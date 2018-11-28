      *****************************************************************************************
      *                                                                                       *
      * Copyright (c) 2008-2018 TEMBO Technology Lab (Pty) Ltd.                               *
      * Created by AO Foundation - www.adsero-optima.com                                     *
      * Original TEMPLATE author: Tommy Atkins - Chief Development Officer                    *
      *                                                                                       *
      * All source rendered by AO Foundation, based on harvested information from S2E Models *
      * retrieved and recovered with the consent of Axiom Systems Africa Pty (Ltd)            *
      * from their Infologic application, subject to the Apache License, Version 2.0 terms.   *
      * (http://www.axiom.co.za/index.php/solutions/application-systems/infologic)            *
      *                                                                                       *
      * Licensed under the Apache License, Version 2.0 (the "License");                       *
      * you may not use this file except in compliance with the License.                      *
      * You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0    *
      *                                                                                       *
      * Unless required by applicable law or agreed to in writing, software                   *
      * distributed under the License is distributed on an "AS IS" BASIS,                     *
      * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.              *
      * See the License for the specific language governing permissions and                   *
      * limitations under the License.                                                        *
      *                                                                                       *
      * The above copyright notice and this permission notice shall be included in all copies *
      * or substantial portions of the Software.                                              *
      *                                                                                       *
      *                                http://www.i-nterprise.org/                            *
      *                                                                                       *
      *****************************************************************************************
      *===============================================================
     h main(CUSMSTF_B0) dftactgrp(*no) actgrp(*caller) bnddir('AOOSRV')
     h usrprf(*owner) aut(*use) extbinint(*yes) option(*nodebugio) debug
      *===============================================================
     d CUSMSTF_B0      pr                  extpgm('CUSMSTF_B0')
     d  P                                  likeds(P1) options(*varsize)
     d  PL                           10i 0 const
      *===============================================================
      /copy SRCAOO,TRGPL#                        Trg. Pgm Parm List + PP Qualified(P1)
      *===============================================================
      /copy SRCAOO,ERR03#                        Move *DIAG and Resend *ESCAPE Messages
      /copy SRCAOO,ERR05#                        Move *DIAG and *ESCAPE Messages
      /copy SRCAOO,ERR10#                        Send *DIAG Message
      /copy SRCAOO,ERR11#                        Send *ESCAPE Message
      *===============================================================
     d NP              s               *
     d N             e ds                  based(NP) extname(CUSMSTF) qualified
      *===============================================================
     d OP              s               *
     d O             e ds                  based(OP) extname(CUSMSTF) qualified
      *===============================================================
     d MsgDta          ds
     d  MD20                         20
     d  MD108                       108
      *===============================================================
      /copy SRCAOO,$A6C6A2#                      CUSTNO : Customer Number
      /copy SRCAOO,$A6C6A3#                      RECSTS : Record Status
      /copy SRCAOO,$A6C6A4#                      CUSNME : Customer Name
      /copy SRCAOO,$A6C6A5#                      ADRLN1 : Address Line 1
      /copy SRCAOO,$A6C6A8#                      PSTCDE : Post Code
      /copy SRCAOO,$A6C6A9#                      STRDTE : Comencement Date
      /copy SRCAOO,$A6C6AC#                      USERID : Last User Id.
      *===============================================================
     d Error           s               n   inz(*off)
     d UserName        s             10    inz(*USER)
      *===============================================================
      * Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p CUSMSTF_B0      b
     d                 pi
     d  P                                  likeds(P1) options(*varsize)
     d  PL                           10i 0 const
      *===============================================================
      /free
       monitor;
          //================================================
          reset Error;
          PP = %addr(P);
          //================================================
          NP = PP + P1.NewOS;
          OP = PP + P1.OldOS;
          //================================================
          if P1.Event = '2';  // Delete
             return;
          endif;
          //================================================
          monitor;
             $CUSTNO(P1.Event:O.CUSTNO:N.CUSTNO);
          on-error;
             Error = *on;
          endmon;
          //================================================
          monitor;
             $RECSTS(P1.Event:O.RECSTS:N.RECSTS);
          on-error;
             Error = *on;
          endmon;
          //================================================
          monitor;
             $CUSNME(P1.Event:O.CUSNME:N.CUSNME);
          on-error;
             Error = *on;
          endmon;
          //================================================
          monitor;
             $ADRLN1(P1.Event:O.ADRLN1:N.ADRLN1);
          on-error;
             Error = *on;
          endmon;
          //================================================
          monitor;
             $PSTCDE(P1.Event:O.PSTCDE:N.PSTCDE);
          on-error;
             Error = *on;
          endmon;
          //================================================
          monitor;
             $STRDTE(P1.Event:O.STRDTE:N.STRDTE);
          on-error;
             Error = *on;
          endmon;
          //================================================
          monitor;
             $USERID(P1.Event:O.USERID:N.USERID);
          on-error;
             Error = *on;
          endmon;
          //================================================
          if Error;
             ERR05();
             ERR11('AOF0035':'ERRMSGF':'CUSMSTF_B0');
          endif;
          //================================================
       on-error;
          ERR05();
          ERR11('AOF0030':'ERRMSGF':'CUSMSTF_B0');
       endmon;
       //===================================================
       return;
       //===================================================
      /end-free
      *=====================================================
     p                 e
      *=====================================================================
