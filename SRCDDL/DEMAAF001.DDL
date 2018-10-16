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
CREATE TABLE DEMAAF001 (
    DEMSAC073 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1095 CHAR(11) NOT NULL DEFAULT '' ,
    DRMSCL001 CHAR(20) NOT NULL DEFAULT '' ,
    DRMSAF006 CHAR(40) NOT NULL DEFAULT '' ,
    DEMSAC074 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1096 CHAR(11) NOT NULL DEFAULT '' ,
    DRMSCL002 NUMERIC(9,0) NOT NULL DEFAULT 0 ,
    RCDFMT DEMAAF001R;
LABEL ON TABLE DEMAAF001 IS 'Debtor Master Affiliation';
LABEL ON COLUMN DEMAAF001 (
    DEMSAC073    IS 'Account',
    DAS1095      IS 'DA                  S1',
    DRMSCL001    IS 'Dr Mst              Club',
    DRMSAF006    IS 'Dr Mst              Affiliation Desc',
    DEMSAC074    IS 'Account',
    DAS1096      IS 'DA                  S1',
    DRMSCL002    IS 'Dr Mst Club         Sequence');
LABEL ON COLUMN DEMAAF001 (
    DEMSAC073    TEXT IS 'Debtor Mst Account',
    DAS1095      TEXT IS 'DA S1',
    DRMSCL001    TEXT IS 'Dr Mst Club',
    DRMSAF006    TEXT IS 'Dr Mst Affiliation Desc',
    DEMSAC074    TEXT IS 'Debtor Mst Account',
    DAS1096      TEXT IS 'DA S1',
    DRMSCL002    TEXT IS 'Dr Mst Club Sequence');
