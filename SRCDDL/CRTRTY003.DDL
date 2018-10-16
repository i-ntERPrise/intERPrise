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
--                          http://www.i-nterprise.org/                                  -
--                                                                                       -
-- =======================================================================================
CREATE TABLE CRTRTY003 (
    S1072 CHAR(11) NOT NULL DEFAULT '' ,
    CRTRTY004 CHAR(3) NOT NULL DEFAULT '' ,
    FCVS1013 CHAR(11) NOT NULL DEFAULT '' ,
    CRTRTY005 CHAR(10) NOT NULL DEFAULT '' ,
    RCDFMT CRTRTY003R;
LABEL ON TABLE CRTRTY003 IS 'Creditor Trn Type';
LABEL ON COLUMN CRTRTY003 (
    S1072        IS 'S1',
    CRTRTY004    IS 'Trn                 Type',
    FCVS1013     IS 'FCV                 S1',
    CRTRTY005    IS 'Cr Trn              Type Desc');
LABEL ON COLUMN CRTRTY003 (
    S1072        TEXT IS 'S1',
    CRTRTY004    TEXT IS 'Cr Trn Type',
    FCVS1013     TEXT IS 'FCV S1',
    CRTRTY005    TEXT IS 'Cr Trn Type Desc');
