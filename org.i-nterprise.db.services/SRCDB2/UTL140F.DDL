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
CREATE TABLE UTL140F (
"User_ID" FOR
    USRID CHAR(8) NOT NULL DEFAULT '' ,
"User_ID_Number" FOR
    USRID# CHAR(15) NOT NULL DEFAULT '' ,
"User_ID_Date_First_Access" FOR
    USRIDFA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    CONSTRAINT UTL140F_P PRIMARY KEY(
     USRID))
    RCDFMT UTL140FR;
LABEL ON TABLE UTL140F IS 'intERPrise User Logon History';
LABEL ON COLUMN UTL140F (
    USRID        IS 'User                ID',
    USRID#       IS 'User ID Number',
    USRIDFA      IS 'User ID Date First  Access');
LABEL ON COLUMN UTL140F (
    USRID        TEXT IS 'User ID',
    USRID#       TEXT IS 'User ID Number',
    USRIDFA      TEXT IS 'User ID Date First Access');
ALTER TABLE UTL140F ADD CONSTRAINT UTL140F_R0 FOREIGN KEY(
USRID)
REFERENCES UTL135F (
USRID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
--CL:ADDPFTRG FILE(UTL140F) TRGTIME(*BEFORE) TRGEVENT(*INSERT) PGM(UTL140F_B0)
--TRG(UTL140F_BI00) ALWREPCHG(*YES)
--CL:ADDPFTRG FILE(UTL140F) TRGTIME(*BEFORE) TRGEVENT(*UPDATE) PGM(UTL140F_B0)
--TRG(UTL140F_BU00) ALWREPCHG(*YES)
