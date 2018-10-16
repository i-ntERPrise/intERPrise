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
CREATE TABLE USEACC001 (
    MENID004 CHAR(10) NOT NULL DEFAULT '' ,
    OPTION004 CHAR(2) NOT NULL DEFAULT '' ,
    DESCRI004 CHAR(40) NOT NULL DEFAULT '' ,
    PROXF002 CHAR(10) NOT NULL DEFAULT '' ,
    TYPE002 CHAR(1) NOT NULL DEFAULT '' ,
    PROGRA003 CHAR(10) NOT NULL DEFAULT '' ,
    USEID003 CHAR(8) NOT NULL DEFAULT '' ,
    SUBSYS002 CHAR(10) NOT NULL DEFAULT '' ,
    ALLGOT002 CHAR(1) NOT NULL DEFAULT '' ,
    DISSEQ002 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    ALMEED002 CHAR(1) NOT NULL DEFAULT '' ,
    USESTS002 CHAR(1) NOT NULL DEFAULT '' ,
    USSELE003 CHAR(1) NOT NULL DEFAULT '' ,
    MENLEV001 DECIMAL(5,0) NOT NULL DEFAULT 0 ,
    MEIDHD001 CHAR(10) NOT NULL DEFAULT '' ,
    DISEHD001 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    RCDFMT USEACC001R;
LABEL ON TABLE USEACC001 IS 'User/Menu Access';
LABEL ON COLUMN USEACC001 (
    MENID004     IS 'Menu                Id',
    OPTION004    IS 'Option',
    DESCRI004    IS 'Description',
    PROXF002     IS 'Program XF',
    TYPE002      IS 'Type',
    PROGRA003    IS 'Program/Par',
    USEID003     IS 'User                Id',
    SUBSYS002    IS 'Subsys',
    ALLGOT002    IS 'Allow               GoTo',
    DISSEQ002    IS 'Seq#',
    ALMEED002    IS 'Allow               Menu Edit',
    USESTS002    IS 'User                Sts',
    USSELE003    IS 'User Security       Level',
    MENLEV001    IS 'Menu                Level',
    MEIDHD001    IS 'Menu                Id Hdr',
    DISEHD001    IS 'Display             Seq # Hdr');
LABEL ON COLUMN USEACC001 (
    MENID004     TEXT IS 'Menu Id',
    OPTION004    TEXT IS 'Option',
    DESCRI004    TEXT IS 'Description',
    PROXF002     TEXT IS 'Program XF',
    TYPE002      TEXT IS 'Type',
    PROGRA003    TEXT IS 'Program/Par',
    USEID003     TEXT IS 'User Id',
    SUBSYS002    TEXT IS 'Subsys',
    ALLGOT002    TEXT IS 'Allow GoTo',
    DISSEQ002    TEXT IS 'Display Seq #',
    ALMEED002    TEXT IS 'Allow Menu Edit',
    USESTS002    TEXT IS 'User Sts',
    USSELE003    TEXT IS 'User Security Level',
    MENLEV001    TEXT IS 'Menu Level',
    MEIDHD001    TEXT IS 'Menu Id Hdr',
    DISEHD001    TEXT IS 'Display Seq # Hdr');
