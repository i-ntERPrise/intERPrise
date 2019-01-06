      *$ Apache License ==================================================================
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
      * 1. Create *USRPRF called IRPOWN with all the authorities of *SECOFR. Allow for a
      *    password to logon. This will later be changed to *NONE.
      * 1. LogOn with IRPOWN.
      * 2. Create schema IRPSRC using the CRTLIB command and not the SQL version.
      * 3. Upload ALL of GitHub source files into IRPSRC schema.
      * 4. Create the primary builder, as follows;
      *       "CRTBNDRPG PGM(IRPSRC/IRPBLD011) SRCFILE(IRPSRC/SRCOBJ) SRCMBR(IRPBLD011)
      *        TEXT('IRP Builder 01 V1')"
      * 5. Execute "CALL IRPSRC/IRPBLD011"
      *$ Program =========================================================================
     h main(IRPBLD011)
     h dftactgrp(*no) actgrp(*new) usrprf(*owner) aut(*use)
     h extbinint(*yes) option(*nodebugio) debug
      *===============================================================
     d IRPBLD011       pr                  extpgm('IRPBLD011')
      *===============================================================
     d Cmd$            s           4096    varying
     d Cmd             pr
     d                             4096    varying const options(*varsize)
      *===============================================================
      * Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      *===============================================================
     p IRPBLD011       b
      *=====================================================
      /free
       monitor;
          //================================================
          Cmd('STRCMTCTL *CHG');
          //================================================
          // Create libraries
          Cmd('CRTLIB LIB(IRPGPL)' +
              ' TEXT(''intERPrise General Purpose Library'')');
          Cmd('CRTLIB LIB(IRPDB2)' +
              ' TEXT(''intERPrise Database Library'')');
          Cmd('CRTLIB LIB(IRPOBJ)' +
              ' TEXT(''intERPrise Objects Library'')');
          //================================================
          // Change Library List
          Cmd('CHGLIBL LIBL(QTEMP IRPGPL IRPOBJ IRPDB2 IRPSRC QGPL)');
          //================================================
          // Create *JOBD for IRPOWN
          Cmd('CRTJOBD JOBD(IRPGPL/IRPOWN) JOBQ(IRPGPL/IRPJOBQ) +
               TEXT(''IRPOWN Job Description'') +
               INLLIBL(QTEMP IRPGPL IRPOBJ IRPDB2 IRPSRC QGPL)');
          // Change Job Description for IRPOWN
          Cmd('CHGUSRPRF USRPRF(IRPOWN) JOBD(IRPGPL/IRPOWN)');
          //================================================
          // Create Binding Directory for IRP
          Cmd('CRTBNDDIR BNDDIR(IRPGPL/IRPSRV) +
               TEXT(''IRP Binding Directory'')');
          //================================================
          // Create Journal Receiver for IRPDB2
          Cmd('CRTJRNRCV JRNRCV(IRPDB2/IRPJRN0001) +
               TEXT(''IRP DB2 Journal Receiver'')');
          //================================================
          // Create Journal Receiver for IRPGPL
          Cmd('CRTJRNRCV JRNRCV(IRPGPL/IRPJRN0001) +
               TEXT(''IRP GPL Journal Receiver'')');
          //================================================
          // Create Journal for IRPDB2
          Cmd('CRTJRN JRN(IRPDB2/IRPJRN) JRNRCV(IRPDB2/IRPJRN0001) +
               DLTRCV(*YES) TEXT(''IRP DB2 Journal'')');
          //================================================
          // Create Journal for IRPGPL
          Cmd('CRTJRN JRN(IRPGPL/IRPJRN) JRNRCV(IRPGPL/IRPJRN0001) +
               DLTRCV(*YES) TEXT(''IRP GPL Journal'')');
          //================================================
          // Start Journalling to IRPDB2
          Cmd('STRJRNLIB LIB(IRPDB2) JRN(IRPDB2/IRPJRN) +
               INHRULES((*ALL *ALLOPR *INCLUDE *BOTH *OPNCLO))');
          //================================================
          // Start Journalling to IRPGPL
          Cmd('STRJRNLIB LIB(IRPGPL) JRN(IRPGPL/IRPJRN) +
               INHRULES((*ALL *ALLOPR *INCLUDE *BOTH *OPNCLO))');
          //================================================
          // Create Error Handler Service Program
          Cmd('CRTRPGMOD MODULE(IRPSRC/ERRSRV@01) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Error Handling Module 1'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/ERRSRV@02) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Error Handling Module 2'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/ERRSRV@03) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Error Handling Module 3'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/ERRSRV@04) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Error Handling Module 4'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/ERRSRV@05) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Error Handling Module 5'')');
          Cmd('CRTBNDCL PGM(IRPSRC/ERRSRV@@) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Error Handling Services'')');
          Cmd('CALL ERRSRV@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPGPL/IRPSRV) +
               OBJ((*LIBL/ERRSRV@@ *SRVPGM *DEFER))');
          //================================================
          // Create Utility Services Service Program
          Cmd('CRTRPGMOD MODULE(IRPSRC/UTLSRV@01) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Utility Services Module 1'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/UTLSRV@02) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Utility Services Module 2'')');
          Cmd('CRTBNDCL PGM(IRPSRC/UTLSRV@@) SRCFILE(IRPSRC/SRCSRV) +
               TEXT(''Utility Services'')');
          Cmd('CALL UTLSRV@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPGPL/IRPSRV) +
               OBJ((*LIBL/UTLSRV@@ *SRVPGM *DEFER))');
          //================================================
          // Create the Validation Rules Repository
          Cmd('CRTRPGMOD MODULE(IRPSRC/IRPVRXXX@0) SRCFILE(IRPSRC/SRCVRR) +
               TEXT(''Validation Rules Repository Class XXX-0'')');
          Cmd('CRTBNDCL PGM(IRPSRC/IRPVRXXX@@) SRCFILE(IRPSRC/SRCVRR) +
               TEXT(''Validation Rules Repository Class XXX'')');
          Cmd('CALL IRPVRXXX@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPGPL/IRPSRV) +
               OBJ((*LIBL/IRPVRXXX@@ *SRVPGM *DEFER))');
          //================================================
          // Build Database Tables
          Cmd('RUNSQLSTM SRCFILE(IRPSRC/SRCDB2) SRCMBR(UTL100F) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPDB2) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPSRC/SRCDB2) SRCMBR(UTL135F) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPDB2) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPSRC/SRCDB2) SRCMBR(UTL110F) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPDB2) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPSRC/SRCDB2) SRCMBR(UTL130F) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPDB2) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPSRC/SRCDB2) SRCMBR(UTL140F) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPDB2) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          Cmd('RUNSQLSTM SRCFILE(IRPSRC/SRCDB2) SRCMBR(UTL150F) COMMIT(*NONE) +
               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPDB2) +
               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
          //================================================
          // Compile Database Triggers
          Cmd('CRTBNDRPG PGM(IRPDB2/UTL100F_B0) SRCFILE(IRPSRC/SRCDB2) +
               DBGVIEW(*SOURCE) REPLACE(*YES)');
          Cmd('CRTBNDRPG PGM(IRPDB2/UTL110F_B0) SRCFILE(IRPSRC/SRCDB2) +
               DBGVIEW(*SOURCE) REPLACE(*YES)');
          Cmd('CRTBNDRPG PGM(IRPDB2/UTL130F_B0) SRCFILE(IRPSRC/SRCDB2) +
               DBGVIEW(*SOURCE) REPLACE(*YES)');
          Cmd('CRTBNDRPG PGM(IRPDB2/UTL135F_B0) SRCFILE(IRPSRC/SRCDB2) +
               DBGVIEW(*SOURCE) REPLACE(*YES)');
          Cmd('CRTBNDRPG PGM(IRPDB2/UTL140F_B0) SRCFILE(IRPSRC/SRCDB2) +
               DBGVIEW(*SOURCE) REPLACE(*YES)');
          Cmd('CRTBNDRPG PGM(IRPDB2/UTL150F_B0) SRCFILE(IRPSRC/SRCDB2) +
               DBGVIEW(*SOURCE) REPLACE(*YES)');
          //================================================
          // Add DB Triggers to Files
          Cmd('ADDPFTRG FILE(IRPDB2/UTL100F) TRGTIME(*BEFORE) +
               TRGEVENT(*INSERT) PGM(IRPDB2/UTL100F_B0) TRG(UTL100F_BI00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL100F) TRGTIME(*BEFORE) +
               TRGEVENT(*UPDATE) PGM(IRPDB2/UTL100F_B0) TRG(UTL100F_BU00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL110F) TRGTIME(*BEFORE) +
               TRGEVENT(*INSERT) PGM(IRPDB2/UTL110F_B0) TRG(UTL110F_BI00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL110F) TRGTIME(*BEFORE) +
               TRGEVENT(*UPDATE) PGM(IRPDB2/UTL110F_B0) TRG(UTL110F_BU00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL130F) TRGTIME(*BEFORE) +
               TRGEVENT(*INSERT) PGM(IRPDB2/UTL130F_B0) TRG(UTL130F_BI00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL130F) TRGTIME(*BEFORE) +
               TRGEVENT(*UPDATE) PGM(IRPDB2/UTL130F_B0) TRG(UTL130F_BU00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL135F) TRGTIME(*BEFORE) +
               TRGEVENT(*INSERT) PGM(IRPDB2/UTL135F_B0) TRG(UTL135F_BI00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL135F) TRGTIME(*BEFORE) +
               TRGEVENT(*UPDATE) PGM(IRPDB2/UTL135F_B0) TRG(UTL135F_BU00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL140F) TRGTIME(*BEFORE) +
               TRGEVENT(*INSERT) PGM(IRPDB2/UTL140F_B0) TRG(UTL140F_BI00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL140F) TRGTIME(*BEFORE) +
               TRGEVENT(*UPDATE) PGM(IRPDB2/UTL140F_B0) TRG(UTL140F_BU00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL150F) TRGTIME(*BEFORE) +
               TRGEVENT(*INSERT) PGM(IRPDB2/UTL150F_B0) TRG(UTL150F_BI00) +
               ALWREPCHG(*YES)');
          Cmd('ADDPFTRG FILE(IRPDB2/UTL150F) TRGTIME(*BEFORE) +
               TRGEVENT(*UPDATE) PGM(IRPDB2/UTL150F_B0) TRG(UTL150F_BU00) +
               ALWREPCHG(*YES)');
          //================================================
          // Create File I/O Servers
          Cmd('CRTRPGMOD MODULE(IRPSRC/UTL100F@) SRCFILE(IRPSRC/SRCDB2) +
               TEXT(''I/O Server Module - UTL100F'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/UTL110F@) SRCFILE(IRPSRC/SRCDB2) +
               TEXT(''I/O Server Module - UTL110F'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/UTL130F@) SRCFILE(IRPSRC/SRCDB2) +
               TEXT(''I/O Server Module - UTL1300F'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/UTL135F@) SRCFILE(IRPSRC/SRCDB2) +
               TEXT(''I/O Server Module - UTL135F'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/UTL140F@) SRCFILE(IRPSRC/SRCDB2) +
               TEXT(''I/O Server Module - UTL140F'')');
          Cmd('CRTRPGMOD MODULE(IRPSRC/UTL150F@) SRCFILE(IRPSRC/SRCDB2) +
               TEXT(''I/O Server Module - UTL150F'')');
          Cmd('CRTBNDCL PGM(IRPSRC/UTLIOS@@) SRCFILE(IRPSRC/SRCDB2) +
               TEXT(''I/O Server Compiler [UTL]'')');
          Cmd('CALL UTLIOS@@');
          Cmd('ADDBNDDIRE BNDDIR(IRPGPL/IRPSRV) +
               OBJ((*LIBL/UTLIOS@@ *SRVPGM *DEFER))');
          //================================================
          // Create Message File [ERRMSGF]
          Cmd('CRTMSGF MSGF(IRPGPL/ERRMSGF) TEXT(''IRP Error Message File'')');
          Cmd('ADDMSGD MSGID(IOS9999) MSGF(IRPGPL/ERRMSGF) +
               FMT((*CHAR 10) (*CHAR 118)) +
               MSG(''Invalid action "&2" for "&1"'')');
          Cmd('ADDMSGD MSGID(IOS0010) MSGF(IRPGPL/ERRMSGF) +
               FMT((*CHAR 10) (*CHAR 5)) +
               MSG(''Record not found for update - &1'')');
          Cmd('ADDMSGD MSGID(IRP0010) MSGF(IRPGPL/ERRMSGF) +
               FMT((*CHAR 128)) +
               MSG(''The "&1" field may not be blank.'')');
          Cmd('ADDMSGD MSGID(IRP0020) MSGF(IRPGPL/ERRMSGF) +
               FMT((*CHAR 12)) +
               MSG(''Invalid "&1"'')');
          Cmd('ADDMSGD MSGID(IRP9010) MSGF(IRPGPL/ERRMSGF) +
               FMT((*CHAR 10)) +
               MSG(''Errors found in Trigger Program &1'')');
          Cmd('ADDMSGD MSGID(IRP9900) MSGF(IRPGPL/ERRMSGF) +
               FMT((*CHAR 10)) +
               MSG(''Unexpected error found in Trigger Program &1'')');
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
