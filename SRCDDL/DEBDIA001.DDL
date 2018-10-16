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
CREATE TABLE DEBDIA001 (
    DEMSAC043 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1063 CHAR(11) NOT NULL DEFAULT '' ,
    DRDIEN001 CHAR(10) NOT NULL DEFAULT '' ,
    DRDIFO001 CHAR(10) NOT NULL DEFAULT '' ,
    DRDIST001 CHAR(1) NOT NULL DEFAULT '' ,
    DRDIFO002 CHAR(1) NOT NULL DEFAULT '' ,
    DRDIEN002 CHAR(10) NOT NULL DEFAULT '' ,
    RCDFMT DEBDIA001R;
LABEL ON TABLE DEBDIA001 IS 'Debtor Diary';
LABEL ON COLUMN DEBDIA001 (
    DEMSAC043    IS 'Account',
    DAS1063      IS 'DA                  S1',
    DRDIEN001    IS 'Dr Diary            Entry Date',
    DRDIFO001    IS 'Dr Diary            FollowUp Date',
    DRDIST001    IS 'Dr Diary            Status',
    DRDIFO002    IS 'Dr Diary            FollowUp Status',
    DRDIEN002    IS 'Dr Diary Entry      User Crt');
LABEL ON COLUMN DEBDIA001 (
    DEMSAC043    TEXT IS 'Debtor Mst Account',
    DAS1063      TEXT IS 'DA S1',
    DRDIEN001    TEXT IS 'Dr Diary Entry Date',
    DRDIFO001    TEXT IS 'Dr Diary FollowUp Date',
    DRDIST001    TEXT IS 'Dr Diary Status',
    DRDIFO002    TEXT IS 'Dr Diary FollowUp Status',
    DRDIEN002    TEXT IS 'Dr Diary Entry User Crt');
