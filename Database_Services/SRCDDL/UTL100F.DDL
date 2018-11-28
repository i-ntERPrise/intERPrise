-- =======================================================================================
--                                                                                       -
-- Copyright (c) 2008-2018 TEMBO Technology Lab (Pty) Ltd.                               -
-- Created by AO Foundation - www.adsero-optima.com                                      -
-- Original TEMPLATE author: Tommy Atkins - Chief Development Officer                    -
--                                                                                       -
-- All source rendered by AO Foundation, based on harvested information from S2E Models  -
-- retrieved and recovered with the consent of Axiom Systems Africa Pty (Ltd)            -
-- from their Infologic application, subject to the Apache License, Version 2.0 terms.   -
-- (http://www.axiom.co.za/index.php/solutions/application-systems/infologic)            -
--                                                                                       -
-- Licensed under the Apache License, Version 2.0 (the "License");                       -
-- you may not use this file except in compliance with the License.                      -
-- You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0    -
--                                                                                       -
-- Unless required by applicable law or agreed to in writing, software                   -
-- distributed under the License is distributed on an "AS IS" BASIS,                     -
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.              -
-- See the License for the specific language governing permissions and                   -
-- limitations under the License.                                                        -
--                                                                                       -
-- The above copyright notice and this permission notice shall be included in all copies -
-- or substantial portions of the Software.                                              -
--                                                                                       -
--                             http://www.i-nterprise.org/                               -
--                                                                                       -
-- =======================================================================================
CREATE TABLE UTL100F (
"Menu_ID" FOR
    MNUID CHAR(10) NOT NULL DEFAULT '' ,
"Menu_Sequence" FOR
    SEQ CHAR(3) NOT NULL DEFAULT '' ,
"Group" FOR
    "GROUP" CHAR(20) NOT NULL DEFAULT '' ,
"Menu_Option" FOR
    "OPTION" CHAR(2) NOT NULL DEFAULT '' ,
"Description" FOR
    DESCR CHAR(40) NOT NULL DEFAULT '' ,
"Program_XF" FOR
    PGMXF CHAR(10) NOT NULL DEFAULT '' ,
"Type" FOR
    "TYPE" CHAR(1) NOT NULL DEFAULT '' ,
"Program_Parameter" FOR
    PGMPRM CHAR(10) NOT NULL DEFAULT '' ,
"Subsystem" FOR
    SUBSYS CHAR(10) NOT NULL DEFAULT '' ,
"Date_Loaded" FOR
    DTMLOD TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
"Date_Changed" FOR
    DTMCHG TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
"Display_Sequence" FOR
    DSPSEQ DECIMAL(3,0) NOT NULL DEFAULT 0 ,
"User_Status" FOR
    USRSTS CHAR(1) NOT NULL DEFAULT '' ,
    CONSTRAINT UTL100F_P PRIMARY KEY(
     MNUID))
    RCDFMT UTL100FR;
LABEL ON TABLE UTL100F IS 'intERPrise Menu';
LABEL ON COLUMN UTL100F (
    MNUID        IS 'Menu                Id',
    SEQ          IS 'Sequence',
    "GROUP"      IS 'Group',
    "OPTION"     IS 'Menu                Option',
    DESCR        IS 'Description',
    PGMXF        IS 'Program XF',
    "TYPE"       IS 'Type',
    PGMPRM       IS 'Program/Parameter',
    SUBSYS       IS 'Subsystem',
    DTMLOD       IS 'Date                Loaded',
    DTMCHG       IS 'Date                Changed',
    DSPSEQ       IS 'Display             Sequence',
    USRSTS       IS 'User                Sts');
LABEL ON COLUMN UTL100F (
    MNUID        TEXT IS 'Menu ID',
    SEQ          TEXT IS 'Sequence',
    "GROUP"      TEXT IS 'Group',
    "OPTION"     TEXT IS 'Menu Option',
    DESCR        TEXT IS 'Description',
    PGMXF        TEXT IS 'Program XF',
    "TYPE"       TEXT IS 'Type',
    PGMPRM       TEXT IS 'Program/Parameter',
    SUBSYS       TEXT IS 'Subsystem',
    DTMLOD       TEXT IS 'Date Loaded',
    DTMCHG       TEXT IS 'Date Changed',
    DSPSEQ       TEXT IS 'Display Seq #',
    USRSTS       TEXT IS 'User Status');
CL:ADDPFTRG FILE(UTL100F) TRGTIME(*BEFORE) TRGEVENT(*INSERT) PGM(UTL100F_B0)
TRG(UTL100F_BI00) ALWREPCHG(*YES)
CL:ADDPFTRG FILE(UTL100F) TRGTIME(*BEFORE) TRGEVENT(*UPDATE) PGM(UTL100F_B0)
TRG(UTL100F_BU00) ALWREPCHG(*YES)
