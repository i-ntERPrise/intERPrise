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
CREATE TABLE CRECLA003 (
    STRLVL004 NUMERIC(1,0) NOT NULL DEFAULT 0 ,
    S1060 CHAR(11) NOT NULL DEFAULT '' ,
    STRDES008 CHAR(10) NOT NULL DEFAULT '' ,
    STRDES009 CHAR(40) NOT NULL DEFAULT '' ,
    STRDES010 CHAR(10) NOT NULL DEFAULT '' ,
    CRECLA004 CHAR(3) NOT NULL DEFAULT '' ,
    FCVS1006 CHAR(11) NOT NULL DEFAULT '' ,
    CRCLCT001 CHAR(11) NOT NULL DEFAULT '' ,
    FBS1003 CHAR(11) NOT NULL DEFAULT '' ,
    CRCLBN001 CHAR(11) NOT NULL DEFAULT '' ,
    CASHBO001 CHAR(11) NOT NULL DEFAULT '' ,
    CRCLCL001 CHAR(11) NOT NULL DEFAULT '' ,
    CRCLVA001 CHAR(11) NOT NULL DEFAULT '' ,
    CRCLAC001 CHAR(11) NOT NULL DEFAULT '' ,
    CRCLPA001 CHAR(3) NOT NULL DEFAULT '' ,
    CRCLSP001 CHAR(3) NOT NULL DEFAULT '' ,
    CRCLST001 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT CRECLA003R;
LABEL ON TABLE CRECLA003 IS 'Creditor Class';
LABEL ON COLUMN CRECLA003 (
    STRLVL004    IS 'Structure           Lvl',
    S1060        IS 'S1',
    STRDES008    IS 'Str Desc',
    STRDES009    IS 'Str Description',
    STRDES010    IS 'Structure Desc',
    CRECLA004    IS 'Cr                  Class',
    FCVS1006     IS 'FCV                 S1',
    CRCLCT001    IS 'Ctl                 Nominal A/c',
    FBS1003      IS 'FB S1',
    CRCLBN001    IS 'Cr Cls Bnk          Nominal A/c',
    CASHBO001    IS 'Cashbook',
    CRCLCL001    IS 'Cr Cls Clr          Nominal A/c',
    CRCLVA001    IS 'Cr Cls VAT          Nominal A/c',
    CRCLAC001    IS 'Cr Cls              Acc 01',
    CRCLPA001    IS 'Cr Cls Payment      Paymnt Trn',
    CRCLSP001    IS 'Cr Cls Spare        Trn Z01',
    CRCLST001    IS 'Cr Cls              Sts 01');
LABEL ON COLUMN CRECLA003 (
    STRLVL004    TEXT IS 'Structure Lvl',
    S1060        TEXT IS 'S1',
    STRDES008    TEXT IS 'Str Desc',
    STRDES009    TEXT IS 'Str Description',
    STRDES010    TEXT IS 'Structure Desc',
    CRECLA004    TEXT IS 'Creditor Class',
    FCVS1006     TEXT IS 'FCV S1',
    CRCLCT001    TEXT IS 'Cr Cls Ctl Nominal A/c',
    FBS1003      TEXT IS 'FB S1',
    CRCLBN001    TEXT IS 'Cr Cls Bnk Nominal A/c',
    CASHBO001    TEXT IS 'Cashbook',
    CRCLCL001    TEXT IS 'Cr Cls Clr Nominal A/c',
    CRCLVA001    TEXT IS 'Cr Cls VAT Nominal A/c',
    CRCLAC001    TEXT IS 'Cr Cls Acc 01',
    CRCLPA001    TEXT IS 'Cr Cls Payment Paymnt Trn',
    CRCLSP001    TEXT IS 'Cr Cls Spare Trn Z01',
    CRCLST001    TEXT IS 'Cr Cls Sts 01');
