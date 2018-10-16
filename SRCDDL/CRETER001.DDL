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
CREATE TABLE CRETER001 (
    S1061 CHAR(11) NOT NULL DEFAULT '' ,
    CRTRPM013 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    CRTER005 CHAR(3) NOT NULL DEFAULT '' ,
    CRTEDE002 CHAR(10) NOT NULL DEFAULT '' ,
    CRTRPM014 DECIMAL(5,2) NOT NULL DEFAULT 0 ,
    FCVS1007 CHAR(11) NOT NULL DEFAULT '' ,
    CRTEDA005 CHAR(10) NOT NULL DEFAULT '' ,
    CRTEMT002 CHAR(1) NOT NULL DEFAULT '' ,
    CRTRPM015 DECIMAL(5,2) NOT NULL DEFAULT 0 ,
    CRTRPM016 DECIMAL(5,2) NOT NULL DEFAULT 0 ,
    CRTRPM017 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    CRTRPM018 DECIMAL(3,0) NOT NULL DEFAULT 0 ,
    CRTEST001 CHAR(1) NOT NULL DEFAULT '' ,
    RCDFMT CRETER001R;
LABEL ON TABLE CRETER001 IS 'Creditor Term';
LABEL ON COLUMN CRETER001 (
    S1061        IS 'S1',
    CRTRPM013    IS 'First               Pmt Time',
    CRTER005     IS 'Terms',
    CRTEDE002    IS 'Terms               Desc',
    CRTRPM014    IS 'First Pmt           Discount',
    FCVS1007     IS 'FCV                 S1',
    CRTEDA005    IS 'Effective           Date',
    CRTEMT002    IS 'Mths/               Days',
    CRTRPM015    IS 'Cr Trm2 Pmt         Discount',
    CRTRPM016    IS 'Cr Trm3 Pmt         Discount',
    CRTRPM017    IS 'Cr Trm2             Pmt Time',
    CRTRPM018    IS 'Cr Trm3             Pmt Time',
    CRTEST001    IS 'Cr Terms            Status');
LABEL ON COLUMN CRETER001 (
    S1061        TEXT IS 'S1',
    CRTRPM013    TEXT IS 'Cr Trm1 Pmt Time',
    CRTER005     TEXT IS 'Cr Terms',
    CRTEDE002    TEXT IS 'Cr Terms Desc',
    CRTRPM014    TEXT IS 'Cr Trm1 Pmt Discount',
    FCVS1007     TEXT IS 'FCV S1',
    CRTEDA005    TEXT IS 'Cr Terms Date',
    CRTEMT002    TEXT IS 'Cr Terms Mths/Days',
    CRTRPM015    TEXT IS 'Cr Trm2 Pmt Discount',
    CRTRPM016    TEXT IS 'Cr Trm3 Pmt Discount',
    CRTRPM017    TEXT IS 'Cr Trm2 Pmt Time',
    CRTRPM018    TEXT IS 'Cr Trm3 Pmt Time',
    CRTEST001    TEXT IS 'Cr Terms Status');
