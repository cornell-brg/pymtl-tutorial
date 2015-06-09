//--------------------------------------
// RegIncrRTL_0x7a355c5a216e72a4
//--------------------------------------
// dtype: 8
// dump-vcd: False
`default_nettype none
module RegIncrRTL_0x7a355c5a216e72a4
(
  input  wire [   0:0] clk,
  input  wire [   7:0] in_,
  output reg  [   7:0] out,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] tmp;



  // PYMTL SOURCE:
  //
  // @s.tick_rtl
  // def seq_logic():
  //         s.tmp.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    tmp <= in_;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //         s.out.value = s.tmp + 1

  // logic for comb_logic()
  always @ (*) begin
    out = (tmp+1);
  end


endmodule // RegIncrRTL_0x7a355c5a216e72a4
`default_nettype wire

