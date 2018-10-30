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
CREATE TABLE MEDEBA001 (
    DAS1049 CHAR(11) NOT NULL DEFAULT '' ,
    MEDRBA001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    MEDRSA001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    MEDRPA001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    MEDROT001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    MEDRDI001 DECIMAL(11,2) NOT NULL DEFAULT 0 ,
    MEDRCG001 CHAR(1) NOT NULL DEFAULT '' )
    RCDFMT MEDEBA001R;
LABEL ON TABLE MEDEBA001 IS 'ME Debtor Balance';
LABEL ON COLUMN MEDEBA001 (
    DAS1049      IS 'DA                  S1',
    MEDRBA001    IS 'ME Dr Bal           Period',
    MEDRSA001    IS 'ME Dr Sales         Summary Amt',
    MEDRPA001    IS 'ME Dr Payment       Summary Amt',
    MEDROT001    IS 'ME Dr Other         Summary Amt',
    MEDRDI001    IS 'ME Dr Discount      Summary',
    MEDRCG001    IS 'ME Dr CGIC          Indicator');
LABEL ON COLUMN MEDEBA001 (
    DAS1049      TEXT IS 'DA S1',
    MEDRBA001    TEXT IS 'ME Dr Bal Period',
    MEDRSA001    TEXT IS 'ME Dr Sales Summary Amt',
    MEDRPA001    TEXT IS 'ME Dr Payment Summary Amt',
    MEDROT001    TEXT IS 'ME Dr Other Summary Amt',
    MEDRDI001    TEXT IS 'ME Dr Discount Summary',
    MEDRCG001    TEXT IS 'ME Dr CGIC Indicator');
