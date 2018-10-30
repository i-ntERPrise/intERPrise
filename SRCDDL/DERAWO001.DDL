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
CREATE TABLE DERAWO001 (
    STKPRO035 CHAR(20) NOT NULL DEFAULT '' ,
    STGR1024 CHAR(2) NOT NULL DEFAULT '' ,
    DEMSAC026 CHAR(11) NOT NULL DEFAULT '' ,
    SAS1027 CHAR(11) NOT NULL DEFAULT '' ,
    SAVS1070 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1031 CHAR(11) NOT NULL DEFAULT '' ,
    DERAVA001 DECIMAL(15,2) NOT NULL DEFAULT 0 )
    RCDFMT DERAWO001R;
LABEL ON TABLE DERAWO001 IS 'Debtor/Prod Ranking Work';
LABEL ON COLUMN DERAWO001 (
    STKPRO035    IS 'Product',
    STGR1024     IS 'Grp                  1',
    DEMSAC026    IS 'Account',
    SAS1027      IS 'SA                  S1',
    SAVS1070     IS 'SAV                 S1',
    DAS1031      IS 'DA                  S1',
    DERAVA001    IS 'Debtor/Prod         Rank Value');
LABEL ON COLUMN DERAWO001 (
    STKPRO035    TEXT IS 'Stk Product',
    STGR1024     TEXT IS 'Stk Group 1',
    DEMSAC026    TEXT IS 'Debtor Mst Account',
    SAS1027      TEXT IS 'SA S1',
    SAVS1070     TEXT IS 'SAV S1',
    DAS1031      TEXT IS 'DA S1',
    DERAVA001    TEXT IS 'Debtor/Prod Rank Value');
