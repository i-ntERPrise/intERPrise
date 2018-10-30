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
CREATE TABLE QCCRPL001 (
    FCDS1040 CHAR(11) NOT NULL DEFAULT '' ,
    SAS1050 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT037 CHAR(11) NOT NULL DEFAULT '' ,
    QCSTPR004 CHAR(20) NOT NULL DEFAULT '' ,
    QCDRNU004 CHAR(20) NOT NULL DEFAULT '' ,
    QCRENU004 CHAR(3) NOT NULL DEFAULT '' ,
    QCHISE001 NUMERIC(3,0) NOT NULL DEFAULT 0 ,
    QCPNUM004 CHAR(20) NOT NULL DEFAULT '' ,
    QCFCS1001 CHAR(11) NOT NULL DEFAULT '' ,
    QCSPS1001 CHAR(11) NOT NULL DEFAULT '' ,
    QCCRMA004 CHAR(11) NOT NULL DEFAULT '' ,
    FCDS1041 CHAR(11) NOT NULL DEFAULT '' ,
    SAS1051 CHAR(11) NOT NULL DEFAULT '' ,
    CREDIT038 CHAR(11) NOT NULL DEFAULT '' ,
    QCSTPR005 CHAR(20) NOT NULL DEFAULT '' ,
    QCDRNU005 CHAR(20) NOT NULL DEFAULT '' ,
    QCRENU005 CHAR(3) NOT NULL DEFAULT '' ,
    QCHISE002 NUMERIC(3,0) NOT NULL DEFAULT 0 ,
    QCHSDT001 NUMERIC(3,0) NOT NULL DEFAULT 0 ,
    QCPNUM005 CHAR(20) NOT NULL DEFAULT '' ,
    QCPCRE001 CHAR(11) NOT NULL DEFAULT '' )
    RCDFMT QCCRPL001R;
LABEL ON TABLE QCCRPL001 IS 'QCP Creditor Plan';
LABEL ON COLUMN QCCRPL001 (
    FCDS1040     IS 'FC/DA S1',
    SAS1050      IS 'SA                  S1',
    CREDIT037    IS 'Creditor/Debtor',
    QCSTPR004    IS 'QCP Stk Product',
    QCDRNU004    IS 'QCP Drawing         Number',
    QCRENU004    IS 'QCP Revision        Number',
    QCHISE001    IS 'QCP History         Seq',
    QCPNUM004    IS 'QCP                 Number',
    QCFCS1001    IS 'QCP FC S1',
    QCSPS1001    IS 'QCP SP S1',
    QCCRMA004    IS 'QCP Creditor        Master',
    FCDS1041     IS 'FC/DA S1',
    SAS1051      IS 'SA                  S1',
    CREDIT038    IS 'Creditor/Debtor',
    QCSTPR005    IS 'QCP Stk Product',
    QCDRNU005    IS 'QCP Drawing         Number',
    QCRENU005    IS 'QCP Revision        Number',
    QCHISE002    IS 'QCP History         Seq',
    QCHSDT001    IS 'QCP Hst             Dtl Seq',
    QCPNUM005    IS 'QCP                 Number',
    QCPCRE001    IS 'QCP                 Creditor');
LABEL ON COLUMN QCCRPL001 (
    FCDS1040     TEXT IS 'FC/DA S1',
    SAS1050      TEXT IS 'SA S1',
    CREDIT037    TEXT IS 'Creditor/Debtor',
    QCSTPR004    TEXT IS 'QCP Stk Product',
    QCDRNU004    TEXT IS 'QCP Drawing Number',
    QCRENU004    TEXT IS 'QCP Revision Number',
    QCHISE001    TEXT IS 'QCP History Seq',
    QCPNUM004    TEXT IS 'QCP Number',
    QCFCS1001    TEXT IS 'QCP FC S1',
    QCSPS1001    TEXT IS 'QCP SP S1',
    QCCRMA004    TEXT IS 'QCP Creditor Master',
    FCDS1041     TEXT IS 'FC/DA S1',
    SAS1051      TEXT IS 'SA S1',
    CREDIT038    TEXT IS 'Creditor/Debtor',
    QCSTPR005    TEXT IS 'QCP Stk Product',
    QCDRNU005    TEXT IS 'QCP Drawing Number',
    QCRENU005    TEXT IS 'QCP Revision Number',
    QCHISE002    TEXT IS 'QCP History Seq',
    QCHSDT001    TEXT IS 'QCP Hst Dtl Seq',
    QCPNUM005    TEXT IS 'QCP Number',
    QCPCRE001    TEXT IS 'QCP Creditor');
