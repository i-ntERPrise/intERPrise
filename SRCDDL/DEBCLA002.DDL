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
CREATE TABLE DEBCLA002 (
    S1042 CHAR(11) NOT NULL DEFAULT '' ,
    DEBCLA003 CHAR(3) NOT NULL DEFAULT '' ,
    DAVS1013 CHAR(11) NOT NULL DEFAULT '' ,
    DRCLCT001 CHAR(11) NOT NULL DEFAULT '' ,
    RCDFMT DEBCLA002R;
LABEL ON TABLE DEBCLA002 IS 'Debtor Class';
LABEL ON COLUMN DEBCLA002 (
    S1042        IS 'S1',
    DEBCLA003    IS 'Cls',
    DAVS1013     IS 'DAV                 S1',
    DRCLCT001    IS 'Dr Cls Ctl          Nominal A/c');
LABEL ON COLUMN DEBCLA002 (
    S1042        TEXT IS 'S1',
    DEBCLA003    TEXT IS 'Debtor Class',
    DAVS1013     TEXT IS 'DAV S1',
    DRCLCT001    TEXT IS 'Dr Cls Ctl Nominal A/c');
