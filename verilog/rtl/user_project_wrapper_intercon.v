// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper_intercon #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

// all fp_* macros
wire rstp = la_data_in[65];
wire act  = la_data_in[66];
wire [2:0] round_mp = la_data_in[72:70];     // rounding mode selector

// fp_add
wire [31:0] in1pa, in2pa, aout;
wire aov,aun,adone,inva,inexacta;

//fp_comp
wire [31:0] in1pc,in2pc;
wire eq0,great0,less0,invc,cdone;



fpu_interconnect fpu_intercon (
    `ifdef USE_POWER_PINS
        .vccd1(vccd1),	// User area 1 1.8V power
        .vssd1(vssd1),	// User area 1 digital ground
    `endif

    //***** user_project_wrapper interface *****//
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    // MGMT SoC Wishbone Slave
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),
    // Logic Analyzer
    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb (la_oenb),
    // IO Pads
    .io_in (io_in[37:6]),
    .io_out(io_in[37:6]),
    .io_oeb(io_in[37:6]),
    // IRQ
    .irq(user_irq),

    //fp_add
    .in1pa(in1pa),
    .in2pa(in2pa),
    .aout(aout),
    .aov(aov),
    .aun(aun),
    .inva(inva),
    .inexacta(inexacta),
    .adone(adone),

    //fp_comp
    .in1pc(in1pc),
    .in2pc(in2pc),
    .eq0(eq0),
    .less0(less0),
    .great0(great0),
    .invc(invc),
    .cdone(cdone)
);


//add
fp_add addu(
    `ifdef USE_POWER_PINS
        .vccd1(vccd1),	// User area 1 1.8V power
        .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .in1(in1pa),
    .in2(in2pa),
    .out(aout),
    .ov(aov),
    .un(aun),
    .clk(wb_clk_i),
    .rst(rstp),
    .round_m(round_mp),
    .done(adone),
    .inv(inva),
    .inexact(inexacta)
);


//compare
  fp_comp com1(
`ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V power
    .vssd1(vssd1),	// User area 1 digital ground
`endif
.in1(in1pc),
.in2(in2pc),
.eq(eq0),
.great(great0),
.less(less0),
.act(act),
.done(cdone),
.clk(wb_clk_i),
.rst(rstp),
.inv(invc));

endmodule	// user_project_wrapper

`default_nettype wire