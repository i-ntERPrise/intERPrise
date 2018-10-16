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
CREATE TABLE CRMASU001 (
    FCDS1072 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT057 CHAR(11) NOT NULL DEFAULT '' ,
    CRMARE001 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT CRMASU001R;
LABEL ON TABLE CRMASU001 IS 'Creditor Master Sundry';
LABEL ON COLUMN CRMASU001 (
    FCDS1072     IS 'FC/DA S1',
    CREDIT057    IS 'Creditor/Debtor',
    CRMARE001    IS 'Creditor Master     Recur Sts');
LABEL ON COLUMN CRMASU001 (
    FCDS1072     TEXT IS 'FC/DA S1',
    CREDIT057    TEXT IS 'Creditor/Debtor',
    CRMARE001    TEXT IS 'Creditor Master Recur Sts');
