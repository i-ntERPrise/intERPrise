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
CREATE TABLE CUSADRF (
    CUSTNO INTEGER NOT NULL DEFAULT 0 ,
"Address_Type" FOR
    ADRTYP CHAR(5) NOT NULL DEFAULT '' ,
    RECSTS CHAR(2) NOT NULL DEFAULT ' ' ,
    ADRLN1 CHAR(30) NOT NULL DEFAULT ' ' ,
    ADRLN2 CHAR(30) NOT NULL DEFAULT ' ' ,
    ADRLN3 CHAR(30) NOT NULL DEFAULT ' ' ,
"POST_CODE" FOR
    PSTCDE CHAR(5) NOT NULL DEFAULT ' ' ,
    CONSTRAINT CUSADRF_P PRIMARY KEY(
     CUSTNO,ADRTYP))
    RCDFMT CUSADRFR;
LABEL ON TABLE CUSADRF IS 'Customer Address File';
LABEL ON COLUMN CUSADRF (
    CUSTNO       IS 'Cust.               No.',
    ADRTYP       IS 'Address Type',
    RECSTS       IS 'R/S',
    ADRLN1       IS 'Address             Line',
    ADRLN2       IS 'Address             Line',
    ADRLN3       IS 'Address             Line',
    PSTCDE       IS 'Post Code');
LABEL ON COLUMN CUSADRF (
    CUSTNO       TEXT IS 'Customer Number',
    ADRTYP       TEXT IS 'Address Type',
    RECSTS       TEXT IS 'Record Status',
    ADRLN1       TEXT IS 'Address Line',
    ADRLN2       TEXT IS 'Address Line',
    ADRLN3       TEXT IS 'Address Line',
    PSTCDE       TEXT IS 'Post Code');
ALTER TABLE CUSADRF ADD CONSTRAINT CUSADRF_R0 FOREIGN KEY(
CUSTNO)
REFERENCES CUSMSTF (
CUSTNO)
ON DELETE CASCADE
ON UPDATE NO ACTION;
