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
CREATE TABLE PRDMSTF (
"Product_Code" FOR
    PRDCDE CHAR(10) NOT NULL DEFAULT '' ,
"Record_Status" FOR
    RECSTS CHAR(2) NOT NULL DEFAULT ' ' ,
    DESCR CHAR(30) NOT NULL DEFAULT '' ,
"Product_Price" FOR
    PRDPRICE DECIMAL(7,2) NOT NULL DEFAULT 0 ,
    CONSTRAINT PRDMSTF_P PRIMARY KEY(
     PRDCDE))
    RCDFMT PRDMSTFR;
LABEL ON TABLE PRDMSTF IS 'Product Master File';
LABEL ON COLUMN PRDMSTF (
    PRDCDE       IS 'Product             Code',
    RECSTS       IS 'R/S',
    DESCR        IS 'Description',
    PRDPRICE     IS 'Product             Price');
LABEL ON COLUMN PRDMSTF (
    PRDCDE       TEXT IS 'Product Code',
    RECSTS       TEXT IS 'Record Status',
    DESCR        TEXT IS 'Description',
    PRDPRICE     TEXT IS 'Product Price');
