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
CREATE TABLE DEBTER001 (
    S1041 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSAC006 CHAR(11) NOT NULL DEFAULT '' ,
    DRTEIN003 CHAR(1) NOT NULL DEFAULT '' ,
    DRTEDA004 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    DRTER002 CHAR(3) NOT NULL DEFAULT '' ,
    DRTEDE002 CHAR(10) NOT NULL DEFAULT '' ,
    DRTEIN004 CHAR(1) NOT NULL DEFAULT '' ,
    DRTEDA005 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    DAVS1012 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT DEBTER001R;
LABEL ON TABLE DEBTER001 IS 'Debtor Term';
LABEL ON COLUMN DEBTER001 (
    S1041        IS 'S1',
    DEMSAC006    IS 'Account',
    DRTEIN003    IS 'I/S',
    DRTEDA004    IS 'Days',
    DRTER002     IS 'Trm',
    DRTEDE002    IS 'Desc',
    DRTEIN004    IS 'No',
    DRTEDA005    IS 'Grace',
    DAVS1012     IS 'DAV                 S1');
LABEL ON COLUMN DEBTER001 (
    S1041        TEXT IS 'S1',
    DEMSAC006    TEXT IS 'Debtor Mst Account',
    DRTEIN003    TEXT IS 'Dr Term Inv/Stmnt',
    DRTEDA004    TEXT IS 'Dr Term Days',
    DRTER002     TEXT IS 'Dr Term',
    DRTEDE002    TEXT IS 'Dr Term Desc',
    DRTEIN004    TEXT IS 'Dr Term in Periods',
    DRTEDA005    TEXT IS 'Dr Term Days Grace',
    DAVS1012     TEXT IS 'DAV S1');
