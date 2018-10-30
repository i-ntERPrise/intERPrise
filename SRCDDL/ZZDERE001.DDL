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
CREATE TABLE ZZDERE001 (
    DEMSAC066 CHAR(11) NOT NULL DEFAULT '' ,
    DARACC003 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1089 CHAR(11) NOT NULL DEFAULT '' ,
    DARS1003 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSAC067 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1090 CHAR(11) NOT NULL DEFAULT '' ,
    KEYKEY001 CHAR(3) NOT NULL DEFAULT '' ,
    DEMSAC068 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1091 CHAR(11) NOT NULL DEFAULT '' ,
    INTSAL007 CHAR(3) NOT NULL DEFAULT '' )
    RCDFMT ZZDERE001R;
LABEL ON TABLE ZZDERE001 IS 'ZZ Debtor Related';
LABEL ON COLUMN ZZDERE001 (
    DEMSAC066    IS 'Account',
    DARACC003    IS 'Related             Account',
    DAS1089      IS 'DA                  S1',
    DARS1003     IS 'DA-Rlt S1',
    DEMSAC067    IS 'Account',
    DAS1090      IS 'DA                  S1',
    KEYKEY001    IS 'Key/Non             Key',
    DEMSAC068    IS 'Account',
    DAS1091      IS 'DA                  S1',
    INTSAL007    IS 'Internal            Salesman');
LABEL ON COLUMN ZZDERE001 (
    DEMSAC066    TEXT IS 'Debtor Mst Account',
    DARACC003    TEXT IS 'DA-Related Account',
    DAS1089      TEXT IS 'DA S1',
    DARS1003     TEXT IS 'DA-Rlt S1',
    DEMSAC067    TEXT IS 'Debtor Mst Account',
    DAS1090      TEXT IS 'DA S1',
    KEYKEY001    TEXT IS 'Key/Non Key',
    DEMSAC068    TEXT IS 'Debtor Mst Account',
    DAS1091      TEXT IS 'DA S1',
    INTSAL007    TEXT IS 'Internal Salesman');
