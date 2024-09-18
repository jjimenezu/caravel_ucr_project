// SPDX-FileCopyrightText: 2023 Efabless Corporation

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//      http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


#include <firmware_apis.h> // include required APIs

//############# FPU Firmware ##############################

/*unsigned int*/ void fpu_ADD (int in1, int in2){   // todo: add the round select input
    LogicAnalyzer_write(2,0x000);
    LogicAnalyzer_write(0, in1);
    LogicAnalyzer_write(1, in2);
    LogicAnalyzer_write(2,0x002);
//     int out = LogicAnalyzer_read(3);
//     return out;
}

/*unsigned int*/ void fpu_MUL (int in1, int in2){
    LogicAnalyzer_write(2,0x010);
    LogicAnalyzer_write(0, in1);
    LogicAnalyzer_write(1, in2);
    LogicAnalyzer_write(2,0x012);
    // int out = LogicAnalyzer_read(3);
    // return out;
}

/*unsigned int*/ void fpu_DIV (int in1, int in2){
    LogicAnalyzer_write(2,0x020);
    LogicAnalyzer_write(0, in1);
    LogicAnalyzer_write(1, in2);
    LogicAnalyzer_write(2,0x022);
    // int out = LogicAnalyzer_read(3);
    // return out;
}


/*unsigned int*/ void fpu_COMP (int in1, int in2){
    LogicAnalyzer_write(2,0x040);
    LogicAnalyzer_write(0, in1);
    LogicAnalyzer_write(1, in2);
    LogicAnalyzer_write(2,0x042);
    // int out = LogicAnalyzer_read(3);
    // return out;
}

/*unsigned int*/ void fpu_SQRT (int in1, int in2){
    LogicAnalyzer_write(2,0x031);
    LogicAnalyzer_write(0, in1);
    LogicAnalyzer_write(1, in2);
    LogicAnalyzer_write(2,0x032);
    int la2_reg = LogicAnalyzer_read(2) & 0x80000000;
    // while (la2_reg == 0){

    // }

    // int out = LogicAnalyzer_read(3);
    // return out;
}

void config_FPU(){
   // IO config
   // configure all gpios as  user out
   GPIOs_configureAll(GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(16,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(15,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(14,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(13,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(12,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(11,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(10,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(9,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(8,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(7,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(6,GPIO_MODE_USER_STD_OUT_MONITORED);
//    GPIOs_configure(5,GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_configure(23,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    GPIOs_configure(24,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    GPIOs_configure(25,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    GPIOs_configure(26,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    GPIOs_configure(27,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    GPIOs_configure(28,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    GPIOs_configure(29,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    GPIOs_configure(30,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    GPIOs_configure(31,GPIO_MODE_USER_STD_INPUT_PULLDOWN);
   GPIOs_loadConfigs(); // load the configuration
   // LA config
   LogicAnalyzer_outputEnable(0,0x00000000);        // 31       0
   LogicAnalyzer_outputEnable(1,0x00000000);
   LogicAnalyzer_outputEnable(2,0xFFF00001);
   LogicAnalyzer_outputEnable(3,0xFFFFFFFF);        // 127     95
   // Reset sequence
   LogicAnalyzer_write(2,0x002);
   dummyDelay(1);
   LogicAnalyzer_write(2,0x000);
   dummyDelay(1);
   LogicAnalyzer_write(2,0x002);
   dummyDelay(1);
}
//#######################################################################



//########## MAIN
void main(){
   
   // Enable managment gpio as output to use as indicator for finishing configuration  
   ManagmentGpio_outputEnable();
   ManagmentGpio_write(0);
   enableHkSpi(0); // disable housekeeping spi

   config_FPU(); 
   ManagmentGpio_write(1); // finish config
   //ManagmentGpio_write(0);

   // fpu test sequence 





   //fpu_ADD(0x3F8CCCC0,0x3F8CCCC0);
   fpu_ADD(0x3F8CCCC0,0x3F8CCCC0);
   fpu_ADD(0x43516d52,0x434ae66a);
   fpu_COMP(0x3F8CCCC0,0x3F8CCCC0);
   fpu_DIV(0xc3011585,0x43ec2ff7);
   dummyDelay(1);
   ManagmentGpio_write(0); // GPIO monitor
   dummyDelay(1);
   ManagmentGpio_write(1); // finish test

   
   // fpu_ADD(0x43A0CCCD,0xBFA66666);
   // fpu_ADD(0x42C9B1AA,0x4292E456);
   // fpu_MUL(0x42C9B1AA,0xBFA66666);




   return;
}
