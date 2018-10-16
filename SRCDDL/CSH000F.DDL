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
CREATE TABLE CSH000F (
    ACCOUNT# CHAR(11) NOT NULL DEFAULT '' ,
    BANK008 DECIMAL(9,0) NOT NULL DEFAULT 0 ,
    BANDES009 CHAR(10) NOT NULL DEFAULT '' ,
    BANDES010 CHAR(40) NOT NULL DEFAULT '' ,
    BAADL1005 CHAR(40) NOT NULL DEFAULT '' ,
    NACTYP CHAR(1) NOT NULL DEFAULT '' ,
    NOMSRE007 CHAR(1) NOT NULL DEFAULT '' ,
    NACCTYP CHAR(1) NOT NULL DEFAULT '' ,
    NOMACC019 CHAR(11) NOT NULL DEFAULT '' ,
    NONOST007 CHAR(3) NOT NULL DEFAULT '' ,
    NOMSST007 CHAR(1) NOT NULL DEFAULT '' ,
    NOMDES009 CHAR(40) NOT NULL DEFAULT '' ,
    NOMACC020 CHAR(11) NOT NULL DEFAULT '' ,
    NOMSNO002 CHAR(11) NOT NULL DEFAULT '' ,
    FBS1009 CHAR(11) NOT NULL DEFAULT '' ,
    FGS1019 CHAR(11) NOT NULL DEFAULT '' ,
    FGVS1018 CHAR(11) NOT NULL DEFAULT '' ,
    NACSOD CHAR(1) NOT NULL DEFAULT '' ,
    NOMSRE008 CHAR(24) NOT NULL DEFAULT '' ,
    FGBS1029 CHAR(11) NOT NULL DEFAULT '' ,
    NOMSDE004 CHAR(10) NOT NULL DEFAULT '' ,
    NOMSCO004 CHAR(1) NOT NULL DEFAULT '' ,
    NOMSST008 CHAR(1) NOT NULL DEFAULT '' ,
    FGBS1030 CHAR(11) NOT NULL DEFAULT '' ,
    FGS1003 CHAR(11) NOT NULL DEFAULT '' ,
    CSHACC CHAR(11) NOT NULL DEFAULT '' ,
    CBLARE001 CHAR(10) NOT NULL DEFAULT '' ,
    CBBNKACC CHAR(1) NOT NULL DEFAULT '' ,
    CBDES001 CHAR(10) NOT NULL DEFAULT '' ,
    CBDES002 CHAR(40) NOT NULL DEFAULT '' ,
    CBLARE002 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    BNKACC DECIMAL(15,0) NOT NULL DEFAULT 0 ,
    BACUSU001 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    CBSTS001 CHAR(1) NOT NULL DEFAULT '' ,
    BATRTY002 CHAR(1) NOT NULL DEFAULT '' ,
    BASTSR002 CHAR(1) NOT NULL DEFAULT '' ,
    BANCUS001 DECIMAL(9,0) NOT NULL DEFAULT 0 ,
    BANSTM001 NUMERIC(7,0) NOT NULL DEFAULT 0 ,
    CBLARE003 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CONSTRAINT CSH000F_P PRIMARY KEY(
     CSHBOK))
    RCDFMT CSH000FR;
