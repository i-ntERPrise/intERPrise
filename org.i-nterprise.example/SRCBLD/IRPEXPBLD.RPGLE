000100181222      *& Apache License
000200181222      *===================================================================================
000300181208      *  Copyright (c) 2008-2018 TEMBO Technology Lab (Pty) Ltd.
000400181208      *  Created by AO Foundation - www.adsero-optima.com
000500181208      *  Original TEMPLATE author: Tommy Atkins - Chief Development Officer
000600181208      *
000700181208      *  Licensed under the Apache License, Version 2.0 (the "License");
000800181208      *  you may not use this file except in compliance with the License.
000900181208      *  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2
001000181208      *
001100181208      *  Unless required by applicable law or agreed to in writing, software
001200181208      *  distributed under the License is distributed on an "AS IS" BASIS,
001300181208      *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
001400181208      *  See the License for the specific language governing permissions and
001500181208      *  limitations under the License.
001600181208      *
001700181208      *  The above copyright notice and this permission notice shall be included in all
001800181208      *  copies or substantial portions of the Software.
001900181208      *
002000181208      *                      http://www.adsero-optima.com/
002100181208      *$ Instructions ====================================================================
002200181222      * 1. Logon with a full *SECOFR profile
002300181222      * 2. Create schema IRPEXP using the CRTLIB command and not the SQL version.
002400181222      * 3. Upload ALL the related source files into IRPEXP schema.
002500181208      * 4. Create the primary builder, as follows;
002600190128      *       "CRTBNDRPG PGM(IRPEXP/IRPEXPBLD) SRCFILE(IRPEXP/SRCBLD) SRCMBR(IRPEXPBLD)
002700181222      *        TEXT('IRP Example for UI Builder')"
002800181222      * 5. Execute "CALL IRPEXP/IRPEXPBLD"
002900181208      *$ Program =========================================================================
003000181222     h main(IRPEXPBLD)
003100130706     h dftactgrp(*no) actgrp(*new) usrprf(*owner) aut(*use)
003200181208     h extbinint(*yes) option(*nodebugio) debug
003300130706      *===============================================================
003400181222     d IRPEXPBLD       pr                  extpgm('IRPEXPBLD')
003500130706      *===============================================================
003600181208     d Cmd$            s           4096    varying
003700181208     d Cmd             pr
003800181208     d                             4096    varying const options(*varsize)
003900181208      *===============================================================
004000181205      * Mainline <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
004100181205      *===============================================================
004200181222     p IRPEXPBLD       b
004300181205      *=====================================================
004400130706      /free
004500130706       monitor;
004600130706          //================================================
004700141012          Cmd('STRCMTCTL *CHG');
004800181208          //================================================
004900181208          // Change Library List
005000181223          Cmd('CHGLIBL LIBL(QTEMP IRPEXP QGPL)');
005100181208          //================================================
005200181223          // Create Binding Directory for EXP
005300181227          Cmd('CRTBNDDIR BNDDIR(IRPEXP/EXPSRV) +
005400181223               TEXT(''EXP Binding Directory'')');
005500181209          //================================================
005600181223          // Create Journal Receiver for IRPEXP
005700181223          Cmd('CRTJRNRCV JRNRCV(IRPEXP/EXPJRN0001) +
005800181223               TEXT(''EXP Journal Receiver'')');
005900181209          //================================================
006000181223          // Create Journal for IRPEXP
006100181223          Cmd('CRTJRN JRN(IRPEXP/EXPJRN) JRNRCV(IRPEXP/EXPJRN0001) +
006200181223               DLTRCV(*YES) TEXT(''EXP Journal'')');
006300181209          //================================================
006400181223          // Start Journalling to IRPEXP
006500181223          Cmd('STRJRNLIB LIB(IRPEXP) JRN(IRPEXP/EXPJRN) +
006600181210               INHRULES((*ALL *ALLOPR *INCLUDE *BOTH *OPNCLO))');
006700181209          //================================================
006800181209          // Create Error Handler Service Program
006900181223          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@01) SRCFILE(IRPEXP/SRCSRV) +
007000181209               TEXT(''Error Handling Module 1'')');
007100181223          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@02) SRCFILE(IRPEXP/SRCSRV) +
007200181209               TEXT(''Error Handling Module 2'')');
007300181223          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@03) SRCFILE(IRPEXP/SRCSRV) +
007400181209               TEXT(''Error Handling Module 3'')');
007500181223          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@04) SRCFILE(IRPEXP/SRCSRV) +
007600181209               TEXT(''Error Handling Module 4'')');
007700181223          Cmd('CRTRPGMOD MODULE(IRPEXP/ERRSRV@05) SRCFILE(IRPEXP/SRCSRV) +
007800181209               TEXT(''Error Handling Module 5'')');
007900181223          Cmd('CRTBNDCL PGM(IRPEXP/ERRSRV@@) SRCFILE(IRPEXP/SRCSRV) +
008000181209               TEXT(''Error Handling Services'')');
008100181209          Cmd('CALL ERRSRV@@');
008200181228          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
008300181209               OBJ((*LIBL/ERRSRV@@ *SRVPGM *DEFER))');
008400181209          //================================================
008500181227          // Create JSON Driver Service Program
008600181227          Cmd('CRTRPGMOD MODULE(IRPEXP/DRVSRV@01) SRCFILE(IRPEXP/SRCSRV) +
008700181227               TEXT(''JSON Driver Services Module 1'')');
008800181227          Cmd('CRTRPGMOD MODULE(IRPEXP/DRVSRV@02) SRCFILE(IRPEXP/SRCSRV) +
008900181227               TEXT(''JSON Driver Services Module 2'')');
009000181227          Cmd('CRTRPGMOD MODULE(IRPEXP/DRVSRV@03) SRCFILE(IRPEXP/SRCSRV) +
009100181227               TEXT(''JSON Driver Services Module 3'')');
009200181227          Cmd('CRTRPGMOD MODULE(IRPEXP/DRVSRV@04) SRCFILE(IRPEXP/SRCSRV) +
009300181227               TEXT(''JSON Driver Services Module 4'')');
009400181227          Cmd('CRTBNDCL PGM(IRPEXP/DRVSRV@@) SRCFILE(IRPEXP/SRCSRV) +
009500181227               TEXT(''JSON Driver Services'')');
009600181227          Cmd('CALL DRVSRV@@');
009700181227          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
009800181227               OBJ((*LIBL/DRVSRV@@ *SRVPGM *DEFER))');
009900181227          //================================================
010000181227          // Create the Validation Rules Repository
010100181223          Cmd('CRTRPGMOD MODULE(IRPEXP/EXPVRAMW@0) SRCFILE(IRPEXP/SRCVRR) +
010200181223               TEXT(''Validation Rules Repository Class AMW-0'')');
010300181223          Cmd('CRTBNDCL PGM(IRPEXP/EXPVRAMW@@) SRCFILE(IRPEXP/SRCVRR) +
010400181223               TEXT(''Validation Rules Repository Class AMW'')');
010500181223          Cmd('CALL EXPVRAMW@@');
010600181227          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
010700181223               OBJ((*LIBL/EXPVRAMW@@ *SRVPGM *DEFER))');
010800181209          //================================================
010900181210          // Build Database Tables
011000181223          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(REPMSTF) COMMIT(*NONE) +
011100181223               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
011200181210               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
011300181223          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(CUSMSTF) COMMIT(*NONE) +
011400181223               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
011500181210               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
011600181223          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(CUSBALF) COMMIT(*NONE) +
011700181223               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
011800181210               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
011900181223          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(PRDMSTF) COMMIT(*NONE) +
012000181223               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
012100181210               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
012200181223          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(INVHDRF) COMMIT(*NONE) +
012300181223               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
012400181210               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
012500181223          Cmd('RUNSQLSTM SRCFILE(IRPEXP/SRCDB2) SRCMBR(INVDETF) COMMIT(*NONE) +
012600181223               DATFMT(*ISO) TIMFMT(*ISO) MARGINS(100) DFTRDBCOL(IRPEXP) +
012700181210               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
012800181210          //================================================
012900181210          // Compile Database Triggers
013000181223          Cmd('CRTBNDRPG PGM(IRPEXP/CUSMSTF_B0) SRCFILE(IRPEXP/SRCDB2) +
013100181210               DBGVIEW(*SOURCE) REPLACE(*YES)');
013200181210          //================================================
013300181210          // Add DB Triggers to Files
013400181223          Cmd('ADDPFTRG FILE(IRPEXP/CUSMSTF) TRGTIME(*BEFORE) +
013500181223               TRGEVENT(*INSERT) PGM(IRPEXP/CUSMSTF_B0) TRG(CUSMSTF_BI00) +
013600181210               ALWREPCHG(*YES)');
013700181223          Cmd('ADDPFTRG FILE(IRPEXP/CUSMSTF) TRGTIME(*BEFORE) +
013800181223               TRGEVENT(*UPDATE) PGM(IRPEXP/CUSMSTF_B0) TRG(CUSMSTF_BU00) +
013900181210               ALWREPCHG(*YES)');
014000181210          //================================================
014100181210          // Create File I/O Servers
014200181223          Cmd('CRTRPGMOD MODULE(IRPEXP/CUSMSTF@) SRCFILE(IRPEXP/SRCDB2) +
014300181223               TEXT(''I/O Server Module - CUSMSTF'')');
014400181223          Cmd('CRTBNDCL PGM(IRPEXP/CUSIOS@@) SRCFILE(IRPEXP/SRCDB2) +
014500181223               TEXT(''I/O Server Compiler [CUS]'')');
014600181223          Cmd('CALL CUSIOS@@');
014700181228          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
014800181223               OBJ((*LIBL/CUSIOS@@ *SRVPGM *DEFER))');
014900181228          //================================================
015000181228          // Create CUSMST Services Program
015100181228          Cmd('CRTSQLRPGI OBJ(IRPEXP/CUSMST@01) SRCFILE(IRPEXP/SRCOBJ) +
015200181228               SRCMBR(CUSMST@01) OBJTYPE(*MODULE) OPTION(*EVENTF) DATFMT(*ISO) +
015300181228               DATSEP(*JOB) TIMFMT(*ISO) REPLACE(*YES) DBGVIEW(*SOURCE) +
015400181228               USRPRF(*OWNER) DYNUSRPRF(*OWNER)');
015500181228          Cmd('CRTRPGMOD MODULE(IRPEXP/CUSMST@02) SRCFILE(IRPEXP/SRCOBJ)');
015600181228          Cmd('CRTBNDCL PGM(IRPEXP/CUSMST@@) SRCFILE(IRPEXP/SRCOBJ) +
015700181228               TEXT(''CUSMST Services'')');
015800181228          Cmd('CALL CUSMST@@');
015900181228          Cmd('ADDBNDDIRE BNDDIR(IRPEXP/EXPSRV) +
016000181228               OBJ((*LIBL/CUSMST@@ *SRVPGM *DEFER))');
016001190128          //================================================
016002190128          // Create JSON Driver for CUSMSTF
016100190128          Cmd('CRTBNDRPG PGM(IRPEXP/CUSMST_JD) SRCFILE(IRPEXP/SRCOBJ) +
016200190128               SRCMBR(CUSMST_JD) OPTION(*EVENTF) DBGVIEW(*SOURCE) +
016300181228               REPLACE(*YES)');
016400181210          //================================================
016500181211          // Create Message File [ERRMSGF]
016600181223          Cmd('CRTMSGF MSGF(IRPEXP/ERRMSGF) TEXT(''EXP Error Message File'')');
016601190128          Cmd('ADDMSGD MSGID(ERR0010) MSGF(IRPEXP/ERRMSGF) +
016603190128               MSG(''Input string is not a JSON object'')');
016604190128          Cmd('ADDMSGD MSGID(ERR0020) MSGF(IRPEXP/ERRMSGF) +
016605190128               MSG(''Key Name "Handle" missing from JSON string'')');
016606190128          Cmd('ADDMSGD MSGID(ERR0030) MSGF(IRPEXP/ERRMSGF) +
016607190128               MSG(''JSON Object: Ill-formed or misaligned'')');
016608190128          Cmd('ADDMSGD MSGID(ERR0040) MSGF(IRPEXP/ERRMSGF) +
016609190128               MSG(''Key Name "Action" missing from JSON string'')');
016610190128          Cmd('ADDMSGD MSGID(ERR0050) MSGF(IRPEXP/ERRMSGF) +
016611190128               MSG(''Invalid "Action" value supplied.'')');
016612190128          Cmd('ADDMSGD MSGID(ERR0060) MSGF(IRPEXP/ERRMSGF) +
016613190128               MSG(''No Records found matching filter requirements'')');
016614190128          Cmd('ADDMSGD MSGID(ERR0070) MSGF(IRPEXP/ERRMSGF) +
016615190128               FMT((*CHAR 128)) +
016616190128               MSG(''JSON Syntax invalid for "&1" record action.'')');
016617190128          Cmd('ADDMSGD MSGID(ERR0080) MSGF(IRPEXP/ERRMSGF) +
016618190128               MSG(''JSON Column array: Ill-formed or misaligned'')');
016700181223          Cmd('ADDMSGD MSGID(IOS9999) MSGF(IRPEXP/ERRMSGF) +
016800181211               FMT((*CHAR 10) (*CHAR 118)) +
016900181211               MSG(''Invalid action "&2" for "&1"'')');
017000181223          Cmd('ADDMSGD MSGID(IOS0010) MSGF(IRPEXP/ERRMSGF) +
017100181211               FMT((*CHAR 10) (*CHAR 5)) +
017200181211               MSG(''Record not found for update - &1'')');
017300181223          Cmd('ADDMSGD MSGID(EXP0010) MSGF(IRPEXP/ERRMSGF) +
017400181211               FMT((*CHAR 128)) +
017500181211               MSG(''The "&1" field may not be blank.'')');
017600181223          Cmd('ADDMSGD MSGID(EXP0020) MSGF(IRPEXP/ERRMSGF) +
017700181211               FMT((*CHAR 12)) +
017800181211               MSG(''Invalid "&1"'')');
017900181223          Cmd('ADDMSGD MSGID(EXP0030) MSGF(IRPEXP/ERRMSGF) +
018000181223               FMT((*CHAR 128)) +
018100181223               MSG(''The "&1" field may not be zero.'')');
018200181223          Cmd('ADDMSGD MSGID(EXP9010) MSGF(IRPEXP/ERRMSGF) +
018300181211               FMT((*CHAR 10)) +
018400181211               MSG(''Errors found in Trigger Program &1'')');
018500181223          Cmd('ADDMSGD MSGID(EXP9900) MSGF(IRPEXP/ERRMSGF) +
018600181211               FMT((*CHAR 10)) +
018700181211               MSG(''Unexpected error found in Trigger Program &1'')');
018800181228          //================================================
018900181228          Cmd('GRTOBJAUT OBJ(IRPEXP/ERRMSGF) OBJTYPE(*MSGF) +
019000181228               USER(*PUBLIC) AUT(*ALL)');
019100181228          Cmd('GRTOBJAUT OBJ(IRPEXP/EXPSRV) OBJTYPE(*BNDDIR) +
019200181228               USER(*PUBLIC) AUT(*ALL)');
019300181211          //================================================
019400181208          commit;
019500181208          //================================================
019600130706       on-error;
019700130706          rolbk;
019800130706       endmon;
019900130706      /end-free
020000181205      *=====================================================
020100181205     p                 e
020200181208      *===============================================================
020300181208      * Command Processor <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
020400181208      *===============================================================
020500181208     p Cmd             b
020600181208     d                 pi
020700181208     d  Cmd$                       4096    varying const options(*varsize)
020800181208      *=====================================================
020900181208     d CmdExc          pr                  extpgm('QCMDEXC')
021000181208     d                             4096    const options(*varsize)
021100181208     d                               15p 5 const
021200181208      *=====================================================
021300181208      /free
021400181208       monitor;
021500181208          //================================================
021600181208          CmdExc(Cmd$:%len(Cmd$));
021700181208          //================================================
021800181208       on-error;
021900181208          rolbk;
022000181208       endmon;
022100181208      /end-free
022200181208      *=====================================================
022300181208     p                 e
022400181208      *===============================================================
