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
CREATE TABLE DEUSNO001 (
    S1044 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSAC008 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1007 CHAR(11) NOT NULL DEFAULT '' ,
    DRUSNO001 DECIMAL(7,3) NOT NULL DEFAULT 0 ,
    DRUSCO001 CHAR(10) NOT NULL DEFAULT '' ,
    DRUSDA001 CHAR(10) NOT NULL DEFAULT '' ,
    DRUSUS001 CHAR(10) NOT NULL DEFAULT '' ,
    DRUSTI001 CHAR(26) NOT NULL DEFAULT '' )
    RCDFMT DEUSNO001R;
LABEL ON TABLE DEUSNO001 IS 'Debtor User Notes';
LABEL ON COLUMN DEUSNO001 (
    S1044        IS 'S1',
    DEMSAC008    IS 'Account',
    DAS1007      IS 'DA                  S1',
    DRUSNO001    IS 'Dr Usr              Notes Seq',
    DRUSCO001    IS 'Dr Usr              Code',
    DRUSDA001    IS 'Dr Usr              Date',
    DRUSUS001    IS 'Dr Usr              User',
    DRUSTI001    IS 'Dr Usr Timestamp');
LABEL ON COLUMN DEUSNO001 (
    S1044        TEXT IS 'S1',
    DEMSAC008    TEXT IS 'Debtor Mst Account',
    DAS1007      TEXT IS 'DA S1',
    DRUSNO001    TEXT IS 'Dr Usr Notes Seq',
    DRUSCO001    TEXT IS 'Dr Usr Code',
    DRUSDA001    TEXT IS 'Dr Usr Date',
    DRUSUS001    TEXT IS 'Dr Usr User',
    DRUSTI001    TEXT IS 'Dr Usr Timestamp');
