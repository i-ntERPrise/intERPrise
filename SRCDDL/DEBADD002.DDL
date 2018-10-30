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
CREATE TABLE DEBADD002 (
    S1039 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSAC005 CHAR(11) NOT NULL DEFAULT '' ,
    DEMEDE005 CHAR(40) NOT NULL DEFAULT '' ,
    AAVS1010 CHAR(11) NOT NULL DEFAULT '' ,
    DEDEDE003 CHAR(40) NOT NULL DEFAULT '' ,
    REPRES006 CHAR(11) NOT NULL DEFAULT '' ,
    REPDES009 CHAR(40) NOT NULL DEFAULT '' ,
    REPDES010 CHAR(10) NOT NULL DEFAULT '' ,
    DEADTE001 CHAR(15) NOT NULL DEFAULT '' ,
    DETRTA001 CHAR(15) NOT NULL DEFAULT '' ,
    DEADBR001 CHAR(10) NOT NULL DEFAULT '' ,
    DAVS1011 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1005 CHAR(11) NOT NULL DEFAULT '' ,
    DEADLI001 CHAR(40) NOT NULL DEFAULT '' ,
    DEADDE001 CHAR(3) NOT NULL DEFAULT '' )
    RCDFMT DEBADD002R;
LABEL ON TABLE DEBADD002 IS 'Debtor Address';
LABEL ON COLUMN DEBADD002 (
    S1039        IS 'S1',
    DEMSAC005    IS 'Account',
    DEMEDE005    IS 'Description',
    AAVS1010     IS '',
    DEDEDE003    IS 'Description',
    REPRES006    IS 'Rep',
    REPDES009    IS 'Description',
    REPDES010    IS 'Desc',
    DEADTE001    IS 'Telephone',
    DETRTA001    IS 'Tax Ref',
    DEADBR001    IS 'Branch Ref',
    DAVS1011     IS 'DAV                 S1',
    DAS1005      IS 'DA                  S1',
    DEADLI001    IS 'Debtor Address      Line 4',
    DEADDE001    IS 'Debtor Addr         Deliv Route');
LABEL ON COLUMN DEBADD002 (
    S1039        TEXT IS 'S1',
    DEMSAC005    TEXT IS 'Debtor Mst Account',
    DEMEDE005    TEXT IS 'Del Method Descriptn',
    AAVS1010     TEXT IS 'AAV S1',
    DEDEDE003    TEXT IS 'Debtor Del/Area Descriptn',
    REPRES006    TEXT IS 'Representative',
    REPDES009    TEXT IS 'Rep Description',
    REPDES010    TEXT IS 'Rep Desc',
    DEADTE001    TEXT IS 'Debtor Address Telephone',
    DETRTA001    TEXT IS 'Debtor Trn Tax Ref',
    DEADBR001    TEXT IS 'Debtor Address Branch Ref',
    DAVS1011     TEXT IS 'DAV S1',
    DAS1005      TEXT IS 'DA S1',
    DEADLI001    TEXT IS 'Debtor Address Line 4',
    DEADDE001    TEXT IS 'Debtor Addr Deliv Route');
