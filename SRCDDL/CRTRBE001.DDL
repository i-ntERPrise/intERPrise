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
CREATE TABLE CRTRBE001 (
    FCDS1073 CHAR(11) NOT NULL DEFAULT '' ,
    CRTRSE003 DECIMAL(7,3) NOT NULL DEFAULT 0 ,
    CRBCPE006 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    CRBCRE004 NUMERIC(7,0) NOT NULL DEFAULT 0 ,
    CRTRBE002 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT CRTRBE001R;
LABEL ON TABLE CRTRBE001 IS 'Creditor Transaction BEE';
LABEL ON COLUMN CRTRBE001 (
    FCDS1073     IS 'FC/DA S1',
    CRTRSE003    IS 'Trn                 Seq No',
    CRBCPE006    IS 'Period',
    CRBCRE004    IS 'Refer',
    CRTRBE002    IS 'Creditor Trn        BEE (Y/N)');
LABEL ON COLUMN CRTRBE001 (
    FCDS1073     TEXT IS 'FC/DA S1',
    CRTRSE003    TEXT IS 'Creditor Trn Seq No',
    CRBCPE006    TEXT IS 'Cr Bch Period',
    CRBCRE004    TEXT IS 'Cr Bch Reference',
    CRTRBE002    TEXT IS 'Creditor Trn BEE (Y/N)');
