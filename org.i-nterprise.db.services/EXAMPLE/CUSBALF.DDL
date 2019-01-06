-- =======================================================================================
-- -                                                                                      -
-- -   Copyright (c) 2008-2018 TEMBO Technology Lab (Pty) Ltd.
-- -   Created by AO Foundation - www.adsero-optima.com
-- -   Original TEMPLATE author: Tommy Atkins - Chief Development Officer
-- -
-- -   Licensed under the Apache License, Version 2.0 (the "License");
-- -   you may not use this file except in compliance with the License.
-- -   You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
-- -
-- -   Unless required by applicable law or agreed to in writing, software
-- -   distributed under the License is distributed on an "AS IS" BASIS,
-- -   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- -   See the License for the specific language governing permissions and
-- -   limitations under the License.
-- -
-- -   The above copyright notice and this permission notice shall be included in all
-- -   copies or substantial portions of the Software.
-- -
-- -                       http://www.adsero-optima.com/
-- -
-- =======================================================================================
CREATE TABLE CUSBALF (
"Customer_Number" FOR
    CUSTNO INTEGER NOT NULL DEFAULT 0 ,
"Record_Status" FOR
    RECSTS CHAR(2) NOT NULL DEFAULT ' ' ,
"Current_Due" FOR
    DAYSC DECIMAL(9,2) NOT NULL DEFAULT 0 ,
"DAYS_30" FOR
    DAYS30 DECIMAL(9,2) NOT NULL DEFAULT 0 ,
"AMOUNT_O/S_(60_DAYS)" FOR
    DAYS60 DECIMAL(9,2) NOT NULL DEFAULT 0 ,
"Customers_Total_Outstanding" FOR
    CUSTOTOS DECIMAL(11,2) NOT NULL DEFAULT 0 ,
    RCDFMT CUSBALFR;
LABEL ON TABLE CUSBALF IS 'Customer Balances FIle';
LABEL ON COLUMN CUSBALF (
    CUSTNO       IS 'Cust.               No.',
    RECSTS       IS 'R/S',
    DAYSC        IS 'Current             Due',
    DAYS30       IS '30 Days',
    DAYS60       IS 'Outstanding         60 Days',
    CUSTOTOS     IS 'Customers Total     Outstanding');
LABEL ON COLUMN CUSBALF (
    CUSTNO       TEXT IS 'Customer Number',
    RECSTS       TEXT IS 'Record Status',
    DAYSC        TEXT IS 'Current Due',
    DAYS30       TEXT IS '30 Days',
    DAYS60       TEXT IS 'Amount O/S (60 Days)',
    CUSTOTOS     TEXT IS 'Customers Total Outstanding');
