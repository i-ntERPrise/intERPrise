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
CREATE TABLE USER001 (
    MENID002 CHAR(10) NOT NULL DEFAULT '' ,
    SEQ002 CHAR(3) NOT NULL DEFAULT '' ,
    GROUP002 CHAR(20) NOT NULL DEFAULT '' ,
    OPTION002 CHAR(2) NOT NULL DEFAULT '' ,
    DESCRI002 CHAR(40) NOT NULL DEFAULT '' ,
    USEID001 CHAR(8) NOT NULL DEFAULT '' ,
    ALLGOT001 CHAR(1) NOT NULL DEFAULT '' ,
    PROSEQ001 CHAR(3) NOT NULL DEFAULT '' ,
    PRODES001 CHAR(40) NOT NULL DEFAULT '' ,
    ALMEED001 CHAR(1) NOT NULL DEFAULT '' ,
    USPAST001 CHAR(1) NOT NULL DEFAULT '' ,
    USSELE001 CHAR(1) NOT NULL DEFAULT '' ,
    USLOST001 CHAR(1) NOT NULL DEFAULT '' ,
    USSELE002 CHAR(1) NOT NULL DEFAULT '' ,
    USALUS001 CHAR(60) NOT NULL DEFAULT '' )
    RCDFMT USER001R;
LABEL ON TABLE USER001 IS 'User';
LABEL ON COLUMN USER001 (
    MENID002     IS 'Menu                Id',
    SEQ002       IS 'Seq',
    GROUP002     IS 'Group',
    OPTION002    IS 'Option',
    DESCRI002    IS 'Description',
    USEID001     IS 'User                Id',
    ALLGOT001    IS 'Allow               GoTo',
    PROSEQ001    IS 'Program             Seq',
    PRODES001    IS 'Program Description',
    ALMEED001    IS 'Allow               Menu Edit',
    USPAST001    IS 'User                Password Sts',
    USSELE001    IS 'User Security       Level',
    USLOST001    IS 'User                Logging Sts',
    USSELE002    IS 'User Security       Level2',
    USALUS001    IS 'User Alt User ID');
LABEL ON COLUMN USER001 (
    MENID002     TEXT IS 'Menu Id',
    SEQ002       TEXT IS 'Seq',
    GROUP002     TEXT IS 'Group',
    OPTION002    TEXT IS 'Option',
    DESCRI002    TEXT IS 'Description',
    USEID001     TEXT IS 'User Id',
    ALLGOT001    TEXT IS 'Allow GoTo',
    PROSEQ001    TEXT IS 'Program Seq',
    PRODES001    TEXT IS 'Program Description',
    ALMEED001    TEXT IS 'Allow Menu Edit',
    USPAST001    TEXT IS 'User Password Sts',
    USSELE001    TEXT IS 'User Security Level',
    USLOST001    TEXT IS 'User Logging Sts',
    USSELE002    TEXT IS 'User Security Level2',
    USALUS001    TEXT IS 'User Alt User ID');
