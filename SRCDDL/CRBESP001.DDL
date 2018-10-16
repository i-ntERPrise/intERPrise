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
CREATE TABLE CRBESP001 (
    FCDS1060 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT046 CHAR(11) NOT NULL DEFAULT '' ,
    CRBENA001 CHAR(40) NOT NULL DEFAULT '' ,
    RCDFMT CRBESP001R;
LABEL ON TABLE CRBESP001 IS 'Creditor BEE Spend';
LABEL ON COLUMN CRBESP001 (
    FCDS1060     IS 'FC/DA S1',
    CREDIT046    IS 'Creditor/Debtor',
    CRBENA001    IS 'Creditor BEE Name');
LABEL ON COLUMN CRBESP001 (
    FCDS1060     TEXT IS 'FC/DA S1',
    CREDIT046    TEXT IS 'Creditor/Debtor',
    CRBENA001    TEXT IS 'Creditor BEE Name');
