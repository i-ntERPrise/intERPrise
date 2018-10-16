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
CREATE TABLE USECON001 (
    CONUSE002 CHAR(10) NOT NULL DEFAULT '' ,
    CONPRO001 CHAR(10) NOT NULL DEFAULT '' ,
    CONTYP002 CHAR(1) NOT NULL DEFAULT '' ,
    CONPAS001 CHAR(20) NOT NULL DEFAULT '' ,
    COIN1001 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT USECON001R;
LABEL ON TABLE USECON001 IS 'User Control';
LABEL ON COLUMN USECON001 (
    CONUSE002    IS 'Control             User',
    CONPRO001    IS 'Control             Program',
    CONTYP002    IS 'Control             Type',
    CONPAS001    IS 'Control Password',
    COIN1001     IS 'Control             Ind 1');
LABEL ON COLUMN USECON001 (
    CONUSE002    TEXT IS 'Control User',
    CONPRO001    TEXT IS 'Control Program',
    CONTYP002    TEXT IS 'Control Type',
    CONPAS001    TEXT IS 'Control Password',
    COIN1001     TEXT IS 'Control Ind 1');
