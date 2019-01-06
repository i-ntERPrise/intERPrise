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
CREATE TABLE UTL150F (
"Menu_ID" FOR
    MNUID CHAR(10) NOT NULL DEFAULT '' ,
"Option" FOR
    "OPTION" CHAR(2) NOT NULL DEFAULT '' ,
"Description" FOR
    DESCR CHAR(40) NOT NULL DEFAULT '' ,
"User_ID" FOR
    USRID CHAR(8) NOT NULL DEFAULT '' ,
"User_Log_TimeStamp" FOR
    USRLDTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    CONSTRAINT UTL150F_P PRIMARY KEY(
     USRID,MNUID))
    RCDFMT UTL150FR;
LABEL ON TABLE UTL150F IS 'intERPrise User Log';
LABEL ON COLUMN UTL150F (
    MNUID        IS 'Menu                ID',
    "OPTION"     IS 'Option',
    DESCR        IS 'Description',
    USRID        IS 'User                ID',
    USRLDTS      IS 'User Log TimeStamp');
LABEL ON COLUMN UTL150F (
    MNUID        TEXT IS 'Menu ID',
    "OPTION"     TEXT IS 'Option',
    DESCR        TEXT IS 'Description',
    USRID        TEXT IS 'User ID',
    USRLDTS      TEXT IS 'User Log TimeStamp');
ALTER TABLE UTL150F ADD CONSTRAINT UTL150F_R0 FOREIGN KEY(
USRID)
REFERENCES UTL135F (
USRID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
ALTER TABLE UTL150F ADD CONSTRAINT UTL150F_R1 FOREIGN KEY(
MNUID)
REFERENCES UTL100F (
MNUID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
--CL:ADDPFTRG FILE(UTL150F) TRGTIME(*BEFORE) TRGEVENT(*INSERT) PGM(UTL150F_B0)
--TRG(UTL150F_BI00) ALWREPCHG(*YES)
--CL:ADDPFTRG FILE(UTL150F) TRGTIME(*BEFORE) TRGEVENT(*UPDATE) PGM(UTL150F_B0)
--TRG(UTL150F_BU00) ALWREPCHG(*YES)
