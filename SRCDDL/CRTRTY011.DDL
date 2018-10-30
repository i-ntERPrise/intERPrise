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
CREATE TABLE CRTRTY011 (
    CRTRTY012 CHAR(3) NOT NULL DEFAULT '' ,
    FCVS1027 CHAR(11) NOT NULL DEFAULT '' ,
    CRTRTY013 CHAR(1) NOT NULL DEFAULT '' )
    RCDFMT CRTRTY011R;
LABEL ON TABLE CRTRTY011 IS 'Creditor Trn Type PE';
LABEL ON COLUMN CRTRTY011 (
    CRTRTY012    IS 'Trn                 Type',
    FCVS1027     IS 'FCV                 S1',
    CRTRTY013    IS 'Cr Trn Type         Selected');
LABEL ON COLUMN CRTRTY011 (
    CRTRTY012    TEXT IS 'Cr Trn Type',
    FCVS1027     TEXT IS 'FCV S1',
    CRTRTY013    TEXT IS 'Cr Trn Type Selected');
