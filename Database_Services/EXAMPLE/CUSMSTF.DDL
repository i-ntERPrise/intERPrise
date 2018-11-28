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
CREATE TABLE CUSMSTF (
"Customer_Number" FOR
    CUSTNO INTEGER NOT NULL DEFAULT 0 ,
"Record_Status" FOR
    RECSTS CHAR(2) NOT NULL DEFAULT '' ,
"Customer_Name" FOR
    CUSNME CHAR(30) NOT NULL DEFAULT '' ,
    ADRLN1 CHAR(30) NOT NULL DEFAULT '' ,
    ADRLN2 CHAR(30) NOT NULL DEFAULT '' ,
    ADRLN3 CHAR(30) NOT NULL DEFAULT '' ,
"POST_CODE" FOR
    PSTCDE CHAR(5) NOT NULL DEFAULT ' ' ,
"Commencment_Date" FOR
    STRDTE DATE NOT NULL DEFAULT CURRENT_DATE ,
"Phone_Number" FOR
    PHONEN CHAR(15) NOT NULL DEFAULT '' ,
"Rep_Code" FOR
    REPCDE SMALLINT NOT NULL DEFAULT 0 ,
"User_Id" FOR
    USERID CHAR(10) NOT NULL DEFAULT '' ,
    CONSTRAINT CUSMSTF_P PRIMARY KEY(
     CUSTNO))
    RCDFMT CUSMSTFR;
LABEL ON TABLE CUSMSTF IS 'Customer Master File';
LABEL ON COLUMN CUSMSTF (
    CUSTNO       IS 'Cust.               No.',
    RECSTS       IS 'R/S',
    CUSNME       IS 'Customer Name',
    ADRLN1       IS 'Address             Line',
    ADRLN2       IS 'Address             Line',
    ADRLN3       IS 'Address             Line',
    PSTCDE       IS 'Post Code',
    STRDTE       IS 'Commencment         Date',
    PHONEN       IS 'Phone Number',
    REPCDE       IS 'Rep.                Code',
    USERID       IS 'User Id');
LABEL ON COLUMN CUSMSTF (
    CUSTNO       TEXT IS 'Customer Number',
    RECSTS       TEXT IS 'Record Status',
    CUSNME       TEXT IS 'Customer Name',
    ADRLN1       TEXT IS 'Adress Line',
    ADRLN2       TEXT IS 'Adress Line',
    ADRLN3       TEXT IS 'Adress Line',
    PSTCDE       TEXT IS 'Post Code',
    STRDTE       TEXT IS 'Commencment Date',
    PHONEN       TEXT IS 'Phone Number',
    REPCDE       TEXT IS 'Sales Rep. Code',
    USERID       TEXT IS 'User Id');
ALTER TABLE CUSMSTF ADD CONSTRAINT CUSMSTF_R0 FOREIGN KEY(
REPCDE)
REFERENCES REPMSTF (
REPCDE)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
