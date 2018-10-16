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
CREATE TABLE DEBHIS001 (
    S1055 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSAC013 CHAR(11) NOT NULL DEFAULT '' ,
    DEGR2004 CHAR(2) NOT NULL DEFAULT '' ,
    DEHIPE001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    SAVS1033 CHAR(11) NOT NULL DEFAULT '' ,
    DAVS1022 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1013 CHAR(11) NOT NULL DEFAULT '' ,
    RCDFMT DEBHIS001R;
LABEL ON TABLE DEBHIS001 IS 'Debtor History';
LABEL ON COLUMN DEBHIS001 (
    S1055        IS 'S1',
    DEMSAC013    IS 'Account',
    DEGR2004     IS 'Grp                  2',
    DEHIPE001    IS 'History             Period',
    SAVS1033     IS 'SAV                 S1',
    DAVS1022     IS 'DAV                 S1',
    DAS1013      IS 'DA                  S1');
LABEL ON COLUMN DEBHIS001 (
    S1055        TEXT IS 'S1',
    DEMSAC013    TEXT IS 'Debtor Mst Account',
    DEGR2004     TEXT IS 'Debtor Group 2',
    DEHIPE001    TEXT IS 'Debtor History Period',
    SAVS1033     TEXT IS 'SAV S1',
    DAVS1022     TEXT IS 'DAV S1',
    DAS1013      TEXT IS 'DA S1');
