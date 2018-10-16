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
CREATE TABLE DETRSO002 (
    S1049 CHAR(11) NOT NULL DEFAULT '' ,
    DETRSO003 CHAR(3) NOT NULL DEFAULT '' ,
    DAVS1017 CHAR(11) NOT NULL DEFAULT '' ,
    S1050 CHAR(11) NOT NULL DEFAULT '' ,
    DETRTY004 CHAR(1) NOT NULL DEFAULT '' ,
    DAVS1018 CHAR(11) NOT NULL DEFAULT '' ,
    DETRTY005 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT DETRSO002R;
LABEL ON TABLE DETRSO002 IS 'Debtor Trn Source';
LABEL ON COLUMN DETRSO002 (
    S1049        IS 'S1',
    DETRSO003    IS 'Src',
    DAVS1017     IS 'DAV                 S1',
    S1050        IS 'S1',
    DETRTY004    IS 'Sub-Type',
    DAVS1018     IS 'DAV                 S1',
    DETRTY005    IS 'Entry');
LABEL ON COLUMN DETRSO002 (
    S1049        TEXT IS 'S1',
    DETRSO003    TEXT IS 'Debtor Trn Source',
    DAVS1017     TEXT IS 'DAV S1',
    S1050        TEXT IS 'S1',
    DETRTY004    TEXT IS 'Debtor Trn Type Sub-Type',
    DAVS1018     TEXT IS 'DAV S1',
    DETRTY005    TEXT IS 'Debtor Trn Type Entry');
