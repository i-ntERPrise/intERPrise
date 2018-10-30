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
CREATE TABLE DEMADI001 (
    DEMSAC055 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1080 CHAR(11) NOT NULL DEFAULT '' ,
    DRMSDI001 DECIMAL(5,2) NOT NULL DEFAULT 0 )
    RCDFMT DEMADI001R;
LABEL ON TABLE DEMADI001 IS 'Debtor Master Dis Summary';
LABEL ON COLUMN DEMADI001 (
    DEMSAC055    IS 'Account',
    DAS1080      IS 'DA                  S1',
    DRMSDI001    IS 'Dr Mst Dis          Current %');
LABEL ON COLUMN DEMADI001 (
    DEMSAC055    TEXT IS 'Debtor Mst Account',
    DAS1080      TEXT IS 'DA S1',
    DRMSDI001    TEXT IS 'Dr Mst Dis Current %');
