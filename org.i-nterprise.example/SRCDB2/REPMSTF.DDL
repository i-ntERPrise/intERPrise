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
CREATE TABLE REPMSTF (
                      REPCDE SMALLINT NOT NULL DEFAULT 0 ,
                      RECSTS CHAR(2) NOT NULL DEFAULT ' ' ,
                      REPNME CHAR(30) NOT NULL DEFAULT ' ' ,
                      CELLNO CHAR(15) NOT NULL DEFAULT ' ' ,
                      COMMPC DECIMAL(5,2) NOT NULL DEFAULT 0 ,
    CONSTRAINT REPMSTF_P PRIMARY KEY(REPCDE))
    RCDFMT REPMSTFR;
LABEL ON TABLE REPMSTF IS 'Sales Rep. Master File';
LABEL ON COLUMN REPMSTF (
    REPCDE       IS 'Rep.                Code',
    RECSTS       IS 'R/S',
    REPNME       IS 'Sales Rep. Name',
    CELLNO       IS 'Cell.               Number',
    COMMPC       IS 'Com.%');
LABEL ON COLUMN REPMSTF (
    REPCDE       TEXT IS 'Sales Rep. Code',
    RECSTS       TEXT IS 'Record Status',
    REPNME       TEXT IS 'Sales Rep. Name',
    CELLNO       TEXT IS 'Cell Phone Number',
    COMMPC       TEXT IS 'Commission Percentage');
