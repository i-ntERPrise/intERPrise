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
CREATE TABLE CREGRO001 (
    FCVS1021 CHAR(11) NOT NULL DEFAULT '' ,
    CRGR1003 CHAR(2) NOT NULL DEFAULT '' ,
    CRGR2003 CHAR(2) NOT NULL DEFAULT '' ,
    CRGR3003 CHAR(2) NOT NULL DEFAULT '' ,
    CRGR4003 CHAR(2) NOT NULL DEFAULT '' ,
    CRGR5003 CHAR(2) NOT NULL DEFAULT '' ,
    CRGR6003 CHAR(2) NOT NULL DEFAULT '' ,
    CRGRDE002 CHAR(10) NOT NULL DEFAULT '' )
    RCDFMT CREGRO001R;
LABEL ON TABLE CREGRO001 IS 'Creditor Group';
LABEL ON COLUMN CREGRO001 (
    FCVS1021     IS 'FCV                 S1',
    CRGR1003     IS 'G',
    CRGR2003     IS 'r',
    CRGR3003     IS 'o',
    CRGR4003     IS 'u',
    CRGR5003     IS 'p',
    CRGR6003     IS '',
    CRGRDE002    IS 'Desc');
LABEL ON COLUMN CREGRO001 (
    FCVS1021     TEXT IS 'FCV S1',
    CRGR1003     TEXT IS 'Cr Grp 1',
    CRGR2003     TEXT IS 'Cr Grp 2',
    CRGR3003     TEXT IS 'Cr Grp 3',
    CRGR4003     TEXT IS 'Cr Grp 4',
    CRGR5003     TEXT IS 'Cr Grp 5',
    CRGR6003     TEXT IS 'Cr Grp 6',
    CRGRDE002    TEXT IS 'Cr Grp Desc');
