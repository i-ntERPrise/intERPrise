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
CREATE TABLE JOCAUS005 (
    SAVS1125 CHAR(11) NOT NULL DEFAULT '' ,
    JOCAUS006 CHAR(10) NOT NULL DEFAULT '' ,
    JOCARE004 CHAR(11) NOT NULL DEFAULT '' ,
    JOCATE004 CHAR(3) NOT NULL DEFAULT '' ,
    JOCABI005 CHAR(12) NOT NULL DEFAULT '' ,
    JOCAUS007 CHAR(10) NOT NULL DEFAULT '' )
    RCDFMT JOCAUS005R;
LABEL ON TABLE JOCAUS005 IS 'Job Card User';
LABEL ON COLUMN JOCAUS005 (
    SAVS1125     IS 'SAV                 S1',
    JOCAUS006    IS 'Job Card            User',
    JOCARE004    IS 'Job Card            Representative',
    JOCATE004    IS 'Job Card            Tech Code',
    JOCABI005    IS 'Job Card Bin        Location',
    JOCAUS007    IS 'Job Card            User Desc');
LABEL ON COLUMN JOCAUS005 (
    SAVS1125     TEXT IS 'SAV S1',
    JOCAUS006    TEXT IS 'Job Card User',
    JOCARE004    TEXT IS 'Job Card Representative',
    JOCATE004    TEXT IS 'Job Card Tech Code',
    JOCABI005    TEXT IS 'Job Card Bin Location',
    JOCAUS007    TEXT IS 'Job Card User Desc');
