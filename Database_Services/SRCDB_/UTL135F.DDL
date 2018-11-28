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
CREATE TABLE UTL135F (
"User_ID" FOR
    USRID CHAR(8) NOT NULL DEFAULT '' ,
"User_ID_Number" FOR
    USRID# CHAR(15) NOT NULL DEFAULT '' ,
"User_ID_Name" FOR
    USRNAM CHAR(25) NOT NULL DEFAULT '' ,
    CONSTRAINT UTL135F_P PRIMARY KEY(
     USRID))
    RCDFMT UTL135FR;
LABEL ON TABLE UTL135F IS 'intERPrise User Identification';
LABEL ON COLUMN UTL135F (
    USRID        IS 'User                ID',
    USRID#       IS 'User ID Number',
    USRNAM       IS 'User ID Name');
LABEL ON COLUMN UTL135F (
    USRID        TEXT IS 'User ID',
    USRID#       TEXT IS 'User ID Number',
    USRNAM       TEXT IS 'User ID Name');
CL:ADDPFTRG FILE(UTL135F) TRGTIME(*BEFORE) TRGEVENT(*INSERT) PGM(UTL135F_B0)
TRG(UTL135F_BI00) ALWREPCHG(*YES)
CL:ADDPFTRG FILE(UTL135F) TRGTIME(*BEFORE) TRGEVENT(*UPDATE) PGM(UTL135F_B0)
TRG(UTL135F_BU00) ALWREPCHG(*YES)
