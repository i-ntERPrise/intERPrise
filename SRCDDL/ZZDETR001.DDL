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
CREATE TABLE ZZDETR001 (
    DEMSAC060 CHAR(11) NOT NULL DEFAULT '' ,
    DETRTY009 CHAR(3) NOT NULL DEFAULT '' ,
    DAS1085 CHAR(11) NOT NULL DEFAULT '' ,
    DETRTA003 CHAR(1) NOT NULL DEFAULT '' )
    RCDFMT ZZDETR001R;
LABEL ON TABLE ZZDETR001 IS 'ZZ Debtor Tran Create';
LABEL ON COLUMN ZZDETR001 (
    DEMSAC060    IS 'Account',
    DETRTY009    IS 'Trn                 Typ',
    DAS1085      IS 'DA                  S1',
    DETRTA003    IS 'Debtor Trn          Taxable');
LABEL ON COLUMN ZZDETR001 (
    DEMSAC060    TEXT IS 'Debtor Mst Account',
    DETRTY009    TEXT IS 'Debtor Trn Type',
    DAS1085      TEXT IS 'DA S1',
    DETRTA003    TEXT IS 'Debtor Trn Taxable');
