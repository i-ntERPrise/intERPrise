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
CREATE TABLE IMFICR001 (
    FCDS1050 CHAR(11) NOT NULL DEFAULT '' ,
    CRINBA001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    CRINCR001 CHAR(11) NOT NULL DEFAULT '' ,
    CRINTR001 CHAR(10) NOT NULL DEFAULT '' ,
    CRINSE001 NUMERIC(3,0) NOT NULL DEFAULT 0 ,
    CRINDE001 CHAR(15) NOT NULL DEFAULT '' ,
    CRINGR001 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CRINPU001 NUMERIC(11,0) NOT NULL DEFAULT 0 ,
    CRINGL001 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    CRINTR002 CHAR(40) NOT NULL DEFAULT '' ,
    CRINNO001 CHAR(11) NOT NULL DEFAULT '' ,
    CRINFG001 CHAR(11) NOT NULL DEFAULT '' ,
    CRINTR003 CHAR(10) NOT NULL DEFAULT '' ,
    CRINBU001 CHAR(3) NOT NULL DEFAULT '' ,
    CRINER001 CHAR(1) NOT NULL DEFAULT '' ,
    CRINAU001 CHAR(1) NOT NULL DEFAULT '' ,
    CRINST001 CHAR(1) NOT NULL DEFAULT '' ,
    CRIMPO001 CHAR(20) NOT NULL DEFAULT '' ,
    FBS1020 CHAR(11) NOT NULL DEFAULT '' ,
    FBINBA001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    FBINCA001 CHAR(11) NOT NULL DEFAULT '' ,
    FBINTR001 CHAR(10) NOT NULL DEFAULT '' ,
    FBINSE001 NUMERIC(3,0) NOT NULL DEFAULT 0 ,
    FBINTR002 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    FBINFG001 CHAR(11) NOT NULL DEFAULT '' ,
    FBINBA002 NUMERIC(7,0) NOT NULL DEFAULT 0 ,
    FBINTR003 DECIMAL(7,0) NOT NULL DEFAULT 0 ,
    FBINNO001 CHAR(11) NOT NULL DEFAULT '' ,
    FBINTR004 DECIMAL(15,2) NOT NULL DEFAULT 0 ,
    FBINNA001 CHAR(40) NOT NULL DEFAULT '' ,
    FBINAD001 CHAR(40) NOT NULL DEFAULT '' ,
    FBINPO001 NUMERIC(4,0) NOT NULL DEFAULT 0 ,
    FBINAU001 CHAR(1) NOT NULL DEFAULT '' ,
    FBINZ0001 CHAR(1) NOT NULL DEFAULT '' ,
    FGBS1050 CHAR(11) NOT NULL DEFAULT '' ,
    FGINBA001 NUMERIC(6,0) NOT NULL DEFAULT 0 ,
    FGINFG001 CHAR(11) NOT NULL DEFAULT '' ,
    FGINSE001 NUMERIC(9,0) NOT NULL DEFAULT 0 ,
    FGINNO001 CHAR(11) NOT NULL DEFAULT '' ,
    FGINTR001 CHAR(10) NOT NULL DEFAULT '' ,
    FGINFC001 CHAR(11) NOT NULL DEFAULT '' ,
    FGINCR001 CHAR(11) NOT NULL DEFAULT '' ,
    FGINPO001 CHAR(20) NOT NULL DEFAULT '' ,
    FGINGR001 CHAR(20) NOT NULL DEFAULT '' ,
    FGININ001 CHAR(20) NOT NULL DEFAULT '' ,
    FGINAU001 CHAR(1) NOT NULL DEFAULT '' ,
    FGINST001 CHAR(1) NOT NULL DEFAULT '' )
    RCDFMT IMFICR001R;
