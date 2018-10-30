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
CREATE TABLE ZZDEDE001 (
    DEMSAC058 CHAR(11) NOT NULL DEFAULT '' ,
    DEDEAR005 CHAR(3) NOT NULL DEFAULT '' ,
    DEBADD006 CHAR(10) NOT NULL DEFAULT '' ,
    DAS1083 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT ZZDEDE001R;
LABEL ON TABLE ZZDEDE001 IS 'ZZ Debtor Delivery Area';
LABEL ON COLUMN ZZDEDE001 (
    DEMSAC058    IS 'Account',
    DEDEAR005    IS 'Del                 Area',
    DEBADD006    IS 'Addr',
    DAS1083      IS 'DA                  S1');
LABEL ON COLUMN ZZDEDE001 (
    DEMSAC058    TEXT IS 'Debtor Mst Account',
    DEDEAR005    TEXT IS 'Debtor Delivery Area',
    DEBADD006    TEXT IS 'Debtor Address',
    DAS1083      TEXT IS 'DA S1');
