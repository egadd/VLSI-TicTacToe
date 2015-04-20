
module outputController ( ph1, ph2, reset, registers, xoro, row, col );
  input [17:0] registers;
  output [1:0] xoro;
  output [1:0] row;
  output [1:0] col;
  input ph1, ph2, reset;
  wire   n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98;
  wire   [3:0] state;
  wire   [3:0] statereg_d2;
  wire   [3:0] statereg_f_mid;

  latch_c_1x statereg_f_slave_q_reg_3_ ( .ph(ph1), .d(statereg_f_mid[3]), .q(
        state[3]) );
  latch_c_1x statereg_f_master_q_reg_0_ ( .ph(ph2), .d(statereg_d2[0]), .q(
        statereg_f_mid[0]) );
  latch_c_1x statereg_f_slave_q_reg_0_ ( .ph(ph1), .d(statereg_f_mid[0]), .q(
        state[0]) );
  latch_c_1x statereg_f_master_q_reg_1_ ( .ph(ph2), .d(statereg_d2[1]), .q(
        statereg_f_mid[1]) );
  latch_c_1x statereg_f_slave_q_reg_1_ ( .ph(ph1), .d(statereg_f_mid[1]), .q(
        state[1]) );
  latch_c_1x statereg_f_master_q_reg_2_ ( .ph(ph2), .d(statereg_d2[2]), .q(
        statereg_f_mid[2]) );
  latch_c_1x statereg_f_slave_q_reg_2_ ( .ph(ph1), .d(statereg_f_mid[2]), .q(
        state[2]) );
  latch_c_1x statereg_f_master_q_reg_3_ ( .ph(ph2), .d(statereg_d2[3]), .q(
        statereg_f_mid[3]) );
  nor3_1x U61 ( .a(state[1]), .b(state[2]), .c(state[0]), .y(n64) );
  inv_1x U62 ( .a(n79), .y(n61) );
  inv_1x U63 ( .a(row[0]), .y(n59) );
  inv_1x U64 ( .a(n62), .y(n56) );
  nand2_1x U65 ( .a(registers[0]), .b(n98), .y(n66) );
  nand2_1x U66 ( .a(n93), .b(registers[2]), .y(n68) );
  nand2_1x U67 ( .a(n93), .b(registers[3]), .y(n94) );
  nand2_1x U68 ( .a(n86), .b(registers[17]), .y(n87) );
  nand2_1x U69 ( .a(n85), .b(registers[7]), .y(n88) );
  nand2_1x U70 ( .a(n84), .b(registers[5]), .y(n89) );
  nor2_1x U71 ( .a(n86), .b(n65), .y(n98) );
  nand2_2x U72 ( .a(registers[10]), .b(n80), .y(n69) );
  nand2_2x U73 ( .a(n79), .b(registers[14]), .y(n70) );
  nand2_2x U74 ( .a(n78), .b(registers[8]), .y(n71) );
  nand2_2x U75 ( .a(registers[11]), .b(n80), .y(n81) );
  nand2_2x U76 ( .a(n79), .b(registers[15]), .y(n82) );
  nand2_1x U77 ( .a(state[0]), .b(n55), .y(n57) );
  nand2_2x U78 ( .a(n78), .b(registers[9]), .y(n83) );
  nor2_1x U79 ( .a(reset), .b(n61), .y(statereg_d2[3]) );
  nor2_1x U80 ( .a(reset), .b(n63), .y(statereg_d2[0]) );
  inv_4x U81 ( .a(n51), .y(col[1]) );
  nor2_2x U82 ( .a(n63), .b(n62), .y(n92) );
  nor2_2x U83 ( .a(n63), .b(n52), .y(n78) );
  inv_4x U84 ( .a(n50), .y(col[0]) );
  nor2_2x U85 ( .a(n74), .b(n73), .y(n76) );
  nand2_2x U86 ( .a(n92), .b(registers[12]), .y(n67) );
  nand2_2x U87 ( .a(n92), .b(registers[13]), .y(n95) );
  nor2_2x U88 ( .a(n91), .b(n90), .y(n96) );
  nor2_2x U89 ( .a(n57), .b(n52), .y(n80) );
  nor2_2x U90 ( .a(n57), .b(n62), .y(n79) );
  nand2_1x U91 ( .a(state[2]), .b(state[1]), .y(n62) );
  inv_1x U92 ( .a(state[3]), .y(n55) );
  inv_1x U93 ( .a(state[1]), .y(n53) );
  nor3_1x U94 ( .a(state[2]), .b(state[1]), .c(n57), .y(n93) );
  or2_1x U95 ( .a(state[3]), .b(state[0]), .y(n63) );
  nand2_1x U96 ( .a(state[2]), .b(n53), .y(n52) );
  nor3_1x U97 ( .a(n93), .b(n78), .c(n79), .y(n50) );
  and2_1x U98 ( .a(state[3]), .b(n64), .y(n86) );
  nor3_1x U99 ( .a(state[2]), .b(n53), .c(n63), .y(n84) );
  nor3_1x U100 ( .a(n86), .b(n84), .c(n80), .y(n51) );
  inv_1x U101 ( .a(n52), .y(n54) );
  nor3_1x U102 ( .a(state[2]), .b(n53), .c(n57), .y(n85) );
  a2o1_1x U103 ( .a(n54), .b(n55), .c(n85), .y(row[0]) );
  a2o1_1x U104 ( .a(n56), .b(n55), .c(n86), .y(row[1]) );
  nor3_1x U105 ( .a(reset), .b(state[1]), .c(n57), .y(n58) );
  a2o1_1x U106 ( .a(state[1]), .b(statereg_d2[0]), .c(n58), .y(statereg_d2[1])
         );
  nor2_1x U107 ( .a(reset), .b(n59), .y(n60) );
  a2o1_1x U108 ( .a(statereg_d2[0]), .b(state[2]), .c(n60), .y(statereg_d2[2])
         );
  nand2_1x U109 ( .a(n85), .b(registers[6]), .y(n77) );
  nor2_1x U110 ( .a(state[3]), .b(n64), .y(n65) );
  nand3_1x U111 ( .a(n68), .b(n67), .c(n66), .y(n74) );
  nand3_1x U112 ( .a(n71), .b(n70), .c(n69), .y(n72) );
  a2o1_1x U113 ( .a(registers[4]), .b(n84), .c(n72), .y(n73) );
  nand2_1x U114 ( .a(registers[16]), .b(n86), .y(n75) );
  nand3_1x U115 ( .a(n77), .b(n76), .c(n75), .y(xoro[0]) );
  nand3_1x U116 ( .a(n83), .b(n82), .c(n81), .y(n91) );
  nand3_1x U117 ( .a(n89), .b(n88), .c(n87), .y(n90) );
  nand3_1x U118 ( .a(n96), .b(n95), .c(n94), .y(n97) );
  a2o1_1x U119 ( .a(n98), .b(registers[1]), .c(n97), .y(xoro[1]) );
endmodule

