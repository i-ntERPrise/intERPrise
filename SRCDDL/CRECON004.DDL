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
CREATE TABLE CRECON004 (
    FCDS1030 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT027 CHAR(11) NOT NULL DEFAULT '' ,
    CRECON005 CHAR(40) NOT NULL DEFAULT '' ,
    CRETEL004 CHAR(15) NOT NULL DEFAULT '' ,
    CRCOID001 CHAR(15) NOT NULL DEFAULT '' )
    RCDFMT CRECON004R;
LABEL ON TABLE CRECON004 IS 'Creditor Contact';
LABEL ON COLUMN CRECON004 (
    FCDS1030     IS 'FC/DA S1',
    CREDIT027    IS 'Creditor/Debtor',
    CRECON005    IS 'Creditor            Contact',
    CRETEL004    IS 'Creditor            Telephone',
    CRCOID001    IS 'Contact ID');
LABEL ON COLUMN CRECON004 (
    FCDS1030     TEXT IS 'FC/DA S1',
    CREDIT027    TEXT IS 'Creditor/Debtor',
    CRECON005    TEXT IS 'Creditor Contact',
    CRETEL004    TEXT IS 'Creditor Telephone',
    CRCOID001    TEXT IS 'Cr Contact ID');
