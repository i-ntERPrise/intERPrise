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
CREATE TABLE DEBCAT002 (
    S1034 CHAR(11) NOT NULL DEFAULT '' ,
    DECATY002 CHAR(1) NOT NULL DEFAULT '' ,
    DAVS1007 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT DEBCAT002R;
LABEL ON TABLE DEBCAT002 IS 'Debtor Category';
LABEL ON COLUMN DEBCAT002 (
    S1034        IS 'S1',
    DECATY002    IS 'Typ',
    DAVS1007     IS 'DAV                 S1');
LABEL ON COLUMN DEBCAT002 (
    S1034        TEXT IS 'S1',
    DECATY002    TEXT IS 'Debtor Category Type',
    DAVS1007     TEXT IS 'DAV S1');
