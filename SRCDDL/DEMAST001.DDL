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
CREATE TABLE DEMAST001 (
    DEMSAC077 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1100 CHAR(11) NOT NULL DEFAULT '' ,
    DEMAST002 CHAR(2) NOT NULL DEFAULT '' )
    RCDFMT DEMAST001R;
LABEL ON TABLE DEMAST001 IS 'Debtor Master Stk Group';
LABEL ON COLUMN DEMAST001 (
    DEMSAC077    IS 'Account',
    DAS1100      IS 'DA                  S1',
    DEMAST002    IS 'Debtor Master       StkGrp 01');
LABEL ON COLUMN DEMAST001 (
    DEMSAC077    TEXT IS 'Debtor Mst Account',
    DAS1100      TEXT IS 'DA S1',
    DEMAST002    TEXT IS 'Debtor Master StkGrp 01');
