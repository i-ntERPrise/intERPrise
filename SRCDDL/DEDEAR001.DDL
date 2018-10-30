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
CREATE TABLE DEDEAR001 (
    S1032 CHAR(11) NOT NULL DEFAULT '' ,
    DEDEDE002 CHAR(40) NOT NULL DEFAULT '' ,
    REPRES003 CHAR(11) NOT NULL DEFAULT '' ,
    REPDES005 CHAR(40) NOT NULL DEFAULT '' ,
    REPDES006 CHAR(10) NOT NULL DEFAULT '' ,
    DAVS1005 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT DEDEAR001R;
LABEL ON TABLE DEDEAR001 IS 'Debtor Delivery Area';
LABEL ON COLUMN DEDEAR001 (
    S1032        IS 'S1',
    DEDEDE002    IS 'Description',
    REPRES003    IS 'Rep',
    REPDES005    IS 'Description',
    REPDES006    IS 'Desc',
    DAVS1005     IS 'DAV                 S1');
LABEL ON COLUMN DEDEAR001 (
    S1032        TEXT IS 'S1',
    DEDEDE002    TEXT IS 'Debtor Del/Area Descriptn',
    REPRES003    TEXT IS 'Representative',
    REPDES005    TEXT IS 'Rep Description',
    REPDES006    TEXT IS 'Rep Desc',
    DAVS1005     TEXT IS 'DAV S1');
