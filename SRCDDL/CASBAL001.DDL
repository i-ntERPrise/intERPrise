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
CREATE TABLE CASBAL001 (
    BANK009 DECIMAL(9,0) NOT NULL DEFAULT 0 ,
    NOMACC021 CHAR(11) NOT NULL DEFAULT '' ,
    FBS1010 CHAR(11) NOT NULL DEFAULT '' ,
    FGS1020 CHAR(11) NOT NULL DEFAULT '' ,
    FGBS1031 CHAR(11) NOT NULL DEFAULT '' ,
    CASHBO008 CHAR(11) NOT NULL DEFAULT '' ,
    CBLARE004 CHAR(10) NOT NULL DEFAULT '' ,
    CBAMT001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CBBAAC002 CHAR(1) NOT NULL DEFAULT '' ,
    CBDES003 CHAR(10) NOT NULL DEFAULT '' ,
    CBDES004 CHAR(40) NOT NULL DEFAULT '' ,
    CBLARE005 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    BANAC004 DECIMAL(15,0) NOT NULL DEFAULT 0 ,
    BACUSU002 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    CBSTS002 CHAR(1) NOT NULL DEFAULT '' ,
    BANCUS002 DECIMAL(9,0) NOT NULL DEFAULT 0 ,
    BANSTM002 NUMERIC(7,0) NOT NULL DEFAULT 0 ,
    CBLARE006 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CBAMOP001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CBNEPE001 DECIMAL(15,2) NOT NULL DEFAULT 0 )
    RCDFMT CASBAL001R;
LABEL ON TABLE CASBAL001 IS 'Cashbook Balance';
LABEL ON COLUMN CASBAL001 (
    BANK009      IS 'Bank',
    NOMACC021    IS 'Nominal             Account',
    FBS1010      IS 'FB S1',
    FGS1020      IS 'FG                  s1',
    FGBS1031     IS 'FGB                 S1',
    CASHBO008    IS 'Cashbook',
    CBLARE004    IS 'CB Last             Recon Date',
    CBAMT001     IS 'CB Amt',
    CBBAAC002    IS 'CB Bank             A/c Type',
    CBDES003     IS 'CB Desc',
    CBDES004     IS 'CB Description',
    CBLARE005    IS 'CB Last             Recon Amt',
    BANAC004     IS 'Bank A/c',
    BACUSU002    IS 'Bank Customer       Suffix',
    CBSTS002     IS 'CB                  Sts',
    BANCUS002    IS 'Bank                Customer',
    BANSTM002    IS 'Bank                Stmnt',
    CBLARE006    IS 'CB Last             Recon Seq',
    CBAMOP001    IS 'CB Amt Opening',
    CBNEPE001    IS 'CB Next             Period Amt');
LABEL ON COLUMN CASBAL001 (
    BANK009      TEXT IS 'Bank',
    NOMACC021    TEXT IS 'Nominal Account',
    FBS1010      TEXT IS 'FB S1',
    FGS1020      TEXT IS 'FG s1',
    FGBS1031     TEXT IS 'FGB S1',
    CASHBO008    TEXT IS 'Cashbook',
    CBLARE004    TEXT IS 'CB Last Recon Date',
    CBAMT001     TEXT IS 'CB Amt',
    CBBAAC002    TEXT IS 'CB Bank A/c Type',
    CBDES003     TEXT IS 'CB Desc',
    CBDES004     TEXT IS 'CB Description',
    CBLARE005    TEXT IS 'CB Last Recon Amt',
    BANAC004     TEXT IS 'Bank A/c',
    BACUSU002    TEXT IS 'Bank Customer Suffix',
    CBSTS002     TEXT IS 'CB Sts',
    BANCUS002    TEXT IS 'Bank Customer',
    BANSTM002    TEXT IS 'Bank Stmnt',
    CBLARE006    TEXT IS 'CB Last Recon Seq',
    CBAMOP001    TEXT IS 'CB Amt Opening',
    CBNEPE001    TEXT IS 'CB Next Period Amt');
