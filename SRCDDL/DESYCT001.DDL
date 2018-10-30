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
CREATE TABLE DESYCT001 (
    S1020 CHAR(11) NOT NULL DEFAULT '' ,
    DESYCT002 CHAR(60) NOT NULL DEFAULT '' ,
    DRSYCT001 CHAR(1) NOT NULL DEFAULT '' ,
    DESYCT003 CHAR(1) NOT NULL DEFAULT '' ,
    DAVS1002 CHAR(11) NOT NULL DEFAULT '' ,
    DRSYCT002 CHAR(1) NOT NULL DEFAULT '' ,
    DESYCT004 CHAR(1) NOT NULL DEFAULT '' ,
    DRSYCT003 CHAR(1) NOT NULL DEFAULT '' ,
    AUNUOF001 CHAR(1) NOT NULL DEFAULT '' ,
    DRSYCT004 CHAR(1) NOT NULL DEFAULT '' )
    RCDFMT DESYCT001R;
LABEL ON TABLE DESYCT001 IS 'Debtor Sys Ctl';
LABEL ON COLUMN DESYCT001 (
    S1020        IS 'S1',
    DESYCT002    IS 'Overdue             Message',
    DRSYCT001    IS 'Dr Sys Ctl          M-Open Item/BF',
    DESYCT003    IS 'Debtor Sys          Ctl Post',
    DAVS1002     IS 'DAV                 S1',
    DRSYCT002    IS 'Int',
    DESYCT004    IS 'Debtor Sys          Ctl O/Due Msg',
    DRSYCT003    IS 'Dr Sys              Ctl M-ABC',
    AUNUOF001    IS 'Auto Numbering      of Pay Ref',
    DRSYCT004    IS 'Dr Sys Ctl          Dupl pay Ref');
LABEL ON COLUMN DESYCT001 (
    S1020        TEXT IS 'S1',
    DESYCT002    TEXT IS 'Debtor Sys Ctl Overdue Ms',
    DRSYCT001    TEXT IS 'Dr Sys Ctl M-Open Item/BF',
    DESYCT003    TEXT IS 'Debtor Sys Ctl Post',
    DAVS1002     TEXT IS 'DAV S1',
    DRSYCT002    TEXT IS 'Dr Sys Ctl Interest Retro',
    DESYCT004    TEXT IS 'Debtor Sys Ctl O/Due Msg',
    DRSYCT003    TEXT IS 'Dr Sys Ctl M-ABC',
    AUNUOF001    TEXT IS 'Auto Numbering of Pay Ref',
    DRSYCT004    TEXT IS 'Dr Sys Ctl Dupl pay Ref');
