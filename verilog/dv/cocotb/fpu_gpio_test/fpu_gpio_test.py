# SPDX-FileCopyrightText: 2023 Efabless Corporation

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# SPDX-License-Identifier: Apache-2.0

from caravel_cocotb.caravel_interfaces import test_configure
from caravel_cocotb.caravel_interfaces import report_test
import cocotb 

@cocotb.test() # cocotb test marker
@report_test # wrapper for configure test reporting files
async def fpu_gpio_test(dut):
    caravelEnv = await test_configure(dut, timeout_cycles=100059844)
    caravelEnv.drive_gpio_in(37, 0) # fpu control mode (0: la, 1:gpio)
    caravelEnv.drive_gpio_in(36, 0) # clk mode (0: la, 1:gpio)
    caravelEnv.drive_gpio_in((28,26), 4)  #opcode in gpio mode
    cocotb.log.info(f"[TEST] Start caravel fpu test")  
    # wait for start of sending
    await caravelEnv.release_csb()
    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] finish GPIO configuration") 

    #  
    await caravelEnv.wait_mgmt_gpio(0) #
    gpio_values = caravelEnv.monitor_gpio(37,0).binstr
    cocotb.log.info(f"[TEST] GPIO monitor: {gpio_values}")

    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] finish test") 






    
