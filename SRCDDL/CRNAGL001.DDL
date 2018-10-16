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
CREATE TABLE CRNAGL001 (
    FCVS1023 CHAR(11) NOT NULL DEFAULT '' ,
    GLOCRE001 CHAR(11) NOT NULL DEFAULT '' ,
    GLCRDE001 CHAR(10) NOT NULL DEFAULT '' ,
    GLPRCH001 CHAR(1) NOT NULL DEFAULT '' ,
    GLCRST001 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT CRNAGL001R;
LABEL ON TABLE CRNAGL001 IS 'Creditor Name - Global';
LABEL ON COLUMN CRNAGL001 (
    FCVS1023     IS 'FCV                 S1',
    GLOCRE001    IS 'Global              Creditor',
    GLCRDE001    IS 'Global              Cr Desc',
    GLPRCH001    IS 'Global Print        Cheque (Y/N)',
    GLCRST001    IS 'Global Cr           Statement/Inv');
LABEL ON COLUMN CRNAGL001 (
    FCVS1023     TEXT IS 'FCV S1',
    GLOCRE001    TEXT IS 'Global Creditor',
    GLCRDE001    TEXT IS 'Global Cr Desc',
    GLPRCH001    TEXT IS 'Global Print Cheque (Y/N)',
    GLCRST001    TEXT IS 'Global Cr Statement/Inv');
