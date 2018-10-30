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
CREATE TABLE ZZDEAC001 (
    DEMSAC071 CHAR(11) NOT NULL DEFAULT '' ,
    AACCOU001 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1093 CHAR(11) NOT NULL DEFAULT '' ,
    ASTR001 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT ZZDEAC001R;
LABEL ON TABLE ZZDEAC001 IS 'ZZ Debtor Account Update';
LABEL ON COLUMN ZZDEAC001 (
    DEMSAC071    IS 'Account',
    AACCOU001    IS '',
    DAS1093      IS 'DA                  S1',
    ASTR001      IS 'A-Str');
LABEL ON COLUMN ZZDEAC001 (
    DEMSAC071    TEXT IS 'Debtor Mst Account',
    AACCOU001    TEXT IS 'A-Account',
    DAS1093      TEXT IS 'DA S1',
    ASTR001      TEXT IS 'A-Str');
