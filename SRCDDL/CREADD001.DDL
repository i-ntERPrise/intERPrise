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
CREATE TABLE CREADD001 (
    FCDS1029 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT026 CHAR(11) NOT NULL DEFAULT '' ,
    CRAD1004 CHAR(40) NOT NULL DEFAULT '' ,
    CRPOCO004 NUMERIC(4,0) NOT NULL DEFAULT 0 ,
    CRADD001 CHAR(10) NOT NULL DEFAULT '' ,
    RCDFMT CREADD001R;
LABEL ON TABLE CREADD001 IS 'Creditor Address';
LABEL ON COLUMN CREADD001 (
    FCDS1029     IS 'FC/DA S1',
    CREDIT026    IS 'Creditor/Debtor',
    CRAD1004     IS 'Address 1',
    CRPOCO004    IS 'Post                Code',
    CRADD001     IS 'Cr Address');
LABEL ON COLUMN CREADD001 (
    FCDS1029     TEXT IS 'FC/DA S1',
    CREDIT026    TEXT IS 'Creditor/Debtor',
    CRAD1004     TEXT IS 'Cr Address 1',
    CRPOCO004    TEXT IS 'Cr Postal Code',
    CRADD001     TEXT IS 'Cr Address');
