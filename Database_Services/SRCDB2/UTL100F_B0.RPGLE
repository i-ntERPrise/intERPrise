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
      *                           http://www.i-nterprise.org/                                 *
      *                                                                                       *
      *****************************************************************************************
      *===============================================================
     h main(UTL100F_B0) dftactgrp(*no) actgrp(*caller) bnddir('IRPSRV')
     h usrprf(*owner) aut(*use) extbinint(*yes) option(*nodebugio) debug
      *===============================================================
     d UTL100F_B0      pr                  extpgm('UTL100F_B0')
     d  P                                  likeds(P1) options(*varsize)
     d  PL                           10i 0 const
      *===============================================================
      /copy SRCCPY,TRGPL                         Trg. Pgm Parm List + PP Qualified(P1)
      *===============================================================
      /copy SRCCPY,ERR03#                        Move *DIAG and Resend *ESCAPE Messages
      /copy SRCCPY,ERR05#                        Move *DIAG and *ESCAPE Messages
      /copy SRCCPY,ERR10#                        Send *DIAG Message
      /copy SRCCPY,ERR11#                        Send *ESCAPE Message
      *===============================================================
     d NP              s               *                                        New Record Pointer
     d N             e ds                  based(NP) extname(UTL100F) qualified
      *===============================================================
     d OP              s               *                                        Old Record Pointer
     d O             e ds                  based(OP) extname(UTL100F) qualified
      *===============================================================
     d MsgDta          ds
     d  MD20                         20
     d  MD108                       108
      *===============================================================
      */copy Business Rule for "Menu ID" Validation [MNUID]
      /copy SRCCPY,$A06987                       $MNUID(Event:Orig:New);
      */copy Business Rule for "Menu Option" Validation [OPTION]
      /copy SRCCPY,$A0698A                       $OPTION(Event:Orig:New);
      *===============================================================
     d Error           s               n   inz(*off)
     d UserName        s             10    inz(*USER)
      *===============================================================
      * Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p UTL100F_B0      b
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
             $MNUID(P1.Event:O.MNUID:N.MNUID);        // Validate MENU ID
          on-error;
             Error = *on;
          endmon;
          //================================================
          monitor;
             $OPTION(P1.Event:O.OPTION:N.OPTION);     // Validate OPTION
          on-error;
             Error = *on;
          endmon;
          //================================================
          if Error;
             ERR05();
             ERR11('IRP9010':'ERRMSGF':'UTL100F_B0');
          endif;
          //================================================
       on-error;
          ERR05();
          ERR11('IRP9900':'ERRMSGF':'UTL100F_B0');
       endmon;
       //===================================================
       return;
       //===================================================
      /end-free
      *=====================================================
     p                 e
      *=====================================================================
