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
CREATE TABLE DETRQU001 (
    S1064 CHAR(11) NOT NULL DEFAULT '' ,
    STKPRO020 CHAR(20) NOT NULL DEFAULT '' ,
    DAVS1024 CHAR(11) NOT NULL DEFAULT '' ,
    SBVS1011 CHAR(11) NOT NULL DEFAULT '' ,
    DETRQR009 CHAR(3) NOT NULL DEFAULT '' ,
    DRTRQR001 CHAR(1) NOT NULL DEFAULT '' )
    RCDFMT DETRQU001R;
LABEL ON TABLE DETRQU001 IS 'Debtor Trn Query';
LABEL ON COLUMN DETRQU001 (
    S1064        IS 'S1',
    STKPRO020    IS 'Product',
    DAVS1024     IS 'DAV                 S1',
    SBVS1011     IS 'SBV                 S1',
    DETRQR009    IS 'Debtor              Trn Qry',
    DRTRQR001    IS 'Dr Trn              Qry Rule');
LABEL ON COLUMN DETRQU001 (
    S1064        TEXT IS 'S1',
    STKPRO020    TEXT IS 'Stk Product',
    DAVS1024     TEXT IS 'DAV S1',
    SBVS1011     TEXT IS 'SBV S1',
    DETRQR009    TEXT IS 'Debtor Trn Qry',
    DRTRQR001    TEXT IS 'Dr Trn Qry Rule');
