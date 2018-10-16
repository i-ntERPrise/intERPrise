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
CREATE TABLE CRMIWO001 (
    FCDS1027 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT025 CHAR(11) NOT NULL DEFAULT '' ,
    CRMIST001 CHAR(1) NOT NULL DEFAULT '' ,
    CRMINA001 CHAR(40) NOT NULL DEFAULT '' ,
    CRMIDE001 CHAR(10) NOT NULL DEFAULT '' ,
    CRMICU001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRMI03001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRMI06001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRMI09001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRMI12001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRMI15001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRMI18001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRMIBA001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    RCDFMT CRMIWO001R;
LABEL ON TABLE CRMIWO001 IS 'Creditor MIS Work';
LABEL ON COLUMN CRMIWO001 (
    FCDS1027     IS 'FC/DA S1',
    CREDIT025    IS 'Creditor/Debtor',
    CRMIST001    IS 'Sts',
    CRMINA001    IS 'Name',
    CRMIDE001    IS 'Desc',
    CRMICU001    IS 'Current',
    CRMI03001    IS '030 Days',
    CRMI06001    IS '060 Days',
    CRMI09001    IS '090 Days',
    CRMI12001    IS '120 Days',
    CRMI15001    IS '150 Days',
    CRMI18001    IS '180 Days',
    CRMIBA001    IS 'Balance');
LABEL ON COLUMN CRMIWO001 (
    FCDS1027     TEXT IS 'FC/DA S1',
    CREDIT025    TEXT IS 'Creditor/Debtor',
    CRMIST001    TEXT IS 'Cr MIS Sts',
    CRMINA001    TEXT IS 'Cr MIS Name',
    CRMIDE001    TEXT IS 'Cr MIS Desc',
    CRMICU001    TEXT IS 'Cr MIS Current',
    CRMI03001    TEXT IS 'Cr MIS 030 Days',
    CRMI06001    TEXT IS 'Cr MIS 060 Days',
    CRMI09001    TEXT IS 'Cr MIS 090 Days',
    CRMI12001    TEXT IS 'Cr MIS 120 Days',
    CRMI15001    TEXT IS 'Cr MIS 150 Days',
    CRMI18001    TEXT IS 'Cr MIS 180 Days',
    CRMIBA001    TEXT IS 'Cr MIS Balance');
