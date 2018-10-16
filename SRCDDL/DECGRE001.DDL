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
CREATE TABLE DECGRE001 (
    DAVS1033 CHAR(11) NOT NULL DEFAULT '' ,
    DRCGRE001 CHAR(3) NOT NULL DEFAULT '' ,
    DRCGRS001 CHAR(10) NOT NULL DEFAULT '' ,
    DEMSAC025 CHAR(11) NOT NULL DEFAULT '' ,
    DAVS1034 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1030 CHAR(11) NOT NULL DEFAULT '' ,
    DRMSCR006 CHAR(10) NOT NULL DEFAULT '' ,
    DRCGRE002 CHAR(3) NOT NULL DEFAULT '' ,
    DRCGRS002 CHAR(10) NOT NULL DEFAULT '' ,
    DRCGAN001 CHAR(10) NOT NULL DEFAULT '' ,
    DRCGAN002 CHAR(10) NOT NULL DEFAULT '' ,
    DRCGRE003 CHAR(3) NOT NULL DEFAULT '' ,
    DRCGRS003 CHAR(10) NOT NULL DEFAULT '' ,
    DRCGFI001 CHAR(20) NOT NULL DEFAULT '' ,
    DADRCG001 CHAR(3) NOT NULL DEFAULT '' ,
    DADRCG002 CHAR(3) NOT NULL DEFAULT '' ,
    RCDFMT DECGRE001R;
LABEL ON TABLE DECGRE001 IS 'Debtor CGIC Reason';
LABEL ON COLUMN DECGRE001 (
    DAVS1033     IS 'DAV                 S1',
    DRCGRE001    IS 'Rsn',
    DRCGRS001    IS 'Desc',
    DEMSAC025    IS 'Account',
    DAVS1034     IS 'DAV                 S1',
    DAS1030      IS 'DA                  S1',
    DRMSCR006    IS 'Dr Mst-C Cr         Guarantee',
    DRCGRE002    IS 'Rsn',
    DRCGRS002    IS 'Desc',
    DRCGAN001    IS 'Annexure',
    DRCGAN002    IS 'Annex Repl',
    DRCGRE003    IS 'Rsn2',
    DRCGRS003    IS 'Desc',
    DRCGFI001    IS 'Dr CGIC File No',
    DADRCG001    IS 'DAV2 Dr             CGIC Reason',
    DADRCG002    IS 'DAV3 Dr             CGIC Reason');
LABEL ON COLUMN DECGRE001 (
    DAVS1033     TEXT IS 'DAV S1',
    DRCGRE001    TEXT IS 'Dr CGIC Reason',
    DRCGRS001    TEXT IS 'Dr CGIC Rsn Desc',
    DEMSAC025    TEXT IS 'Debtor Mst Account',
    DAVS1034     TEXT IS 'DAV S1',
    DAS1030      TEXT IS 'DA S1',
    DRMSCR006    TEXT IS 'Dr Mst-C Cr Guarantee',
    DRCGRE002    TEXT IS 'Dr CGIC Reason',
    DRCGRS002    TEXT IS 'Dr CGIC Rsn Desc',
    DRCGAN001    TEXT IS 'Dr CGIC Annexure',
    DRCGAN002    TEXT IS 'Dr CGIC Annexure Repl',
    DRCGRE003    TEXT IS 'Dr CGIC Reason 2',
    DRCGRS003    TEXT IS 'Dr CGIC Rsn Desc 2',
    DRCGFI001    TEXT IS 'Dr CGIC File No',
    DADRCG001    TEXT IS 'DAV2 Dr CGIC Reason',
    DADRCG002    TEXT IS 'DAV3 Dr CGIC Reason');