LABEL ON TABLE CSH000F IS 'Cashbook';
LABEL ON COLUMN CSH000F (
    ACCOUNT#     IS 'Cashbook            Account',
    BANK008      IS 'Bank',
    BANDES009    IS 'Desc',
    BANDES010    IS 'Description',
    BAADL1005    IS 'Address',
    NACTYP       IS 'Nominal             Account             Type',
    NOMSRE007    IS 'Rtn Dtl',
    NACCTYP      IS 'Ctl                 Typ',
    NOMACC019    IS 'Nominal             Account',
    NONOST007    IS 'Non-Fin             Stat',
    NOMSST007    IS 'Sts',
    NOMDES009    IS 'Nominal Description',
    NOMACC020    IS 'Nominal             Account-IE',
    NOMSNO002    IS 'Nom Mst Nominal     Account',
    FBS1009      IS 'FB S1',
    FGS1019      IS 'FG                  s1',
    FGVS1018     IS 'FGV                 S1',
    NACSOD       IS 'Sum/Dtl',
    NOMSRE008    IS 'Refer',
    FGBS1029     IS 'FGB                 S1',
    NOMSDE004    IS 'Nom Mst             Desc',
    NOMSCO004    IS 'Nom Mst             Confidential',
    NOMSST008    IS 'Lvl1                Bud',
    FGBS1030     IS 'FGB-IE              S1',
    FGS1003      IS 'FG-IE               s1',
    CSHACC       IS 'Cashbook',
    CBLARE001    IS 'CB Last             Recon Date',
    CBBNKACC     IS 'CB Bank             A/c Type',
    CBDES001     IS 'CB Desc',
    CBDES002     IS 'CB Description',
    CBLARE002    IS 'CB Last             Recon Amt',
    BNKACC       IS 'Bank A/c',
    BACUSU001    IS 'Bank Customer       Suffix',
    CBSTS001     IS 'CB                  Sts',
    BATRTY002    IS 'Bank Trn            Type',
    BASTSR002    IS 'Bank                Stmnt Src',
    BANCUS001    IS 'Bank                Customer',
    BANSTM001    IS 'Bank                Stmnt',
    CBLARE003    IS 'CB Last             Recon Seq');
LABEL ON COLUMN CSH000F (
    ACCOUNT#     TEXT IS 'Cashbook Account',
    BANK008      TEXT IS 'Bank',
    BANDES009    TEXT IS 'Bank Desc',
    BANDES010    TEXT IS 'Bank Description',
    BAADL1005    TEXT IS 'Bank Address L1',
    NACTYP       TEXT IS 'Nominal A/c Type',
    NOMSRE007    TEXT IS 'Nom Mst Retain Dtl',
    NACCTYP      TEXT IS 'Nominal A/c Control Type',
    NOMACC019    TEXT IS 'Nominal Account',
    NONOST007    TEXT IS 'Nom Non-Fin Stat',
    NOMSST007    TEXT IS 'Nom Mst Sts',
    NOMDES009    TEXT IS 'Nominal Description',
    NOMACC020    TEXT IS 'Nominal Account-IE',
    NOMSNO002    TEXT IS 'Nom Mst Nominal Account',
    FBS1009      TEXT IS 'FB S1',
    FGS1019      TEXT IS 'FG s1',
    FGVS1018     TEXT IS 'FGV S1',
    NACSOD       TEXT IS 'Nominal A/c Sum/Dtl',
    NOMSRE008    TEXT IS 'Nom Mst Refer',
    FGBS1029     TEXT IS 'FGB S1',
    NOMSDE004    TEXT IS 'Nom Mst Desc',
    NOMSCO004    TEXT IS 'Nom Mst Confidential',
    NOMSST008    TEXT IS 'Nom Mst Sts-Lvl1 Budget',
    FGBS1030     TEXT IS 'FGB-IE S1',
    FGS1003      TEXT IS 'FG-IE s1',
    CSHACC       TEXT IS 'Cashbook',
    CBLARE001    TEXT IS 'CB Last Recon Date',
    CBBNKACC     TEXT IS 'CB Bank A/c Type',
    CBDES001     TEXT IS 'CB Desc',
    CBDES002     TEXT IS 'CB Description',
    CBLARE002    TEXT IS 'CB Last Recon Amt',
    BNKACC       TEXT IS 'Bank A/c',
    BACUSU001    TEXT IS 'Bank Customer Suffix',
    CBSTS001     TEXT IS 'CB Sts',
    BATRTY002    TEXT IS 'Bank Trn Type',
    BASTSR002    TEXT IS 'Bank Stmnt Src',
    BANCUS001    TEXT IS 'Bank Customer',
    BANSTM001    TEXT IS 'Bank Stmnt',
    CBLARE003    TEXT IS 'CB Last Recon Seq');
