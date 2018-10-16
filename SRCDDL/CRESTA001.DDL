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
CREATE TABLE CRESTA001 (
    FCDS1019 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT018 CHAR(11) NOT NULL DEFAULT '' ,
    CRSTIN001 CHAR(10) NOT NULL DEFAULT '' ,
    CRSTAM001 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRSTDA001 CHAR(10) NOT NULL DEFAULT '' ,
    CRSTLN001 DECIMAL(7,3) NOT NULL DEFAULT 0 ,
    CRSTIN002 CHAR(20) NOT NULL DEFAULT '' ,
    CRSTAM002 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRSTTR001 CHAR(1) NOT NULL DEFAULT '' ,
    CRSTST001 CHAR(1) NOT NULL DEFAULT '' ,
    CRSTAM003 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CRSTNA001 CHAR(40) NOT NULL DEFAULT '' ,
    CRSTTR002 CHAR(3) NOT NULL DEFAULT '' ,
    CRSTST002 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT CRESTA001R;
LABEL ON TABLE CRESTA001 IS 'Creditor Statement';
LABEL ON COLUMN CRESTA001 (
    FCDS1019     IS 'FC/DA S1',
    CREDIT018    IS 'Creditor/Debtor',
    CRSTIN001    IS 'Cr Stmnt            Inv Date',
    CRSTAM001    IS 'Cr Stmnt Amt',
    CRSTDA001    IS 'Cr Stmnt            Date',
    CRSTLN001    IS 'Cr Stmnt            Ln',
    CRSTIN002    IS 'Cr Stmnt            Invoice',
    CRSTAM002    IS 'Cr Stmnt            Amt-Trn',
    CRSTTR001    IS 'Cr Stmnt            Trn Upd',
    CRSTST001    IS 'Cr Stmnt            Sts Recon',
    CRSTAM003    IS 'Cr Stmnt            Amt-Balance',
    CRSTNA001    IS 'Cr Stmnt Narration',
    CRSTTR002    IS 'Cr Stmnt            Trn Type',
    CRSTST002    IS 'Cr Stmnt            Sts Z01');
LABEL ON COLUMN CRESTA001 (
    FCDS1019     TEXT IS 'FC/DA S1',
    CREDIT018    TEXT IS 'Creditor/Debtor',
    CRSTIN001    TEXT IS 'Cr Stmnt Inv Date',
    CRSTAM001    TEXT IS 'Cr Stmnt Amt',
    CRSTDA001    TEXT IS 'Cr Stmnt Date',
    CRSTLN001    TEXT IS 'Cr Stmnt Ln',
    CRSTIN002    TEXT IS 'Cr Stmnt Invoice',
    CRSTAM002    TEXT IS 'Cr Stmnt Amt-Trn',
    CRSTTR001    TEXT IS 'Cr Stmnt Trn Upd',
    CRSTST001    TEXT IS 'Cr Stmnt Sts Recon',
    CRSTAM003    TEXT IS 'Cr Stmnt Amt-Balance',
    CRSTNA001    TEXT IS 'Cr Stmnt Narration',
    CRSTTR002    TEXT IS 'Cr Stmnt Trn Type',
    CRSTST002    TEXT IS 'Cr Stmnt Sts Z01');
