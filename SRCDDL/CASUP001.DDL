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
CREATE TABLE CASUP001 (
    OAS1057 CHAR(11) NOT NULL DEFAULT '' ,
    CAUPOR001 NUMERIC(11,0) NOT NULL DEFAULT 0 ,
    CAUPTY001 CHAR(1) NOT NULL DEFAULT '' ,
    CAUPDA001 CHAR(10) NOT NULL DEFAULT '' ,
    CAUPUS001 CHAR(10) NOT NULL DEFAULT '' ,
    CAUPCA001 DECIMAL(11,2) NOT NULL DEFAULT 0 ,
    CAUPCH001 DECIMAL(11,2) NOT NULL DEFAULT 0 ,
    CAUPSP001 DECIMAL(11,2) NOT NULL DEFAULT 0 ,
    CAUPDI001 DECIMAL(11,2) NOT NULL DEFAULT 0 ,
    CAUPCH002 CHAR(40) NOT NULL DEFAULT '' ,
    CAUPSP002 CHAR(40) NOT NULL DEFAULT '' ,
    CAUPDA002 CHAR(11) NOT NULL DEFAULT '' ,
    CAUPDE001 CHAR(11) NOT NULL DEFAULT '' ,
    CAUPTI001 CHAR(26) NOT NULL DEFAULT '' ,
    CAUPIN001 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CAUPDE002 CHAR(40) NOT NULL DEFAULT '' ,
    CAUPNA001 CHAR(40) NOT NULL DEFAULT '' ,
    CAUPRE001 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CAUPDA003 CHAR(1) NOT NULL DEFAULT '' ,
    CAUPRE002 DECIMAL(9,0) NOT NULL DEFAULT 0 ,
    CAUPOR002 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CAUPCO001 CHAR(40) NOT NULL DEFAULT '' ,
    CAUPAD001 CHAR(40) NOT NULL DEFAULT '' ,
    CAUPCH003 DECIMAL(11,2) NOT NULL DEFAULT 0 ,
    RCDFMT CASUP001R;
LABEL ON TABLE CASUP001 IS 'Cash Up';
LABEL ON COLUMN CASUP001 (
    OAS1057      IS 'OA                  S1',
    CAUPOR001    IS 'Cash Up             Order Number',
    CAUPTY001    IS 'Cash                Up Type',
    CAUPDA001    IS 'Cash                Up Date',
    CAUPUS001    IS 'Cash                Up User',
    CAUPCA001    IS 'Cash                Up Cash',
    CAUPCH001    IS 'Cash Up             Cheque',
    CAUPSP001    IS 'Cash Up             Speedpoint',
    CAUPDI001    IS 'Cash Up             Direct Deposit',
    CAUPCH002    IS 'Cash Up Cheque Ref',
    CAUPSP002    IS 'Cash Up             Speedpoint Ref',
    CAUPDA002    IS 'Cash Up DA          Structure',
    CAUPDE001    IS 'Cash Up             Debtor Code',
    CAUPTI001    IS 'Cash Up Timestamp',
    CAUPIN001    IS 'Cash Up             Invoice Number',
    CAUPDE002    IS 'Cash Up Deposit Ref',
    CAUPNA001    IS 'Cash Up Name',
    CAUPRE001    IS 'Cash Up             Receipt Number',
    CAUPDA003    IS 'Cash Up             Dayend Sts',
    CAUPRE002    IS 'Cash Up             Reference',
    CAUPOR002    IS 'Cash Up             Original Invoice',
    CAUPCO001    IS 'Cash Up             Contact Number',
    CAUPAD001    IS 'Cash Up Address 01',
    CAUPCH003    IS 'Cash Up             Change');
LABEL ON COLUMN CASUP001 (
    OAS1057      TEXT IS 'OA S1',
    CAUPOR001    TEXT IS 'Cash Up Order Number',
    CAUPTY001    TEXT IS 'Cash Up Type',
    CAUPDA001    TEXT IS 'Cash Up Date',
    CAUPUS001    TEXT IS 'Cash Up User',
    CAUPCA001    TEXT IS 'Cash Up Cash',
    CAUPCH001    TEXT IS 'Cash Up Cheque',
    CAUPSP001    TEXT IS 'Cash Up Speedpoint',
    CAUPDI001    TEXT IS 'Cash Up Direct Deposit',
    CAUPCH002    TEXT IS 'Cash Up Cheque Ref',
    CAUPSP002    TEXT IS 'Cash Up Speedpoint Ref',
    CAUPDA002    TEXT IS 'Cash Up DA Structure',
    CAUPDE001    TEXT IS 'Cash Up Debtor Code',
    CAUPTI001    TEXT IS 'Cash Up Timestamp',
    CAUPIN001    TEXT IS 'Cash Up Invoice Number',
    CAUPDE002    TEXT IS 'Cash Up Deposit Ref',
    CAUPNA001    TEXT IS 'Cash Up Name',
    CAUPRE001    TEXT IS 'Cash Up Receipt Number',
    CAUPDA003    TEXT IS 'Cash Up Dayend Sts',
    CAUPRE002    TEXT IS 'Cash Up Reference',
    CAUPOR002    TEXT IS 'Cash Up Original Invoice',
    CAUPCO001    TEXT IS 'Cash Up Contact Number',
    CAUPAD001    TEXT IS 'Cash Up Address 01',
    CAUPCH003    TEXT IS 'Cash Up Change');
