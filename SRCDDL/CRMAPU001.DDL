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
CREATE TABLE CRMAPU001 (
    FCDS1083 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT068 CHAR(11) NOT NULL DEFAULT '' ,
    CRMSPR001 CHAR(11) NOT NULL DEFAULT '' ,
    CRMSFO001 CHAR(11) NOT NULL DEFAULT '' ,
    CRMSFR001 CHAR(11) NOT NULL DEFAULT '' ,
    CRMSCL001 CHAR(11) NOT NULL DEFAULT '' ,
    CRMSDI001 CHAR(11) NOT NULL DEFAULT '' ,
    CRMSPA001 CHAR(11) NOT NULL DEFAULT '' ,
    CRMSDI002 CHAR(11) NOT NULL DEFAULT '' ,
    RCDFMT CRMAPU001R;
LABEL ON TABLE CRMAPU001 IS 'Creditor Master Purchase';
LABEL ON COLUMN CRMAPU001 (
    FCDS1083     IS 'FC/DA S1',
    CREDIT068    IS 'Creditor/Debtor',
    CRMSPR001    IS 'Cr Mst              Pricing Type',
    CRMSFO001    IS 'Cr Mst              Forwarding Agent',
    CRMSFR001    IS 'Cr Mst              Freight Type',
    CRMSCL001    IS 'Cr Mst              Clearing Agent',
    CRMSDI001    IS 'Cr Mst              Discharge Port',
    CRMSPA001    IS 'Cr Mst              Payment Terms',
    CRMSDI002    IS 'Cr Mst              Disposal Doc');
LABEL ON COLUMN CRMAPU001 (
    FCDS1083     TEXT IS 'FC/DA S1',
    CREDIT068    TEXT IS 'Creditor/Debtor',
    CRMSPR001    TEXT IS 'Cr Mst Pricing Type',
    CRMSFO001    TEXT IS 'Cr Mst Forwarding Agent',
    CRMSFR001    TEXT IS 'Cr Mst Freight Type',
    CRMSCL001    TEXT IS 'Cr Mst Clearing Agent',
    CRMSDI001    TEXT IS 'Cr Mst Discharge Port',
    CRMSPA001    TEXT IS 'Cr Mst Payment Terms',
    CRMSDI002    TEXT IS 'Cr Mst Disposal Doc');
