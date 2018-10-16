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
CREATE TABLE CRCLRE001 (
    FCVS1025 CHAR(11) NOT NULL DEFAULT '' ,
    CRCLRE002 CHAR(3) NOT NULL DEFAULT '' ,
    CRCLDE003 CHAR(10) NOT NULL DEFAULT '' ,
    RCDFMT CRCLRE001R;
LABEL ON TABLE CRCLRE001 IS 'Creditor Claim Reason';
LABEL ON COLUMN CRCLRE001 (
    FCVS1025     IS 'FCV                 S1',
    CRCLRE002    IS 'Cr Claim            Reason Code',
    CRCLDE003    IS 'Cr Claim            Desc');
LABEL ON COLUMN CRCLRE001 (
    FCVS1025     TEXT IS 'FCV S1',
    CRCLRE002    TEXT IS 'Cr Claim Reason Code',
    CRCLDE003    TEXT IS 'Cr Claim Desc');
