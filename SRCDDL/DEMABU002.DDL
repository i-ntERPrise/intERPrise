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
CREATE TABLE DEMABU002 (
    DAVS1041 CHAR(11) NOT NULL DEFAULT '' ,
    DRMSBU001 CHAR(1) NOT NULL DEFAULT '' ,
    DEMSAC038 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1052 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSBU003 CHAR(11) NOT NULL DEFAULT '' ,
    DRMSMA002 NUMERIC(3,0) NOT NULL DEFAULT 0 ,
    STGR1029 CHAR(2) NOT NULL DEFAULT '' ,
    DEMSAC039 CHAR(11) NOT NULL DEFAULT '' ,
    SAVS1088 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1053 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSBU004 CHAR(11) NOT NULL DEFAULT '' ,
    DRMSBD001 NUMERIC(6,0) NOT NULL DEFAULT 0 )
    RCDFMT DEMABU002R;
LABEL ON TABLE DEMABU002 IS 'Debtor Master Budget Ctl';
LABEL ON COLUMN DEMABU002 (
    DAVS1041     IS 'DAV                 S1',
    DRMSBU001    IS 'Dr Mst Bud          Ctl Sts',
    DEMSAC038    IS 'Account',
    DAS1052      IS 'DA                  S1',
    DEMSBU003    IS 'Debtor Mst          Bud Group 1',
    DRMSMA002    IS 'Dr Mst              Mail Seq',
    STGR1029     IS 'Grp                  1',
    DEMSAC039    IS 'Account',
    SAVS1088     IS 'SAV                 S1',
    DAS1053      IS 'DA                  S1',
    DEMSBU004    IS 'Debtor Mst          Bud Group 1',
    DRMSBD001    IS 'Dr Mst              BDtl Period');
LABEL ON COLUMN DEMABU002 (
    DAVS1041     TEXT IS 'DAV S1',
    DRMSBU001    TEXT IS 'Dr Mst Bud Ctl Sts',
    DEMSAC038    TEXT IS 'Debtor Mst Account',
    DAS1052      TEXT IS 'DA S1',
    DEMSBU003    TEXT IS 'Debtor Mst Bud Group 1',
    DRMSMA002    TEXT IS 'Dr Mst Mail Seq',
    STGR1029     TEXT IS 'Stk Group 1',
    DEMSAC039    TEXT IS 'Debtor Mst Account',
    SAVS1088     TEXT IS 'SAV S1',
    DAS1053      TEXT IS 'DA S1',
    DEMSBU004    TEXT IS 'Debtor Mst Bud Group 1',
    DRMSBD001    TEXT IS 'Dr Mst BDtl Period');
