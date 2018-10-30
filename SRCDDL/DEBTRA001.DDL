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
CREATE TABLE DEBTRA001 (
    S1047 CHAR(11) NOT NULL DEFAULT '' ,
    FORCUR009 CHAR(3) NOT NULL DEFAULT '' ,
    DETRRE002 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    DEMSAC009 CHAR(11) NOT NULL DEFAULT '' ,
    DEBAPE002 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    DELMET005 CHAR(3) NOT NULL DEFAULT '' ,
    AAVS1012 CHAR(11) NOT NULL DEFAULT '' ,
    DETRTY002 CHAR(1) NOT NULL DEFAULT '' ,
    REPRES007 CHAR(11) NOT NULL DEFAULT '' ,
    DEBARE001 NUMERIC(7,0) NOT NULL DEFAULT 0 ,
    DETRTA002 CHAR(15) NOT NULL DEFAULT '' ,
    DEBAST001 CHAR(1) NOT NULL DEFAULT '' ,
    DETRCR001 CHAR(1) NOT NULL DEFAULT '' ,
    DAVS1015 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1008 CHAR(11) NOT NULL DEFAULT '' ,
    DETRQR003 CHAR(3) NOT NULL DEFAULT '' ,
    DASTAC001 CHAR(11) NOT NULL DEFAULT '' ,
    DETRTY003 CHAR(1) NOT NULL DEFAULT '' ,
    DASS1002 CHAR(11) NOT NULL DEFAULT '' ,
    DETRQR004 CHAR(1) NOT NULL DEFAULT '' ,
    DADETR002 CHAR(3) NOT NULL DEFAULT '' ,
    DETRUS001 CHAR(10) NOT NULL DEFAULT '' )
    RCDFMT DEBTRA001R;
LABEL ON TABLE DEBTRA001 IS 'Debtor Transaction';
LABEL ON COLUMN DEBTRA001 (
    S1047        IS 'S1',
    FORCUR009    IS 'Forex',
    DETRRE002    IS 'Trn                 Ref',
    DEMSAC009    IS 'Account',
    DEBAPE002    IS 'Period',
    DELMET005    IS 'Del                 Mthd',
    AAVS1012     IS '',
    DETRTY002    IS 'Sub-Type',
    REPRES007    IS 'Rep',
    DEBARE001    IS 'Batch                Ref',
    DETRTA002    IS 'Tax Ref',
    DEBAST001    IS 'Bch                 Sts',
    DETRCR001    IS 'Cred                O/r Rsn',
    DAVS1015     IS 'DAV                 S1',
    DAS1008      IS 'DA                  S1',
    DETRQR003    IS 'Debtor              Trn Qry',
    DASTAC001    IS 'Statement           Account',
    DETRTY003    IS 'Entry',
    DASS1002     IS 'DA-StmntTrn         S1',
    DETRQR004    IS 'Qry Tp',
    DADETR002    IS 'DAV-Claim           Debtor Trn Type',
    DETRUS001    IS 'Debtor              Trn User');
LABEL ON COLUMN DEBTRA001 (
    S1047        TEXT IS 'S1',
    FORCUR009    TEXT IS 'Foreign Currency',
    DETRRE002    TEXT IS 'Debtor Trn Ref',
    DEMSAC009    TEXT IS 'Debtor Mst Account',
    DEBAPE002    TEXT IS 'Debtor Batch Period',
    DELMET005    TEXT IS 'Del Method',
    AAVS1012     TEXT IS 'AAV S1',
    DETRTY002    TEXT IS 'Debtor Trn Type Sub-Type',
    REPRES007    TEXT IS 'Representative',
    DEBARE001    TEXT IS 'Debtor Batch Reference',
    DETRTA002    TEXT IS 'Debtor Trn Tax Ref',
    DEBAST001    TEXT IS 'Debtor Batch Status',
    DETRCR001    TEXT IS 'Debtor Trn Credit O/r Rsn',
    DAVS1015     TEXT IS 'DAV S1',
    DAS1008      TEXT IS 'DA S1',
    DETRQR003    TEXT IS 'Debtor Trn Qry',
    DASTAC001    TEXT IS 'DA Statement Account',
    DETRTY003    TEXT IS 'Debtor Trn Type Entry',
    DASS1002     TEXT IS 'DA-StmntTrn S1',
    DETRQR004    TEXT IS 'Debtor Trn Qry Type',
    DADETR002    TEXT IS 'DAV-Claim Debtor Trn Type',
    DETRUS001    TEXT IS 'Debtor Trn User');
