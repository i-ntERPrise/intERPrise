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
CREATE TABLE DEMIWO001 (
    DEMSAC022 CHAR(11) NOT NULL DEFAULT '' ,
    DRMSST004 CHAR(1) NOT NULL DEFAULT '' ,
    DEMSNA006 CHAR(40) NOT NULL DEFAULT '' ,
    DRMSCU009 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    DRMS03004 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    DRMS12004 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    DAS1027 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSTY004 CHAR(1) NOT NULL DEFAULT '' ,
    DEMIDA001 CHAR(10) NOT NULL DEFAULT '' ,
    DRMSBA002 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    DRMSOR001 DECIMAL(15,2) NOT NULL DEFAULT 0 )
    RCDFMT DEMIWO001R;
LABEL ON TABLE DEMIWO001 IS 'Debtor MIS Work';
LABEL ON COLUMN DEMIWO001 (
    DEMSAC022    IS 'Account',
    DRMSST004    IS 'Dr Mst-C            Status',
    DEMSNA006    IS 'Name',
    DRMSCU009    IS 'Dr Mst-A            Current',
    DRMS03004    IS 'Dr Mst-A            030 Days',
    DRMS12004    IS 'Dr Mst-A            120 Days',
    DAS1027      IS 'DA                  S1',
    DEMSTY004    IS 'Typ',
    DEMIDA001    IS 'Debtor MIS          Date Created',
    DRMSBA002    IS 'Balance',
    DRMSOR001    IS 'To be Suppld');
LABEL ON COLUMN DEMIWO001 (
    DEMSAC022    TEXT IS 'Debtor Mst Account',
    DRMSST004    TEXT IS 'Dr Mst-C Status',
    DEMSNA006    TEXT IS 'Debtor Mst Name',
    DRMSCU009    TEXT IS 'Dr Mst-A Current',
    DRMS03004    TEXT IS 'Dr Mst-A 030 Days',
    DRMS12004    TEXT IS 'Dr Mst-A 120 Days',
    DAS1027      TEXT IS 'DA S1',
    DEMSTY004    TEXT IS 'Debtor Mst Type',
    DEMIDA001    TEXT IS 'Debtor MIS Date Created',
    DRMSBA002    TEXT IS 'Dr Mst-A Balance',
    DRMSOR001    TEXT IS 'Dr Mst-S Ord Suppl');
