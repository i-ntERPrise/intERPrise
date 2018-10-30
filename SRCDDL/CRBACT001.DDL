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
CREATE TABLE CRBACT001 (
    FCDS1023 CHAR(11) NOT NULL DEFAULT '' ,
    FCVS1019 CHAR(11) NOT NULL DEFAULT '' ,
    FGS1017 CHAR(11) NOT NULL DEFAULT '' ,
    FGVS1017 CHAR(11) NOT NULL DEFAULT '' ,
    FGBS1027 CHAR(11) NOT NULL DEFAULT '' ,
    ACVS1008 CHAR(11) NOT NULL DEFAULT '' ,
    ENVADF007 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    NOTRIT008 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    CRTRSO004 CHAR(3) NOT NULL DEFAULT '' ,
    CRBCPE004 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    CRBCRE002 NUMERIC(7,0) NOT NULL DEFAULT 0 ,
    CRBCST002 CHAR(1) NOT NULL DEFAULT '' ,
    CRBCDA002 CHAR(10) NOT NULL DEFAULT '' ,
    CRBCAM002 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRBCDR002 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRBCCR002 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRBCLA002 DECIMAL(7,3) NOT NULL DEFAULT 0 ,
    CRBCNO002 DECIMAL(5,0) NOT NULL DEFAULT 0 ,
    CRBCTY002 CHAR(1) NOT NULL DEFAULT '' ,
    NOTRIT009 DECIMAL(7,3) NOT NULL DEFAULT 0 ,
    CRBCCR003 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT CRBACT001R;
LABEL ON TABLE CRBACT001 IS 'Creditor Batch Ctl';
LABEL ON COLUMN CRBACT001 (
    FCDS1023     IS 'FC/DA S1',
    FCVS1019     IS 'FCV                 S1',
    FGS1017      IS 'FG                  s1',
    FGVS1017     IS 'FGV                 S1',
    FGBS1027     IS 'FGB                 S1',
    ACVS1008     IS 'ACV                 S1',
    ENVADF007    IS 'Ent VAT Dft         Period Input1',
    NOTRIT008    IS 'Nom Trn             Itf Period',
    CRTRSO004    IS 'Src',
    CRBCPE004    IS 'Period',
    CRBCRE002    IS 'Refer',
    CRBCST002    IS 'Sts',
    CRBCDA002    IS 'Date',
    CRBCAM002    IS 'Amount',
    CRBCDR002    IS 'Debit',
    CRBCCR002    IS 'Credit',
    CRBCLA002    IS 'Last Seq',
    CRBCNO002    IS 'No of Trn',
    CRBCTY002    IS 'Typ',
    NOTRIT009    IS 'Nom Trn Itf         Seq-Major',
    CRBCCR003    IS 'Cr Bch              Creditor');
LABEL ON COLUMN CRBACT001 (
    FCDS1023     TEXT IS 'FC/DA S1',
    FCVS1019     TEXT IS 'FCV S1',
    FGS1017      TEXT IS 'FG s1',
    FGVS1017     TEXT IS 'FGV S1',
    FGBS1027     TEXT IS 'FGB S1',
    ACVS1008     TEXT IS 'ACV S1',
    ENVADF007    TEXT IS 'Ent VAT Dft Period Input1',
    NOTRIT008    TEXT IS 'Nom Trn Itf Period',
    CRTRSO004    TEXT IS 'Creditor Trn Source',
    CRBCPE004    TEXT IS 'Cr Bch Period',
    CRBCRE002    TEXT IS 'Cr Bch Reference',
    CRBCST002    TEXT IS 'Cr Bch Sts',
    CRBCDA002    TEXT IS 'Cr Bch Date',
    CRBCAM002    TEXT IS 'Cr Bch Amount',
    CRBCDR002    TEXT IS 'Cr Bch Dr',
    CRBCCR002    TEXT IS 'Cr Bch Cr',
    CRBCLA002    TEXT IS 'Cr Bch Last Seq',
    CRBCNO002    TEXT IS 'Cr Bch No of Trn',
    CRBCTY002    TEXT IS 'Cr Bch Type',
    NOTRIT009    TEXT IS 'Nom Trn Itf Seq-Major',
    CRBCCR003    TEXT IS 'Cr Bch Creditor');
