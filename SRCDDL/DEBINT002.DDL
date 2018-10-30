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
CREATE TABLE DEBINT002 (
    S1046 CHAR(11) NOT NULL DEFAULT '' ,
    DEBINT003 CHAR(3) NOT NULL DEFAULT '' ,
    DAVS1014 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT DEBINT002R;
LABEL ON TABLE DEBINT002 IS 'Debtor Interest';
LABEL ON COLUMN DEBINT002 (
    S1046        IS 'S1',
    DEBINT003    IS 'Int',
    DAVS1014     IS 'DAV                 S1');
LABEL ON COLUMN DEBINT002 (
    S1046        TEXT IS 'S1',
    DEBINT003    TEXT IS 'Debtor Interest',
    DAVS1014     TEXT IS 'DAV S1');
