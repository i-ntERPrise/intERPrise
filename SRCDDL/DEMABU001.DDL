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
CREATE TABLE DEMABU001 (
    DEMSAC037 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1050 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSBU001 CHAR(11) NOT NULL DEFAULT '' ,
    DAS1051 CHAR(11) NOT NULL DEFAULT '' ,
    DEMSBU002 DECIMAL(9,0) NOT NULL DEFAULT 0 )
    RCDFMT DEMABU001R;
LABEL ON TABLE DEMABU001 IS 'Debtor Master Budget';
LABEL ON COLUMN DEMABU001 (
    DEMSAC037    IS 'Account',
    DAS1050      IS 'DA                  S1',
    DEMSBU001    IS 'Debtor Mst          Bud Group 1',
    DAS1051      IS 'DA                  S1',
    DEMSBU002    IS 'Debtor Mst          Bud Ranking');
LABEL ON COLUMN DEMABU001 (
    DEMSAC037    TEXT IS 'Debtor Mst Account',
    DAS1050      TEXT IS 'DA S1',
    DEMSBU001    TEXT IS 'Debtor Mst Bud Group 1',
    DAS1051      TEXT IS 'DA S1',
    DEMSBU002    TEXT IS 'Debtor Mst Bud Ranking');
