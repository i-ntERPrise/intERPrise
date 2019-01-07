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
      *$ Instructions ====================================================================
      * 1. Logon with a full *SECOFR profile
      * 2. Create schema IRPEXP using the CRTLIB command and not the SQL version.
      * 3. Upload ALL the related source files into IRPEXP schema.
      * 4. Create the primary builder, as follows;
      *       "CRTBNDRPG PGM(IRPEXP/IRPEXPBLD) SRCFILE(IRPEXP/SRCOBJ) SRCMBR(IRPEXPBLD)
      *        TEXT('IRP Example for UI Builder')"
      * 5. Execute "CALL IRPEXP/IRPEXPBLD"
      *$ Program =========================================================================
     h main(IRPEXPBLD)
     h dftactgrp(*no) actgrp(*new) usrprf(*owner) aut(*use)
     h extbinint(*yes) option(*nodebugio) debug
      *===============================================================
     d IRPEXPBLD       pr                  extpgm('IRPEXPBLD')
      *===============================================================
     d Cmd$            s           4096    varying
     d Cmd             pr
     d                             4096    varying const options(*varsize)
      *===============================================================
      * Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p IRPEXPBLD       b
      *=====================================================
      /free
       monitor;
          //================================================
          Cmd('STRCMTCTL *CHG');
          //================================================
          // Change Library List
          Cmd('CHGLIBL LIBL(QTEMP IRPEXP QGPL)');
          //================================================
          // Create Binding Directory for EXP
          Cmd('CRTBNDDIR BNDDIR(IRPEXP/EXPSRV) +
               TEXT(''EXP Binding Directory'')');
          //================================================
          // Create Journal Receiver for IRPEXP
          Cmd('CRTJRNRCV JRNRCV(IRPEXP/EXPJRN0001) +
               TEXT(''EXP Journal Receiver'')');
          //================================================
          // Create Journal for IRPEXP
          Cmd('CRTJRN JRN(IRPEXP/EXPJRN) JRNRCV(IRPEXP/EXPJRN0001) +
               DLTRCV(*YES) TEXT(''EXP Journal'')');
          //================================================
          // Start Journalling to IRPEXP
          Cmd('STRJRNLIB LIB(IRPEXP) JRN(IRPEXP/EXPJRN) +
               INHRULES((*ALL *ALLOPR *INCLUDE *BOTH *OPNCLO))');
          //================================================
          // Create Error Handler Service Program
          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@01) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''Error Handling Module 1'')');
          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@02) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''Error Handling Module 2'')');
          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@03) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''Error Handling Module 3'')');
          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@04) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''Error Handling Module 4'')');
          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@05) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''Error Handling Module 5'')');
          Cmd('CRTBNDCL PGM(IRPEXP/ERRSRV@@) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''Error Handling Services'')');
          Cmd('CALL ERRSRV@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
               OBJ((*LIBL/ERRSRV@@ *SRVPGM *DEFER))');
          //================================================
          // Create JSON Driver Service Program
          Cmd('CRTRPGMOD MODULE(IRPEXP/DRVSRV@01) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''JSON Driver Services Module 1'')');
          Cmd('CRTRPGMOD MODULE(IRPEXP/DRVSRV@02) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''JSON Driver Services Module 2'')');
          Cmd('CRTRPGMOD MODULE(IRPEXP/DRVSRV@03) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''JSON Driver Services Module 3'')');
          Cmd('CRTRPGMOD MODULE(IRPEXP/DRVSRV@04) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''JSON Driver Services Module 4'')');
          Cmd('CRTBNDCL PGM(IRPEXP/DRVSRV@@) SRCFILE(IRPEXP/SRCSRV) +
               TEXT(''JSON Driver Services'')');
          Cmd('CALL DRVSRV@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
               OBJ((*LIBL/DRVSRV@@ *SRVPGM *DEFER))');
          //================================================
          // Create the Validation Rules Repository
          Cmd('CRTRPGMOD MODULE(IRPEXP/EXPVRAMW@0) SRCFILE(IRPEXP/SRCVRR) +
               TEXT(''Validation Rules Repository Class AMW-0'')');
          Cmd('CRTBNDCL PGM(IRPEXP/EXPVRAMW@@) SRCFILE(IRPEXP/SRCVRR) +
               TEXT(''Validation Rules Repository Class AMW'')');
          Cmd('CALL EXPVRAMW@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
               OBJ((*LIBL/EXPVRAMW@@ *SRVPGM *DEFER))');
          //================================================
          // Build Database Tables
          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(REPMSTF) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(CUSMSTF) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(CUSBALF) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(PRDMSTF) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(INVHDRF) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(INVDETF) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          //================================================
          // Compile Database Triggers
          Cmd('CRTBNDRPG PGM(IRPEXP/CUSMSTF_B0) SRCFILE(IRPEXP/SRCDB2) +
               DBGVIEW(*SOURCE) REPLACE(*YES)');
          //================================================
          // Add DB Triggers to Files
          Cmd('ADDPFTRG FILE(IRPEXP/CUSMSTF) TRGTIME(*BEFORE) +
               TRGEVENT(*INSERT) PGM(IRPEXP/CUSMSTF_B0) TRG(CUSMSTF_BI00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPEXP/CUSMSTF) TRGTIME(*BEFORE) +
               TRGEVENT(*UPDATE) PGM(IRPEXP/CUSMSTF_B0) TRG(CUSMSTF_BU00) +
               ALWREPCHG(*YES)');
          //================================================
          // Create File I/O Servers
          Cmd('CRTRPGMOD MODULE(IRPEXP/CUSMSTF@) SRCFILE(IRPEXP/SRCDB2) +
               TEXT(''I/O Server Module - CUSMSTF'')');
          Cmd('CRTBNDCL PGM(IRPEXP/CUSIOS@@) SRCFILE(IRPEXP/SRCDB2) +
               TEXT(''I/O Server Compiler [CUS]'')');
          Cmd('CALL CUSIOS@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
               OBJ((*LIBL/CUSIOS@@ *SRVPGM *DEFER))');
          //================================================
          // Create CUSMST Services Program
          Cmd('CRTSQLRPGI OBJ(IRPEXP/CUSMST@01) SRCFILE(IRPEXP/SRCOBJ) +
               SRCMBR(CUSMST@01) OBJTYPE(*MODULE) OPTION(*EVENTF) DATFMT(*ISO) +
               DATSEP(*JOB) TIMFMT(*ISO) REPLACE(*YES) DBGVIEW(*SOURCE) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('CRTRPGMOD MODULE(IRPEXP/CUSMST@02) SRCFILE(IRPEXP/SRCOBJ)');
          Cmd('CRTBNDCL PGM(IRPEXP/CUSMST@@) SRCFILE(IRPEXP/SRCOBJ) +
               TEXT(''CUSMST Services'')');
          Cmd('CALL CUSMST@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
               OBJ((*LIBL/CUSMST@@ *SRVPGM *DEFER))');
          Cmd('CRTBNDRPG PGM(IRPEXP/CUSMSTDRV) SRCFILE(IRPEXP/SRCOBJ) +
               SRCMBR(CUSMSTDRV) OPTION(*EVENTF) DBGVIEW(*SOURCE) +
               REPLACE(*YES)');
          //================================================
          // Create Message File [ERRMSGF]
          Cmd('CRTMSGF MSGF(IRPEXP/ERRMSGF) TEXT(''EXP Error Message File'')');
          Cmd('ADDMSGD MSGID(IOS9999) MSGF(IRPEXP/ERRMSGF) +
               FMT((*CHAR 10) (*CHAR 118)) +
               MSG(''Invalid action "&2" for "&1"'')');
          Cmd('ADDMSGD MSGID(IOS0010) MSGF(IRPEXP/ERRMSGF) +
               FMT((*CHAR 10) (*CHAR 5)) +
               MSG(''Record not found for update - &1'')');
          Cmd('ADDMSGD MSGID(EXP0010) MSGF(IRPEXP/ERRMSGF) +
               FMT((*CHAR 128)) +
               MSG(''The "&1" field may not be blank.'')');
          Cmd('ADDMSGD MSGID(EXP0020) MSGF(IRPEXP/ERRMSGF) +
               FMT((*CHAR 12)) +
               MSG(''Invalid "&1"'')');
          Cmd('ADDMSGD MSGID(EXP0030) MSGF(IRPEXP/ERRMSGF) +
               FMT((*CHAR 128)) +
               MSG(''The "&1" field may not be zero.'')');
          Cmd('ADDMSGD MSGID(EXP9010) MSGF(IRPEXP/ERRMSGF) +
               FMT((*CHAR 10)) +
               MSG(''Errors found in Trigger Program &1'')');
          Cmd('ADDMSGD MSGID(EXP9900) MSGF(IRPEXP/ERRMSGF) +
               FMT((*CHAR 10)) +
               MSG(''Unexpected error found in Trigger Program &1'')');
          //================================================
          Cmd('GRTOBJAUT OBJ(IRPEXP/ERRMSGF) OBJTYPE(*MSGF) +
               USER(*PUBLIC) AUT(*ALL)');
          Cmd('GRTOBJAUT OBJ(IRPEXP/EXPSRV) OBJTYPE(*BNDDIR) +
               USER(*PUBLIC) AUT(*ALL)');
          //================================================
          commit;
          //================================================
       on-error;
          rolbk;
       endmon;
      /end-free
      *=====================================================
     p                 e
      *===============================================================
      * Command Processor <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p Cmd             b
     d                 pi
     d  Cmd$                       4096    varying const options(*varsize)
      *=====================================================
     d CmdExc          pr                  extpgm('QCMDEXC')
     d                             4096    const options(*varsize)
     d                               15p 5 const
      *=====================================================
      /free
       monitor;
          //================================================
          CmdExc(Cmd$:%len(Cmd$));
          //================================================
       on-error;
          rolbk;
       endmon;
      /end-free
      *=====================================================
     p                 e
      *===============================================================
