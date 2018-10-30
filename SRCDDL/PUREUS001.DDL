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
CREATE TABLE PUREUS001 (
    SPOS1052 CHAR(11) NOT NULL DEFAULT '' ,
    PUREUS002 CHAR(10) NOT NULL DEFAULT '' ,
    SPOS1053 CHAR(11) NOT NULL DEFAULT '' ,
    PURECO001 CHAR(3) NOT NULL DEFAULT '' ,
    SPOS1054 CHAR(11) NOT NULL DEFAULT '' ,
    REQREF012 DECIMAL(9,0) NOT NULL DEFAULT 0 ,
    REREPR010 CHAR(3) NOT NULL DEFAULT '' ,
    REQSEQ009 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    PUREAC001 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT PUREUS001R;
LABEL ON TABLE PUREUS001 IS 'Purchase Request User';
LABEL ON COLUMN PUREUS001 (
    SPOS1052     IS 'SP/OA S1',
    PUREUS002    IS 'Purch Req           User Code',
    SPOS1053     IS 'SP/OA S1',
    PURECO001    IS 'Purch Req           Code Code',
    SPOS1054     IS 'SP/OA S1',
    REQREF012    IS 'Req                 Ref',
    REREPR010    IS 'Req Ref             Prefix',
    REQSEQ009    IS 'Req                 Seq',
    PUREAC001    IS 'Purch Req           Account');
LABEL ON COLUMN PUREUS001 (
    SPOS1052     TEXT IS 'SP/OA S1',
    PUREUS002    TEXT IS 'Purch Req User Code',
    SPOS1053     TEXT IS 'SP/OA S1',
    PURECO001    TEXT IS 'Purch Req Code Code',
    SPOS1054     TEXT IS 'SP/OA S1',
    REQREF012    TEXT IS 'Req Ref',
    REREPR010    TEXT IS 'Req Ref Prefix',
    REQSEQ009    TEXT IS 'Req Seq',
    PUREAC001    TEXT IS 'Purch Req Account');
