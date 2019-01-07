-- =======================================================================================
--     Copyright (c) 2008-2018 TEMBO Technology Lab (Pty) Ltd.
--     Created by AO Foundation - www.adsero-optima.com
--     Original TEMPLATE author: Tommy Atkins - Chief Development Officer
--
--     Licensed under the Apache License, Version 2.0 (the "License");
--     you may not use this file except in compliance with the License.
--     You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
--
--     Unless required by applicable law or agreed to in writing, software
--     distributed under the License is distributed on an "AS IS" BASIS,
--     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--     See the License for the specific language governing permissions and
--     limitations under the License.
--
--     The above copyright notice and this permission notice shall be included in all
--     copies or substantial portions of the Software.
--
--                         http://www.adsero-optima.com/
-- =======================================================================================
CREATE TABLE INVDETF (
"Customer_Number"          FOR CUSTNO   INTEGER       NOT NULL DEFAULT 0 ,
"Invoice_Number"           FOR INVNO    INTEGER       NOT NULL DEFAULT 0 ,
"Invoice_Line_Number"      FOR LINENO   SMALLINT      NOT NULL DEFAULT 0 ,
"Record_Status"            FOR RECSTS   CHAR(2)       NOT NULL DEFAULT ' ' ,
"Product_Code"             FOR PRDCDE   CHAR(10)      NOT NULL DEFAULT '' ,
"Item_Quantity"            FOR ITMQTY   DECIMAL(5,0)  NOT NULL DEFAULT 0 ,
"Product_Price"            FOR PRDPRICE DECIMAL(7,2)  NOT NULL DEFAULT 0 ,
"Invoice_Line_Total_Value" FOR LINETOT  DECIMAL(11,2) NOT NULL DEFAULT 0 ,
CONSTRAINT INVDETF_P PRIMARY KEY(CUSTNO,INVNO,LINENO))
RCDFMT INVDETFR;
LABEL ON TABLE INVDETF IS 'Invoice Line Details File';
LABEL ON COLUMN INVDETF (
    CUSTNO       IS 'Cust.               No.',
    INVNO        IS 'Invoice             Number',
    LINENO       IS 'Line                No.',
    RECSTS       IS 'R/S',
    PRDCDE       IS 'Product             Code',
    ITMQTY       IS 'Item                Quantity',
    PRDPRICE     IS 'Product             Price',
    LINETOT      IS 'Inv. Line           Total Val.');
LABEL ON COLUMN INVDETF (
    CUSTNO       TEXT IS 'Customer Number',
    INVNO        TEXT IS 'Invoice Number',
    LINENO       TEXT IS 'Invoice Line Number',
    RECSTS       TEXT IS 'Record Status',
    PRDCDE       TEXT IS 'Product Code',
    ITMQTY       TEXT IS 'Item Quantity',
    PRDPRICE     TEXT IS 'Product Price',
    LINETOT      TEXT IS 'Invoice Line Total Value');
ALTER TABLE INVDETF ADD CONSTRAINT INVDETF_R0 FOREIGN KEY(CUSTNO,INVNO)
REFERENCES INVHDRF (CUSTNO,INVNO)
ON DELETE CASCADE ON UPDATE NO ACTION;
