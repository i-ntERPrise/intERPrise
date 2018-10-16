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
CREATE TABLE DEBFIN001 (
    S1051 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSAC010 CHAR(11) NOT NULL DEFAULT '' ,
    AAVS1013 CHAR(11) NOT NULL DEFAULT '' ,
    BANK004 DECIMAL(9,0) NOT NULL DEFAULT 0 ,
    DEBFIN002 CHAR(10) NOT NULL DEFAULT '' ,
    BANDES005 CHAR(10) NOT NULL DEFAULT '' ,
    BANDES006 CHAR(40) NOT NULL DEFAULT '' ,
    BAADL1003 CHAR(40) NOT NULL DEFAULT '' ,
    DAS1010 CHAR(11) NOT NULL DEFAULT '' ,
    RCDFMT DEBFIN001R;
LABEL ON TABLE DEBFIN001 IS 'Debtor Finance';
LABEL ON COLUMN DEBFIN001 (
    S1051        IS 'S1',
    DEMSAC010    IS 'Account',
    AAVS1013     IS '',
    BANK004      IS 'Bank',
    DEBFIN002    IS 'Fin',
    BANDES005    IS 'Desc',
    BANDES006    IS 'Description',
    BAADL1003    IS 'Address',
    DAS1010      IS 'DA                  S1');
LABEL ON COLUMN DEBFIN001 (
    S1051        TEXT IS 'S1',
    DEMSAC010    TEXT IS 'Debtor Mst Account',
    AAVS1013     TEXT IS 'AAV S1',
    BANK004      TEXT IS 'Bank',
    DEBFIN002    TEXT IS 'Debtor Finance',
    BANDES005    TEXT IS 'Bank Desc',
    BANDES006    TEXT IS 'Bank Description',
    BAADL1003    TEXT IS 'Bank Address L1',
    DAS1010      TEXT IS 'DA S1');
