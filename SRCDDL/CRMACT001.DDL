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
CREATE TABLE CRMACT001 (
    FCDS1017 CHAR(11) NOT NULL DEFAULT '' ,
    FCVS1016 CHAR(11) NOT NULL DEFAULT '' ,
    CRCTPE001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    CRCTME001 CHAR(1) NOT NULL DEFAULT '' ,
    CRCTNO001 DECIMAL(7,0) NOT NULL DEFAULT 0 )
    RCDFMT CRMACT001R;
LABEL ON TABLE CRMACT001 IS 'Creditor Master Ctl';
LABEL ON COLUMN CRMACT001 (
    FCDS1017     IS 'FC/DA S1',
    FCVS1016     IS 'FCV                 S1',
    CRCTPE001    IS 'Cr Ctl              Period Dft',
    CRCTME001    IS 'Cr Ctl ME           Complete',
    CRCTNO001    IS 'Cr Ctl No           of Creditors');
LABEL ON COLUMN CRMACT001 (
    FCDS1017     TEXT IS 'FC/DA S1',
    FCVS1016     TEXT IS 'FCV S1',
    CRCTPE001    TEXT IS 'Cr Ctl Period Dft',
    CRCTME001    TEXT IS 'Cr Ctl ME Complete',
    CRCTNO001    TEXT IS 'Cr Ctl No of Creditors');
