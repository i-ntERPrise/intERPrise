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
CREATE TABLE DEBGRO001 (
    S1052 CHAR(11) NOT NULL DEFAULT '' ,
    DEGR2003 CHAR(2) NOT NULL DEFAULT '' ,
    SAVS1030 CHAR(11) NOT NULL DEFAULT '' ,
    DAVS1019 CHAR(11) NOT NULL DEFAULT '' ,
    RCDFMT DEBGRO001R;
LABEL ON TABLE DEBGRO001 IS 'Debtor Group';
LABEL ON COLUMN DEBGRO001 (
    S1052        IS 'S1',
    DEGR2003     IS 'Grp                  2',
    SAVS1030     IS 'SAV                 S1',
    DAVS1019     IS 'DAV                 S1');
LABEL ON COLUMN DEBGRO001 (
    S1052        TEXT IS 'S1',
    DEGR2003     TEXT IS 'Debtor Group 2',
    SAVS1030     TEXT IS 'SAV S1',
    DAVS1019     TEXT IS 'DAV S1');
