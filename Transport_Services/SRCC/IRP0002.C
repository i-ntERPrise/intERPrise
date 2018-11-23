//
// Copyright (c) 2018 Shield Advanced Solutions Ltd
// Created by Shield advanced Solutions Ltd - www.shieldadvanced.com
// Original code : Chris Hird Director
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// The above copyright notice and this permission notice shall be included in all copies
// or substantial portions of the Software.
#include <H/COMMON>                              // common header file
#include <qsnddtaq.h>                            // send data queue entry

int main(int argc, char **argv) {
short int* ptr;                                  // ptr to number to send
decimal(3,0) KeyLength = 4.0d;                   // length of key
decimal(5,0) DataLen = 7.0d;                     // data length
char DQKey[4] = "0000";                          // key for data queue
char QueueData[10];                              // Data Queue Data buffer
char DQueue[10] = "SVRCTLQ   ";                  // Master Q
char DQLib[10] = _DFT_PGM_LIB;                   // Master Q Lib

ptr = (short int *)argv[1];
sprintf(QueueData,"%d",ptr);
DataLen = strlen(QueueData)+1;
QSNDDTAQ(DQueue,
         DQLib,
         DataLen,
         QueueData,
         KeyLength,
         &DQKey);
return 1;
}
