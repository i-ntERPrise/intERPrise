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
CREATE TABLE DEBACT001 (
    S1048 CHAR(11) NOT NULL DEFAULT '' ,
    DEBALA002 DECIMAL(7,3) NOT NULL DEFAULT 0 ,
    DETRSO001 CHAR(3) NOT NULL DEFAULT '' ,
    DEBAAM001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    DAVS1016 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1009 CHAR(11) NOT NULL DEFAULT '' ,
    FGBS1002 CHAR(11) NOT NULL DEFAULT '' ,
    ACVS1001 CHAR(11) NOT NULL DEFAULT '' ,
    ENVADF001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    NOTRIT001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    DEBCTY001 CHAR(1) NOT NULL DEFAULT '' )
    RCDFMT DEBACT001R;
LABEL ON TABLE DEBACT001 IS 'Debtor Batch Ctl';
LABEL ON COLUMN DEBACT001 (
    S1048        IS 'S1',
    DEBALA002    IS 'Last                Seq No',
    DETRSO001    IS 'Src',
    DEBAAM001    IS 'Batch               Amount',
    DAVS1016     IS 'DAV                 S1',
    DAS1009      IS 'DA                  S1',
    FGBS1002     IS 'FGB                 S1',
    ACVS1001     IS 'ACV                 S1',
    ENVADF001    IS 'Ent VAT Dft         Period Input1',
    NOTRIT001    IS 'Nom Trn             Itf Period',
    DEBCTY001    IS 'Debtor              Bch Type');
LABEL ON COLUMN DEBACT001 (
    S1048        TEXT IS 'S1',
    DEBALA002    TEXT IS 'Debtor Batch Last Seq No',
    DETRSO001    TEXT IS 'Debtor Trn Source',
    DEBAAM001    TEXT IS 'Debtor Batch Amount',
    DAVS1016     TEXT IS 'DAV S1',
    DAS1009      TEXT IS 'DA S1',
    FGBS1002     TEXT IS 'FGB S1',
    ACVS1001     TEXT IS 'ACV S1',
    ENVADF001    TEXT IS 'Ent VAT Dft Period Input1',
    NOTRIT001    TEXT IS 'Nom Trn Itf Period',
    DEBCTY001    TEXT IS 'Debtor Bch Type');
