-- Created by Shield advanced Solutions Ltd - www.shieldadvanced.com
-- Original code : Chris Hird Director
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at http:--www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- The above copyright notice and this permission notice shall be included in all copies
-- or substantial portions of the Software.

 Create or Replace Table IRPTCFG (
        numsvr smallint NOT NULL,
        svrport integer NOT NULL,
        sesstimeo integer NOT NULL,
        secsvr char  NOT NULL)
 rcdfmt CFGREC;
 LABEL ON TABLE IRPTCFG is 'Transport Service Cfg';
 LABEL ON
        COLUMN IRPTCFG(
        NUMSVR IS 'Number Workers',
        SVRPORT IS 'Listening Port',
        SESSTIMEO IS 'Session Time Out',
        SECSVR IS 'Secure Server');
 LABEL ON COLUMN IRPTCFG (
        NUMSVR Text IS 'Number Listening Jobs',
        SVRPORT Text IS 'Server Listens on',
        SESSTIMEO Text IS 'Session Time out Minutes'
        SECSVR Text IS 'Secure Server Setting Y/N');
 INSERT INTO IRPTCFG (numsvr, svrport, sesstimeo)
        VALUES(5,23456,10,'N');

