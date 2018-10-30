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
CREATE TABLE DEBREP001 (
    STGR1013 CHAR(2) NOT NULL DEFAULT '' ,
    STMSST015 CHAR(1) NOT NULL DEFAULT '' ,
    DEMSAC020 CHAR(11) NOT NULL DEFAULT '' ,
    SBS1031 CHAR(11) NOT NULL DEFAULT '' ,
    STMSPR016 CHAR(20) NOT NULL DEFAULT '' ,
    DEGR2007 CHAR(2) NOT NULL DEFAULT '' ,
    STBAPR021 CHAR(20) NOT NULL DEFAULT '' ,
    SAS1015 CHAR(11) NOT NULL DEFAULT '' ,
    SAVS1047 CHAR(11) NOT NULL DEFAULT '' ,
    DAVS1031 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1024 CHAR(11) NOT NULL DEFAULT '' ,
    PGMKEY001 CHAR(21) NOT NULL DEFAULT '' ,
    DRQT1001 DECIMAL(13,4) NOT NULL DEFAULT 0 ,
    DRAM1001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    DRQT2001 DECIMAL(13,4) NOT NULL DEFAULT 0 ,
    DESENO001 DECIMAL(7,3) NOT NULL DEFAULT 0 )
    RCDFMT DEBREP001R;
LABEL ON TABLE DEBREP001 IS 'Debtor/Stock Report';
LABEL ON COLUMN DEBREP001 (
    STGR1013     IS 'Grp                  1',
    STMSST015    IS 'Sts',
    DEMSAC020    IS 'Account',
    SBS1031      IS '',
    STMSPR016    IS 'Product',
    DEGR2007     IS 'Grp                  2',
    STBAPR021    IS 'Product',
    SAS1015      IS 'SA                  S1',
    SAVS1047     IS 'SAV                 S1',
    DAVS1031     IS 'DAV                 S1',
    DAS1024      IS 'DA                  S1',
    PGMKEY001    IS 'Pgm/Str             Key',
    DRQT1001     IS 'Dr/Stk              Qty 1',
    DRAM1001     IS 'Dr/Stk              Amt 1',
    DRQT2001     IS 'Dr/Stk              Qty 2',
    DESENO001    IS 'Debtor/Stock        Seq No');
LABEL ON COLUMN DEBREP001 (
    STGR1013     TEXT IS 'Stk Group 1',
    STMSST015    TEXT IS 'Stk Mst Status',
    DEMSAC020    TEXT IS 'Debtor Mst Account',
    SBS1031      TEXT IS 'SB S1',
    STMSPR016    TEXT IS 'Stk Mst Product',
    DEGR2007     TEXT IS 'Debtor Group 2',
    STBAPR021    TEXT IS 'Stk Bal Product',
    SAS1015      TEXT IS 'SA S1',
    SAVS1047     TEXT IS 'SAV S1',
    DAVS1031     TEXT IS 'DAV S1',
    DAS1024      TEXT IS 'DA S1',
    PGMKEY001    TEXT IS 'Pgm/Str Key',
    DRQT1001     TEXT IS 'Dr/Stk Qty 1',
    DRAM1001     TEXT IS 'Dr/Stk Amt 1',
    DRQT2001     TEXT IS 'Dr/Stk Qty 2',
    DESENO001    TEXT IS 'Debtor/Stock Seq No');
