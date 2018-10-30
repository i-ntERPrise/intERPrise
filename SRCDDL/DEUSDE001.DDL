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
CREATE TABLE DEUSDE001 (
    REPRES015 CHAR(11) NOT NULL DEFAULT '' ,
    DAVS1053 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1072 CHAR(11) NOT NULL DEFAULT '' ,
    INTSAL006 CHAR(3) NOT NULL DEFAULT '' ,
    USEPRO001 CHAR(10) NOT NULL DEFAULT '' ,
    SALTYP001 CHAR(1) NOT NULL DEFAULT '' ,
    SATRTY001 CHAR(1) NOT NULL DEFAULT '' ,
    DISOVE001 CHAR(1) NOT NULL DEFAULT '' ,
    OPERAT001 CHAR(1) NOT NULL DEFAULT '' )
    RCDFMT DEUSDE001R;
LABEL ON TABLE DEUSDE001 IS 'DE User Default';
LABEL ON COLUMN DEUSDE001 (
    REPRES015    IS 'Rep',
    DAVS1053     IS 'DAV                 S1',
    DAS1072      IS 'DA                  S1',
    INTSAL006    IS 'Internal            Salesman',
    USEPRO001    IS 'User                Profile',
    SALTYP001    IS 'Sales               Type',
    SATRTY001    IS 'Sales               Trn Type',
    DISOVE001    IS 'Discount            Override',
    OPERAT001    IS 'Operator/Manager');
LABEL ON COLUMN DEUSDE001 (
    REPRES015    TEXT IS 'Representative',
    DAVS1053     TEXT IS 'DAV S1',
    DAS1072      TEXT IS 'DA S1',
    INTSAL006    TEXT IS 'Internal Salesman',
    USEPRO001    TEXT IS 'User Profile',
    SALTYP001    TEXT IS 'Sales Type',
    SATRTY001    TEXT IS 'Sales Trn Type',
    DISOVE001    TEXT IS 'Discount Override',
    OPERAT001    TEXT IS 'Operator/Manager');
