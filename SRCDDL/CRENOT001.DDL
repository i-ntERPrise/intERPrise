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
CREATE TABLE CRENOT001 (
    FCDS1031 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT028 CHAR(11) NOT NULL DEFAULT '' ,
    CRNOSE001 DECIMAL(7,3) NOT NULL DEFAULT 0 ,
    CRNOT001 CHAR(60) NOT NULL DEFAULT '' ,
    CRNOUS001 CHAR(10) NOT NULL DEFAULT '' ,
    CRNODA001 CHAR(10) NOT NULL DEFAULT '' ,
    CRNOST001 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT CRENOT001R;
LABEL ON TABLE CRENOT001 IS 'Creditor Notes';
LABEL ON COLUMN CRENOT001 (
    FCDS1031     IS 'FC/DA S1',
    CREDIT028    IS 'Creditor/Debtor',
    CRNOSE001    IS 'Seq No',
    CRNOT001     IS 'Notes',
    CRNOUS001    IS 'Cr Notes            User',
    CRNODA001    IS 'Cr Notes            Date',
    CRNOST001    IS 'Cr Notes            Sts');
LABEL ON COLUMN CRENOT001 (
    FCDS1031     TEXT IS 'FC/DA S1',
    CREDIT028    TEXT IS 'Creditor/Debtor',
    CRNOSE001    TEXT IS 'Cr Notes Seq',
    CRNOT001     TEXT IS 'Cr Notes',
    CRNOUS001    TEXT IS 'Cr Notes User',
    CRNODA001    TEXT IS 'Cr Notes Date',
    CRNOST001    TEXT IS 'Cr Notes Sts');
