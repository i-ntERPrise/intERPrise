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
CREATE TABLE CRINTO001 (
    FCDS1049 CHAR(11) NOT NULL DEFAULT '' ,
    STBAPE022 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    CREDIT041 CHAR(11) NOT NULL DEFAULT '' ,
    CRBAPE001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    CRGRDA001 CHAR(10) NOT NULL DEFAULT '' ,
    RCDFMT CRINTO001R;
LABEL ON TABLE CRINTO001 IS 'Creditor Invoice to GRN';
LABEL ON COLUMN CRINTO001 (
    FCDS1049     IS 'FC/DA S1',
    STBAPE022    IS 'Period',
    CREDIT041    IS 'Creditor/Debtor',
    CRBAPE001    IS 'Creditor            Batch Period',
    CRGRDA001    IS 'Creditor            GRN Date');
LABEL ON COLUMN CRINTO001 (
    FCDS1049     TEXT IS 'FC/DA S1',
    STBAPE022    TEXT IS 'Stk Batch Period',
    CREDIT041    TEXT IS 'Creditor/Debtor',
    CRBAPE001    TEXT IS 'Creditor Batch Period',
    CRGRDA001    TEXT IS 'Creditor GRN Date');
