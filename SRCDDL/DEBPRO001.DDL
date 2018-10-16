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
CREATE TABLE DEBPRO001 (
    S1043 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSAC007 CHAR(11) NOT NULL DEFAULT '' ,
    DBPRRA001 CHAR(60) NOT NULL DEFAULT '' ,
    DBPRAS001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    DBPRLI001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    DBPRDA001 CHAR(10) NOT NULL DEFAULT '' ,
    DBPRGE001 CHAR(60) NOT NULL DEFAULT '' ,
    DBPRBA001 CHAR(60) NOT NULL DEFAULT '' ,
    DBPRNA001 CHAR(60) NOT NULL DEFAULT '' ,
    DBPRAC001 CHAR(60) NOT NULL DEFAULT '' ,
    DBPRGU001 CHAR(60) NOT NULL DEFAULT '' ,
    DBPRSE001 CHAR(60) NOT NULL DEFAULT '' ,
    DBPRCR001 CHAR(60) NOT NULL DEFAULT '' ,
    DBPRGE002 CHAR(60) NOT NULL DEFAULT '' ,
    DAS1006 CHAR(11) NOT NULL DEFAULT '' ,
    RCDFMT DEBPRO001R;
LABEL ON TABLE DEBPRO001 IS 'Debtor Profile';
LABEL ON COLUMN DEBPRO001 (
    S1043        IS 'S1',
    DEMSAC007    IS 'Account',
    DBPRRA001    IS 'Rating',
    DBPRAS001    IS 'Assets',
    DBPRLI001    IS 'Liabilities',
    DBPRDA001    IS 'Date              Last Chkd',
    DBPRGE001    IS 'General Info 1',
    DBPRBA001    IS 'Banker              Details',
    DBPRNA001    IS 'Name(s)',
    DBPRAC001    IS 'Account             Type/Number',
    DBPRGU001    IS 'Guarantees',
    DBPRSE001    IS 'Securities            Ceded',
    DBPRCR001    IS 'Credit              Status',
    DBPRGE002    IS 'Gen             (PD,RD,etc)',
    DAS1006      IS 'DA                  S1');
LABEL ON COLUMN DEBPRO001 (
    S1043        TEXT IS 'S1',
    DEMSAC007    TEXT IS 'Debtor Mst Account',
    DBPRRA001    TEXT IS 'Dbt Prof Rating',
    DBPRAS001    TEXT IS 'Dbt Prof Assets',
    DBPRLI001    TEXT IS 'Dbt Prof Liabilities',
    DBPRDA001    TEXT IS 'Dbt Prof Date Last Chkd',
    DBPRGE001    TEXT IS 'Dbt Prof General Info 1',
    DBPRBA001    TEXT IS 'Dbt Prof Banker Details',
    DBPRNA001    TEXT IS 'Dbt Prof Name(s)',
    DBPRAC001    TEXT IS 'Dbt Prof A/C Type/Number',
    DBPRGU001    TEXT IS 'Dbt Prof Guarantees',
    DBPRSE001    TEXT IS 'Dbt Prof Securities Ceded',
    DBPRCR001    TEXT IS 'Dbt Prof Credit Status',
    DBPRGE002    TEXT IS 'Dbt Prof Gen (PD,RD,etc)',
    DAS1006      TEXT IS 'DA S1');