LABEL ON TABLE IMFICR001 IS 'Import File - Creditors';
LABEL ON COLUMN IMFICR001 (
    FCDS1050     IS 'FC/DA S1',
    CRINBA001    IS 'Cr Input            Batch Period',
    CRINCR001    IS 'Cr Input            Creditor',
    CRINTR001    IS 'Cr Input            Trn Date',
    CRINSE001    IS 'Cr Input            Seq No',
    CRINDE001    IS 'Cr Input            Delivery Note',
    CRINGR001    IS 'Cr Input            GRN Ref',
    CRINPU001    IS 'Cr Input            Purchase Order',
    CRINGL001    IS 'Cr Input            GL Ref',
    CRINTR002    IS 'Cr Input Trn        Narration',
    CRINNO001    IS 'Cr Input            Nominal Account',
    CRINFG001    IS 'Cr Input            FGB S1',
    CRINTR003    IS 'Cr Input            Trn User',
    CRINBU001    IS 'Cr Input            Buyer',
    CRINER001    IS 'Cr Input            Error Sts',
    CRINAU001    IS 'Cr Input            Auto Post',
    CRINST001    IS 'Cr Input            Sts Z02',
    CRIMPO001    IS 'Cr Import           PO Number',
    FBS1020      IS 'FB S1',
    FBINBA001    IS 'FB Input            Batch Period',
    FBINCA001    IS 'FB Input            Cashbook',
    FBINTR001    IS 'FB Input            Trn Date',
    FBINSE001    IS 'FB Input            Seq no',
    FBINTR002    IS 'FB Input            Trn Amount',
    FBINFG001    IS 'FB Input            FGB S1',
    FBINBA002    IS 'FB Input            Batch Refer',
    FBINTR003    IS 'FB Input            Trn Refer',
    FBINNO001    IS 'FB Input            Nominal Account',
    FBINTR004    IS 'FB Input Trn        Itf Amount',
    FBINNA001    IS 'FB Input Name',
    FBINAD001    IS 'FB Input Address 1',
    FBINPO001    IS 'FB Input Postal Code',
    FBINAU001    IS 'FB Input            Auto Post',
    FBINZ0001    IS 'FB Input            Z01',
    FGBS1050     IS 'FGB                 S1',
    FGINBA001    IS 'FG Input            Batch Period',
    FGINFG001    IS 'FG Input            FGB S1 Mst',
    FGINSE001    IS 'FG Input            Seq No',
    FGINNO001    IS 'FG Input            Nominal Account',
    FGINTR001    IS 'FG Input            Trn Date',
    FGINFC001    IS 'FG Input            FC S1',
    FGINCR001    IS 'FG Input            Creditor',
    FGINPO001    IS 'FG Input            PO Number',
    FGINGR001    IS 'FG Input            GRN Number',
    FGININ001    IS 'FG Input            Invoice Number',
    FGINAU001    IS 'FG Input            Auto Post',
    FGINST001    IS 'FG Input            Sts Z02');
LABEL ON COLUMN IMFICR001 (
    FCDS1050     TEXT IS 'FC/DA S1',
    CRINBA001    TEXT IS 'Cr Input Batch Period',
    CRINCR001    TEXT IS 'Cr Input Creditor',
    CRINTR001    TEXT IS 'Cr Input Trn Date',
    CRINSE001    TEXT IS 'Cr Input Seq No',
    CRINDE001    TEXT IS 'Cr Input Delivery Note',
    CRINGR001    TEXT IS 'Cr Input GRN Ref',
    CRINPU001    TEXT IS 'Cr Input Purchase Order',
    CRINGL001    TEXT IS 'Cr Input GL Ref',
    CRINTR002    TEXT IS 'Cr Input Trn Narration',
    CRINNO001    TEXT IS 'Cr Input Nominal Account',
    CRINFG001    TEXT IS 'Cr Input FGB S1',
    CRINTR003    TEXT IS 'Cr Input Trn User',
    CRINBU001    TEXT IS 'Cr Input Buyer',
    CRINER001    TEXT IS 'Cr Input Error Sts',
    CRINAU001    TEXT IS 'Cr Input Auto Post',
    CRINST001    TEXT IS 'Cr Input Sts Z02',
    CRIMPO001    TEXT IS 'Cr Import PO Number',
    FBS1020      TEXT IS 'FB S1',
    FBINBA001    TEXT IS 'FB Input Batch Period',
    FBINCA001    TEXT IS 'FB Input Cashbook',
    FBINTR001    TEXT IS 'FB Input Trn Date',
    FBINSE001    TEXT IS 'FB Input Seq no',
    FBINTR002    TEXT IS 'FB Input Trn Amount',
    FBINFG001    TEXT IS 'FB Input FGB S1',
    FBINBA002    TEXT IS 'FB Input Batch Refer',
    FBINTR003    TEXT IS 'FB Input Trn Refer',
    FBINNO001    TEXT IS 'FB Input Nominal Account',
    FBINTR004    TEXT IS 'FB Input Trn Itf Amount',
    FBINNA001    TEXT IS 'FB Input Name',
    FBINAD001    TEXT IS 'FB Input Address 1',
    FBINPO001    TEXT IS 'FB Input Postal Code',
    FBINAU001    TEXT IS 'FB Input Auto Post',
    FBINZ0001    TEXT IS 'FB Input Z01',
    FGBS1050     TEXT IS 'FGB S1',
    FGINBA001    TEXT IS 'FG Input Batch Period',
    FGINFG001    TEXT IS 'FG Input FGB S1 Mst',
    FGINSE001    TEXT IS 'FG Input Seq No',
    FGINNO001    TEXT IS 'FG Input Nominal Account',
    FGINTR001    TEXT IS 'FG Input Trn Date',
    FGINFC001    TEXT IS 'FG Input FC S1',
    FGINCR001    TEXT IS 'FG Input Creditor',
    FGINPO001    TEXT IS 'FG Input PO Number',
    FGINGR001    TEXT IS 'FG Input GRN Number',
    FGININ001    TEXT IS 'FG Input Invoice Number',
    FGINAU001    TEXT IS 'FG Input Auto Post',
    FGINST001    TEXT IS 'FG Input Sts Z02');
