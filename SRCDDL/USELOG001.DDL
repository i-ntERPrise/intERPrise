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
CREATE TABLE USELOG001 (
    MENID003 CHAR(10) NOT NULL DEFAULT '' ,
    OPTION003 CHAR(2) NOT NULL DEFAULT '' ,
    DESCRI003 CHAR(40) NOT NULL DEFAULT '' ,
    USEID002 CHAR(8) NOT NULL DEFAULT '' ,
    USLOTI001 CHAR(26) NOT NULL DEFAULT '' )
    RCDFMT USELOG001R;
LABEL ON TABLE USELOG001 IS 'User Log';
LABEL ON COLUMN USELOG001 (
    MENID003     IS 'Menu                Id',
    OPTION003    IS 'Option',
    DESCRI003    IS 'Description',
    USEID002     IS 'User                Id',
    USLOTI001    IS 'User Log TimeStamp');
LABEL ON COLUMN USELOG001 (
    MENID003     TEXT IS 'Menu Id',
    OPTION003    TEXT IS 'Option',
    DESCRI003    TEXT IS 'Description',
    USEID002     TEXT IS 'User Id',
    USLOTI001    TEXT IS 'User Log TimeStamp');
