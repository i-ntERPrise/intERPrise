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
CREATE TABLE STKUSE001 (
    S1012 CHAR(11) NOT NULL DEFAULT '' ,
    STKPRO010 CHAR(20) NOT NULL DEFAULT '' ,
    STSBBI004 CHAR(10) NOT NULL DEFAULT '' ,
    SBS1004 CHAR(11) NOT NULL DEFAULT '' ,
    STBAPR005 CHAR(20) NOT NULL DEFAULT '' )
    RCDFMT STKUSE001R;
LABEL ON TABLE STKUSE001 IS 'Stk User';
LABEL ON COLUMN STKUSE001 (
    S1012        IS 'S1',
    STKPRO010    IS 'Product',
    STSBBI004    IS 'Bin Locatn',
    SBS1004      IS '',
    STBAPR005    IS 'Product');
LABEL ON COLUMN STKUSE001 (
    S1012        TEXT IS 'S1',
    STKPRO010    TEXT IS 'Stk Product',
    STSBBI004    TEXT IS 'Stk S/B Bin Location',
    SBS1004      TEXT IS 'SB S1',
    STBAPR005    TEXT IS 'Stk Bal Product');
