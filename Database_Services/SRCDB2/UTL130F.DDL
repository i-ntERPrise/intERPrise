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
CREATE TABLE UTL130F (
"Menu_ID" FOR
    MNUID CHAR(10) NOT NULL DEFAULT '' ,
"Menu_Sequence" FOR
    MNUSEQ CHAR(3) NOT NULL DEFAULT '' ,
"Group" FOR
    "GROUP" CHAR(20) NOT NULL DEFAULT '' ,
"Option" FOR
    "OPTION" CHAR(2) NOT NULL DEFAULT '' ,
"Description" FOR
    DESCR CHAR(40) NOT NULL DEFAULT '' ,
"User_ID" FOR
    USRID CHAR(8) NOT NULL DEFAULT '' ,
"Allow_GoTo" FOR
    ALWGTO CHAR(1) NOT NULL DEFAULT '' ,
"Program_Sequence" FOR
    PGMSEQ CHAR(3) NOT NULL DEFAULT '' ,
"Program_Description" FOR
    PGMDSCR CHAR(40) NOT NULL DEFAULT '' ,
"Allow_Menu_Edit" FOR
    ALWMNEDT CHAR(1) NOT NULL DEFAULT '' ,
"User_Password_Status" FOR
    PWDSTS CHAR(1) NOT NULL DEFAULT '' ,
"User_Security_Level" FOR
    USRSLV CHAR(1) NOT NULL DEFAULT '' ,
"User_Logging_Status" FOR
    USRLSTS CHAR(1) NOT NULL DEFAULT '' ,
"User_Security_Level2" FOR
    USRSL2 CHAR(1) NOT NULL DEFAULT '' ,
"User_Alt_User_ID" FOR
    ALTUSRID CHAR(60) NOT NULL DEFAULT '' ,
    CONSTRAINT UTL130F_P PRIMARY KEY(
     MNUID,USRID))
    RCDFMT UTL130FR;
LABEL ON TABLE UTL130F IS 'IntERPrise Company User';
LABEL ON COLUMN UTL130F (
    MNUID        IS 'Menu                ID',
    MNUSEQ       IS 'Menu                Sequence',
    "GROUP"      IS 'Group',
    "OPTION"     IS 'Option',
    DESCR        IS 'Description',
    USRID        IS 'User                ID',
    ALWGTO       IS 'Allow               GoTo',
    PGMSEQ       IS 'Program             Seq',
    PGMDSCR      IS 'Program Description',
    ALWMNEDT     IS 'Allow               Menu Edit',
    PWDSTS       IS 'User                Password Sts',
    USRSLV       IS 'User Security       Level',
    USRLSTS      IS 'User                Logging Sts',
    USRSL2       IS 'User Security       Level2',
    ALTUSRID     IS 'User Alt User ID');
LABEL ON COLUMN UTL130F (
    MNUID        TEXT IS 'Menu ID',
    MNUSEQ       TEXT IS 'Menu Sequence',
    "GROUP"      TEXT IS 'Group',
    "OPTION"     TEXT IS 'Option',
    DESCR        TEXT IS 'Description',
    USRID        TEXT IS 'User ID',
    ALWGTO       TEXT IS 'Allow GoTo',
    PGMSEQ       TEXT IS 'Program Sequence',
    PGMDSCR      TEXT IS 'Program Description',
    ALWMNEDT     TEXT IS 'Allow Menu Edit',
    PWDSTS       TEXT IS 'User Password Status',
    USRSLV       TEXT IS 'User Security Level',
    USRLSTS      TEXT IS 'User Logging Sts',
    USRSL2       TEXT IS 'User Security Level2',
    ALTUSRID     TEXT IS 'User Alt User ID');
ALTER TABLE UTL130F ADD CONSTRAINT UTL130F_R0 FOREIGN KEY(
MNUID)
REFERENCES UTL100F (
MNUID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
ALTER TABLE UTL130F ADD CONSTRAINT UTL130F_R1 FOREIGN KEY(
USRID)
REFERENCES UTL135F (
USRID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
--CL:ADDPFTRG FILE(UTL130F) TRGTIME(*BEFORE) TRGEVENT(*INSERT) PGM(UTL130F_B0)
--TRG(UTL130F_BI00) ALWREPCHG(*YES)
--CL:ADDPFTRG FILE(UTL130F) TRGTIME(*BEFORE) TRGEVENT(*UPDATE) PGM(UTL130F_B0)
--TRG(UTL130F_BU00) ALWREPCHG(*YES)
