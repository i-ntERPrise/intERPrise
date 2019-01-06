-- =======================================================================================
--                                                                                       -
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
--                                                                                       -
-- =======================================================================================
CREATE TABLE INVHDRF (
"Customer_Number" FOR
    CUSTNO INTEGER NOT NULL DEFAULT 0 ,
"Invoice_Number" FOR
    INVNO INTEGER NOT NULL DEFAULT 0 ,
"Record_Status" FOR
    RECSTS CHAR(2) NOT NULL DEFAULT ' ' ,
"Invoice_Date" FOR
    INVDTE DATE NOT NULL DEFAULT CURRENT_DATE ,
"Invoice_Total" FOR
    INVTOT DECIMAL(11,2) NOT NULL DEFAULT 0 ,
    CONSTRAINT INVHDRF_P PRIMARY KEY(
     CUSTNO,INVNO))
    RCDFMT INVHDRFR;
LABEL ON TABLE INVHDRF IS 'Invoicing Header File';
LABEL ON COLUMN INVHDRF (
    CUSTNO       IS 'Cust.               No.',
    INVNO        IS 'Invoice             Number',
    RECSTS       IS 'R/S',
    INVDTE       IS 'Invoice             Date',
    INVTOT       IS 'Invoice             Total');
LABEL ON COLUMN INVHDRF (
    CUSTNO       TEXT IS 'Customer Number',
    INVNO        TEXT IS 'Invoice Number',
    RECSTS       TEXT IS 'Record Status',
    INVDTE       TEXT IS 'Invoice Date',
    INVTOT       TEXT IS 'Invoice Total');
ALTER TABLE INVHDRF ADD CONSTRAINT INVHDRF_R0 FOREIGN KEY(CUSTNO)
REFERENCES CUSMSTF (CUSTNO)
ON DELETE NO ACTION ON UPDATE NO ACTION;
