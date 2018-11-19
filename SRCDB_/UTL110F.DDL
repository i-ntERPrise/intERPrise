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
CREATE TABLE UTL110F (
"Menu_ID" FOR
    MNUID CHAR(10) NOT NULL DEFAULT '' ,
"Option" FOR
    "OPTION" CHAR(2) NOT NULL DEFAULT '' ,
"Description" FOR
    DESCR CHAR(40) NOT NULL DEFAULT '' ,
"Program_XF" FOR
    PGMXF CHAR(10) NOT NULL DEFAULT '' ,
"Type" FOR
    "TYPE" CHAR(1) NOT NULL DEFAULT '' ,
"Program_Parameter" FOR
    PGMPRM CHAR(10) NOT NULL DEFAULT '' ,
"User_ID" FOR
    USRID CHAR(8) NOT NULL DEFAULT '' ,
"Subsystem" FOR
    SUBSYS CHAR(10) NOT NULL DEFAULT '' ,
"Allow_GoTo" FOR
    ALWGTO CHAR(1) NOT NULL DEFAULT '' ,
"Display_Sequence_#" FOR
    DSPSEQ# DECIMAL(3,0) NOT NULL DEFAULT 0 ,
"Allow_Menu_Edit" FOR
    ALWMEDT CHAR(1) NOT NULL DEFAULT '' ,
"User_Status" FOR
    USRSTS CHAR(1) NOT NULL DEFAULT '' ,
"User_Security_Level" FOR
    USRSL CHAR(1) NOT NULL DEFAULT '' ,
"Menu_Level" FOR
    MNULVL DECIMAL(5,0) NOT NULL DEFAULT 0 ,
"Menu_ID_Header" FOR
    MNUIDH CHAR(10) NOT NULL DEFAULT '' ,
"Display_Sequence_#_Header" FOR
    DSPSEQH DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    CONSTRAINT UTL110F_P PRIMARY KEY(
     MNUID,USRID,OPTION))
    RCDFMT UTL110FR;
LABEL ON TABLE UTL110F IS 'intERPrise User/Menu Access';
LABEL ON COLUMN UTL110F (
    MNUID        IS 'Menu                Id',
    "OPTION"     IS 'Option',
    DESCR        IS 'Description',
    PGMXF        IS 'Program XF',
    "TYPE"       IS 'Type',
    PGMPRM       IS 'Program/Parameter',
    USRID        IS 'User                Id',
    SUBSYS       IS 'Subsystem',
    ALWGTO       IS 'Allow               GoTo',
    DSPSEQ#      IS 'Display             Sequence #',
    ALWMEDT      IS 'Allow               Menu Edit',
    USRSTS       IS 'User                Status',
    USRSL        IS 'User Security       Level',
    MNULVL       IS 'Menu                Level',
    MNUIDH       IS 'Menu                ID Header',
    DSPSEQH      IS 'Display             Seq # Hdr');
LABEL ON COLUMN UTL110F (
    MNUID        TEXT IS 'Menu ID',
    "OPTION"     TEXT IS 'Option',
    DESCR        TEXT IS 'Description',
    PGMXF        TEXT IS 'Program XF',
    "TYPE"       TEXT IS 'Type',
    PGMPRM       TEXT IS 'Program/Parameter',
    USRID        TEXT IS 'User ID',
    SUBSYS       TEXT IS 'Subsystem',
    ALWGTO       TEXT IS 'Allow GoTo',
    DSPSEQ#      TEXT IS 'Display Sequence #',
    ALWMEDT      TEXT IS 'Allow Menu Edit',
    USRSTS       TEXT IS 'User Status',
    USRSL        TEXT IS 'User Security Level',
    MNULVL       TEXT IS 'Menu Level',
    MNUIDH       TEXT IS 'Menu Id Header',
    DSPSEQH      TEXT IS 'Display Sequence # Header');
ALTER TABLE UTL110F ADD CONSTRAINT UTL110F_R0 FOREIGN KEY(
MNUID)
REFERENCES UTL100F (
MNUID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
ALTER TABLE UTL110F ADD CONSTRAINT UTL110F_R1 FOREIGN KEY(
USRID)
REFERENCES UTL135F (
USRID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
CL:ADDPFTRG FILE(UTL110F) TRGTIME(*BEFORE) TRGEVENT(*INSERT) PGM(UTL110F_B0)
TRG(UTL110F_BI00) ALWREPCHG(*YES)
CL:ADDPFTRG FILE(UTL110F) TRGTIME(*BEFORE) TRGEVENT(*UPDATE) PGM(UTL110F_B0)
TRG(UTL110F_BU00) ALWREPCHG(*YES)
