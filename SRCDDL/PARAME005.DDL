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
CREATE TABLE PARAME005 (
    ADESC001 CHAR(10) NOT NULL DEFAULT '' ,
    AAVS1025 CHAR(11) NOT NULL DEFAULT '' ,
    AACSTA001 CHAR(1) NOT NULL DEFAULT '' ,
    USPRCO001 CHAR(9) NOT NULL DEFAULT '' ,
    USPE01001 NUMERIC(9,0) NOT NULL DEFAULT 0 ,
    USDAFR001 CHAR(6) NOT NULL DEFAULT '' ,
    USDATO001 CHAR(6) NOT NULL DEFAULT '' ,
    USSTSU001 CHAR(3) NOT NULL DEFAULT '' ,
    USTRTY001 CHAR(3) NOT NULL DEFAULT '' ,
    USBFBR001 NUMERIC(2,0) NOT NULL DEFAULT 0 ,
    USBFAC001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    USBFSE001 NUMERIC(7,0) NOT NULL DEFAULT 0 ,
    USBFTR001 CHAR(6) NOT NULL DEFAULT '' ,
    USBFDA001 CHAR(7) NOT NULL DEFAULT '' ,
    USBFTR002 CHAR(1) NOT NULL DEFAULT '' ,
    USBFAC002 CHAR(1) NOT NULL DEFAULT '' ,
    USBFRE001 CHAR(3) NOT NULL DEFAULT '' ,
    USBFAM001 DECIMAL(9,2) NOT NULL DEFAULT 0 ,
    USBFDI001 DECIMAL(9,2) NOT NULL DEFAULT 0 ,
    USBFGS001 DECIMAL(9,2) NOT NULL DEFAULT 0 ,
    USBFNE001 DECIMAL(9,2) NOT NULL DEFAULT 0 ,
    USBFST001 DECIMAL(9,2) NOT NULL DEFAULT 0 ,
    USBFPA001 CHAR(1) NOT NULL DEFAULT '' ,
    USBFAG001 NUMERIC(1,0) NOT NULL DEFAULT 0 ,
    USBFUN001 CHAR(1) NOT NULL DEFAULT '' ,
    USBFFI001 CHAR(2) NOT NULL DEFAULT '' ,
    ACOUNT001 DECIMAL(5,0) NOT NULL DEFAULT 0 ,
    ACACNA001 CHAR(30) NOT NULL DEFAULT '' ,
    PCKNO002 CHAR(7) NOT NULL DEFAULT '' ,
    INPOQT001 CHAR(7) NOT NULL DEFAULT '' ,
    DATE8001 NUMERIC(8,0) NOT NULL DEFAULT 0 ,
    REQNUM001 CHAR(10) NOT NULL DEFAULT '' ,
    MATBRA001 CHAR(3) NOT NULL DEFAULT '' ,
    MADENO001 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    MAPAIN001 CHAR(1) NOT NULL DEFAULT '' ,
    MACUCO001 CHAR(11) NOT NULL DEFAULT '' ,
    MAVAIN001 CHAR(1) NOT NULL DEFAULT '' ,
    MATRTY001 CHAR(3) NOT NULL DEFAULT '' ,
    MAUPST001 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT PARAME005R;
LABEL ON TABLE PARAME005 IS 'Parameter-User';
LABEL ON COLUMN PARAME005 (
    ADESC001     IS 'Desc',
    AAVS1025     IS '',
    AACSTA001    IS 'A-Active            Status',
    USPRCO001    IS 'US Product          code',
    USPE01001    IS 'US Period           01 Qty',
    USDAFR001    IS 'US Date             From',
    USDATO001    IS 'US                  Date To',
    USSTSU001    IS 'US Str              Subsystem',
    USTRTY001    IS 'US Trn              Type STS',
    USBFBR001    IS 'US BF               Branch',
    USBFAC001    IS 'US BF               Account',
    USBFSE001    IS 'US BF               Seq No',
    USBFTR001    IS 'US BF               Trns Date',
    USBFDA001    IS 'US BF               Date No',
    USBFTR002    IS 'US BF               Trn Type',
    USBFAC002    IS 'US BF               Account Type',
    USBFRE001    IS 'US BF               Reference 1A',
    USBFAM001    IS 'US BF               Amount',
    USBFDI001    IS 'US BF               Discount',
    USBFGS001    IS 'US BF GST',
    USBFNE001    IS 'US BF Net           Value',
    USBFST001    IS 'US BF Stlmnt        Discount',
    USBFPA001    IS 'US BF               Paid',
    USBFAG001    IS 'US BF               Age',
    USBFUN001    IS 'US BF               Unallocated',
    USBFFI001    IS 'US BF Filler',
    ACOUNT001    IS 'A-Count',
    ACACNA001    IS 'ACB Account         Name',
    PCKNO002     IS 'PckSlp              No',
    INPOQT001    IS 'InvDtl PO           Qty Alpha',
    DATE8001     IS 'Date(8)',
    REQNUM001    IS 'Requisition         Number',
    MATBRA001    IS 'Matus               Branch',
    MADENO001    IS 'Matus               Deposit No',
    MAPAIN001    IS 'Matus Pay           Indicator',
    MACUCO001    IS 'Matus               Customer Code',
    MAVAIN001    IS 'Matus Vat           Indicator',
    MATRTY001    IS 'Matus               Trn Type',
    MAUPST001    IS 'Matus Update        Status');
LABEL ON COLUMN PARAME005 (
    ADESC001     TEXT IS 'A-Desc',
    AAVS1025     TEXT IS 'AAV S1',
    AACSTA001    TEXT IS 'A-Active Status',
    USPRCO001    TEXT IS 'US Product code',
    USPE01001    TEXT IS 'US Period 01 Qty',
    USDAFR001    TEXT IS 'US Date From',
    USDATO001    TEXT IS 'US Date To',
    USSTSU001    TEXT IS 'US Str Subsystem',
    USTRTY001    TEXT IS 'US Trn Type STS',
    USBFBR001    TEXT IS 'US BF Branch',
    USBFAC001    TEXT IS 'US BF Account',
    USBFSE001    TEXT IS 'US BF Seq No',
    USBFTR001    TEXT IS 'US BF Trns Date',
    USBFDA001    TEXT IS 'US BF Date No',
    USBFTR002    TEXT IS 'US BF Trn Type',
    USBFAC002    TEXT IS 'US BF Account Type',
    USBFRE001    TEXT IS 'US BF Reference 1A',
    USBFAM001    TEXT IS 'US BF Amount',
    USBFDI001    TEXT IS 'US BF Discount',
    USBFGS001    TEXT IS 'US BF GST',
    USBFNE001    TEXT IS 'US BF Net Value',
    USBFST001    TEXT IS 'US BF Stlmnt Discount',
    USBFPA001    TEXT IS 'US BF Paid',
    USBFAG001    TEXT IS 'US BF Age',
    USBFUN001    TEXT IS 'US BF Unallocated',
    USBFFI001    TEXT IS 'US BF Filler',
    ACOUNT001    TEXT IS 'A-Count',
    ACACNA001    TEXT IS 'ACB Account Name',
    PCKNO002     TEXT IS 'PckSlp No',
    INPOQT001    TEXT IS 'InvDtl PO Qty Alpha',
    DATE8001     TEXT IS 'Date(8)',
    REQNUM001    TEXT IS 'Requisition Number',
    MATBRA001    TEXT IS 'Matus Branch',
    MADENO001    TEXT IS 'Matus Deposit No',
    MAPAIN001    TEXT IS 'Matus Pay Indicator',
    MACUCO001    TEXT IS 'Matus Customer Code',
    MAVAIN001    TEXT IS 'Matus Vat Indicator',
    MATRTY001    TEXT IS 'Matus Trn Type',
    MAUPST001    TEXT IS 'Matus Update Status');
