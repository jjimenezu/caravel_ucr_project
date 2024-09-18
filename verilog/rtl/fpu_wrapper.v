`default_nettype none

module fpu_wrapper (
                `ifdef USE_POWER_PINS
                    inout vccd1,	// User area 1 1.8V supply
                    inout vssd1,	// User area 1 digital ground
                `endif

                    // Wishbone Slave ports (WB MI A)
                    input wb_clk_i,
                    input wb_rst_i,
                    // input wbs_stb_i,
                    // input wbs_cyc_i,
                    // input wbs_we_i,
                    // input [3:0] wbs_sel_i,
                    // input [31:0] wbs_dat_i,
                    // input [31:0] wbs_adr_i,
                    // output wbs_ack_o,
                    // output [31:0] wbs_dat_o,

                    // Logic Analyzer Signals
                    input  [127:0] la_data_in,
                    output [127:0] la_data_out,
                    //input  [127:0] la_oenb,

                    // IOs
                    input  [37:5] io_in,
                    output [37:5] io_out,
                    output [37:5] io_oeb

                    // IRQ
                    //output [2:0] irq
);
    
    //***** FPU interface *****//
    // inputs
    wire [31:0] in1p, in2p;
    wire clk, rstp, act;
    wire [2:0] round_mp;    // rounding mode selector
    wire [2:0] opcode;      // 1 = mul, 0 = add, 2 = division, 3 = square root, 4 = compare
    // outputs
    wire [31:0] out;
    wire ov,un,less,eq,great,done,inv,inexact,div_zero;

    //***** Interface maping *****//
    ////inputs
    assign in1p     = la_data_in[31:0];
    assign in2p     = la_data_in[63:32];
    // assign clk      = wb_clk_i;
    // assign rstp     = la_data_in[65];
    // assign act      = la_data_in[66];
    // assign opcode   = la_data_in[70:68];
    // assign round_mp = la_data_in[74:72];
    assign clk      = (io_in[36]) ? io_in[23] : wb_clk_i;
    assign rstp     = (io_in[37]) ? io_in[24] : la_data_in[65];
    assign act      = (io_in[37]) ? io_in[25] : la_data_in[66];
    assign opcode   = (io_in[37]) ? io_in[28:26] : la_data_in[70:68];
    assign round_mp = (io_in[37]) ? io_in[31:29] : la_data_in[74:72];
    //outputs
    assign la_data_out[127:96] = out;
    assign la_data_out[95] = done ;
    assign la_data_out[94] = inexact;
    assign la_data_out[93] = ov;
    assign la_data_out[92] = un;
    assign la_data_out[91] = less;
    assign la_data_out[90] = eq;
    assign la_data_out[89] = great;
    assign la_data_out[88] = inv;
    assign la_data_out[87] = div_zero;
    //
    assign io_out[13] = done ;
    assign io_out[12] = inexact;
    assign io_out[11] = ov;
    assign io_out[10] = un;
    assign io_out[9] = less;
    assign io_out[8] = eq;
    assign io_out[7] = great;
    assign io_out[6] = inv;
    assign io_out[5] = div_zero;
    //
    assign io_out[22:20] = round_mp ;
    assign io_out[19:17] = opcode;
    assign io_out[16] = act;
    assign io_out[15] = rstp;
    assign io_out[14] = clk;
    //
    assign io_oeb[37:5] = 33'b11_0000_111111111_000000000_000000000;

    //
    fpu  fpu1(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),	// User area 1 1.8V power
            .vssd1(vssd1),	// User area 1 digital ground
        `endif
        .clk(clk),
        .in1p(in1p),
        .in2p(in2p),
        .out(out),
        .ov(ov),
        .un(un),
        .opcode(opcode),
        .rstp(rstp),
        .eq(eq),
        .great(great),
        .less(less),
        .round_mp(round_mp),
        .act(act),
        .done(done),
        .inv(inv),
        .div_zero(div_zero),
        .inexact(inexact)
    );


endmodule

`default_nettype wire