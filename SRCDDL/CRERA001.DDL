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
CREATE TABLE CRERA001 (
    FCDS1034 CHAR(11) NOT NULL DEFAULT '' ,
    AAVS1027 CHAR(11) NOT NULL DEFAULT '' ,
    BANK013 DECIMAL(9,0) NOT NULL DEFAULT 0 ,
    CRECLA006 CHAR(3) NOT NULL DEFAULT '' ,
    CRPMDA004 CHAR(1) NOT NULL DEFAULT '' ,
    CRSTDD004 DECIMAL(2,0) NOT NULL DEFAULT 0 ,
    CREDIT031 CHAR(11) NOT NULL DEFAULT '' ,
    CRENAM005 CHAR(40) NOT NULL DEFAULT '' ,
    CRTER008 CHAR(3) NOT NULL DEFAULT '' ,
    FCVS1022 CHAR(11) NOT NULL DEFAULT '' ,
    CRCHPR004 CHAR(1) NOT NULL DEFAULT '' ,
    CRTAX004 CHAR(1) NOT NULL DEFAULT '' ,
    CRMSST005 CHAR(1) NOT NULL DEFAULT '' ,
    CBTRTY017 CHAR(3) NOT NULL DEFAULT '' ,
    CBTRRE005 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CBCHDA002 CHAR(10) NOT NULL DEFAULT '' ,
    CBCHAM002 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    CREDES003 CHAR(10) NOT NULL DEFAULT '' ,
    CRMSTY003 CHAR(1) NOT NULL DEFAULT '' ,
    CRBAAC002 DECIMAL(15,0) NOT NULL DEFAULT 0 ,
    CRBATY002 CHAR(1) NOT NULL DEFAULT '' ,
    CRRAAU003 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CRRANO001 DECIMAL(5,0) NOT NULL DEFAULT 0 )
    RCDFMT CRERA001R;
LABEL ON TABLE CRERA001 IS 'Creditor RA';
LABEL ON COLUMN CRERA001 (
    FCDS1034     IS 'FC/DA S1',
    AAVS1027     IS '',
    BANK013      IS 'Bank',
    CRECLA006    IS 'Cr                  Class',
    CRPMDA004    IS 'Date                Type',
    CRSTDD004    IS 'Statement           DD',
    CREDIT031    IS 'Creditor/Debtor',
    CRENAM005    IS 'Creditor Name',
    CRTER008     IS 'Terms',
    FCVS1022     IS 'FCV                 S1',
    CRCHPR004    IS 'Cheques             Printed',
    CRTAX004     IS 'Taxable',
    CRMSST005    IS 'Sts',
    CBTRTY017    IS 'CB Trn              Type',
    CBTRRE005    IS 'CB Trn              Refer',
    CBCHDA002    IS 'CB Chq              Date',
    CBCHAM002    IS 'CB Chq Amt',
    CREDES003    IS 'Desc',
    CRMSTY003    IS 'Typ',
    CRBAAC002    IS 'Bank A/c',
    CRBATY002    IS 'Typ',
    CRRAAU003    IS 'Cr RA               Audit Ref',
    CRRANO001    IS 'Cr RA No            of Pages');
LABEL ON COLUMN CRERA001 (
    FCDS1034     TEXT IS 'FC/DA S1',
    AAVS1027     TEXT IS 'AAV S1',
    BANK013      TEXT IS 'Bank',
    CRECLA006    TEXT IS 'Creditor Class',
    CRPMDA004    TEXT IS 'Creditor Pmt Date Type',
    CRSTDD004    TEXT IS 'Cr Statement DD',
    CREDIT031    TEXT IS 'Creditor/Debtor',
    CRENAM005    TEXT IS 'Creditor Name',
    CRTER008     TEXT IS 'Cr Terms',
    FCVS1022     TEXT IS 'FCV S1',
    CRCHPR004    TEXT IS 'Cr Cheques Printed',
    CRTAX004     TEXT IS 'Cr Taxable',
    CRMSST005    TEXT IS 'Cr Mst Sts',
    CBTRTY017    TEXT IS 'CB Trn Type',
    CBTRRE005    TEXT IS 'CB Trn Refer',
    CBCHDA002    TEXT IS 'CB Chq Date',
    CBCHAM002    TEXT IS 'CB Chq Amt',
    CREDES003    TEXT IS 'Creditor Desc',
    CRMSTY003    TEXT IS 'Cr Mst Type',
    CRBAAC002    TEXT IS 'Cr Bank A/c',
    CRBATY002    TEXT IS 'Cr Bank Type',
    CRRAAU003    TEXT IS 'Cr RA Audit Ref',
    CRRANO001    TEXT IS 'Cr RA No of Pages');
