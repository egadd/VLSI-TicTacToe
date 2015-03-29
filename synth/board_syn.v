
module board ( ph1, ph2, reset, input_error, xoro, row, col, registers, 
        write_error );
  input [1:0] xoro;
  input [1:0] row;
  input [1:0] col;
  output [17:0] registers;
  input ph1, ph2, reset, input_error;
  output write_error;
  wire   n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137;
  wire   [1:0] boardmem0_d2;
  wire   [1:0] boardmem8_d2;
  wire   [1:0] boardmem7_d2;
  wire   [1:0] boardmem6_d2;
  wire   [1:0] boardmem5_d2;
  wire   [1:0] boardmem4_d2;
  wire   [1:0] boardmem3_d2;
  wire   [1:0] boardmem2_d2;
  wire   [1:0] boardmem1_d2;
  wire   [1:0] boardmem0_f_mid;
  wire   [1:0] boardmem8_f_mid;
  wire   [1:0] boardmem7_f_mid;
  wire   [1:0] boardmem6_f_mid;
  wire   [1:0] boardmem5_f_mid;
  wire   [1:0] boardmem4_f_mid;
  wire   [1:0] boardmem3_f_mid;
  wire   [1:0] boardmem2_f_mid;
  wire   [1:0] boardmem1_f_mid;

  latch_c_1x boardmem0_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem0_f_mid[1]), 
        .q(registers[1]) );
  latch_c_1x boardmem8_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem8_d2[1]), .q(
        boardmem8_f_mid[1]) );
  latch_c_1x boardmem8_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem8_f_mid[1]), 
        .q(registers[17]) );
  latch_c_1x boardmem8_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem8_d2[0]), .q(
        boardmem8_f_mid[0]) );
  latch_c_1x boardmem8_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem8_f_mid[0]), 
        .q(registers[16]) );
  latch_c_1x boardmem7_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem7_d2[1]), .q(
        boardmem7_f_mid[1]) );
  latch_c_1x boardmem7_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem7_f_mid[1]), 
        .q(registers[15]) );
  latch_c_1x boardmem7_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem7_d2[0]), .q(
        boardmem7_f_mid[0]) );
  latch_c_1x boardmem7_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem7_f_mid[0]), 
        .q(registers[14]) );
  latch_c_1x boardmem6_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem6_d2[1]), .q(
        boardmem6_f_mid[1]) );
  latch_c_1x boardmem6_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem6_f_mid[1]), 
        .q(registers[13]) );
  latch_c_1x boardmem6_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem6_d2[0]), .q(
        boardmem6_f_mid[0]) );
  latch_c_1x boardmem6_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem6_f_mid[0]), 
        .q(registers[12]) );
  latch_c_1x boardmem5_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem5_d2[1]), .q(
        boardmem5_f_mid[1]) );
  latch_c_1x boardmem5_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem5_f_mid[1]), 
        .q(registers[11]) );
  latch_c_1x boardmem5_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem5_d2[0]), .q(
        boardmem5_f_mid[0]) );
  latch_c_1x boardmem5_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem5_f_mid[0]), 
        .q(registers[10]) );
  latch_c_1x boardmem2_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem2_d2[1]), .q(
        boardmem2_f_mid[1]) );
  latch_c_1x boardmem2_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem2_f_mid[1]), 
        .q(registers[5]) );
  latch_c_1x boardmem2_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem2_d2[0]), .q(
        boardmem2_f_mid[0]) );
  latch_c_1x boardmem2_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem2_f_mid[0]), 
        .q(registers[4]) );
  latch_c_1x boardmem4_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem4_d2[1]), .q(
        boardmem4_f_mid[1]) );
  latch_c_1x boardmem4_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem4_f_mid[1]), 
        .q(registers[9]) );
  latch_c_1x boardmem4_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem4_d2[0]), .q(
        boardmem4_f_mid[0]) );
  latch_c_1x boardmem4_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem4_f_mid[0]), 
        .q(registers[8]) );
  latch_c_1x boardmem0_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem0_d2[0]), .q(
        boardmem0_f_mid[0]) );
  latch_c_1x boardmem0_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem0_f_mid[0]), 
        .q(registers[0]) );
  latch_c_1x boardmem1_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem1_d2[0]), .q(
        boardmem1_f_mid[0]) );
  latch_c_1x boardmem1_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem1_f_mid[0]), 
        .q(registers[2]) );
  latch_c_1x boardmem1_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem1_d2[1]), .q(
        boardmem1_f_mid[1]) );
  latch_c_1x boardmem1_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem1_f_mid[1]), 
        .q(registers[3]) );
  latch_c_1x boardmem3_f_master_q_reg_0_ ( .ph(ph2), .d(boardmem3_d2[0]), .q(
        boardmem3_f_mid[0]) );
  latch_c_1x boardmem3_f_slave_q_reg_0_ ( .ph(ph1), .d(boardmem3_f_mid[0]), 
        .q(registers[6]) );
  latch_c_1x boardmem3_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem3_d2[1]), .q(
        boardmem3_f_mid[1]) );
  latch_c_1x boardmem3_f_slave_q_reg_1_ ( .ph(ph1), .d(boardmem3_f_mid[1]), 
        .q(registers[7]) );
  latch_c_1x boardmem0_f_master_q_reg_1_ ( .ph(ph2), .d(boardmem0_d2[1]), .q(
        boardmem0_f_mid[1]) );
  inv_4x U91 ( .a(n81), .y(n124) );
  nor2_1x U92 ( .a(n120), .b(n114), .y(n111) );
  nor2_1x U93 ( .a(n124), .b(n114), .y(n104) );
  nor2_1x U94 ( .a(n112), .b(n124), .y(n101) );
  nor2_1x U95 ( .a(n120), .b(n112), .y(n110) );
  nor2_2x U96 ( .a(row[1]), .b(n86), .y(n98) );
  nor2_2x U97 ( .a(col[1]), .b(n91), .y(n95) );
  nand2_2x U98 ( .a(row[0]), .b(n115), .y(n120) );
  nand2_2x U99 ( .a(col[0]), .b(n116), .y(n128) );
  inv_4x U100 ( .a(row[1]), .y(n99) );
  inv_4x U101 ( .a(col[1]), .y(n122) );
  nor2_2x U102 ( .a(row[0]), .b(col[0]), .y(n81) );
  inv_4x U103 ( .a(row[0]), .y(n116) );
  inv_4x U104 ( .a(col[0]), .y(n115) );
  nor2_2x U105 ( .a(xoro[0]), .b(xoro[1]), .y(n96) );
  nor2_1x U106 ( .a(n128), .b(n112), .y(n105) );
  nor2_1x U107 ( .a(n128), .b(n114), .y(n106) );
  nand2_1x U108 ( .a(n130), .b(n99), .y(n107) );
  nor2_2x U109 ( .a(n135), .b(n134), .y(n136) );
  nor2_2x U110 ( .a(n132), .b(n134), .y(n133) );
  inv_4x U111 ( .a(n135), .y(n102) );
  nand2_1x U112 ( .a(xoro[1]), .b(n137), .y(n135) );
  nor2_1x U113 ( .a(col[1]), .b(n107), .y(n103) );
  nor2_1x U114 ( .a(input_error), .b(write_error), .y(n130) );
  inv_4x U115 ( .a(n132), .y(n100) );
  nand2_1x U116 ( .a(n137), .b(xoro[0]), .y(n132) );
  inv_4x U117 ( .a(reset), .y(n137) );
  inv_4x U118 ( .a(n131), .y(n93) );
  nor2_2x U119 ( .a(n124), .b(n122), .y(n131) );
  nor2_2x U120 ( .a(n124), .b(n88), .y(n89) );
  nor2_2x U121 ( .a(n128), .b(n87), .y(n90) );
  nor2_2x U122 ( .a(n128), .b(n76), .y(n83) );
  nor2_2x U123 ( .a(n120), .b(n73), .y(n74) );
  nor2_2x U124 ( .a(n124), .b(n72), .y(n75) );
  nand2_2x U125 ( .a(n103), .b(n102), .y(n114) );
  nand2_2x U126 ( .a(n100), .b(n103), .y(n112) );
  nor2_2x U127 ( .a(n93), .b(n92), .y(n94) );
  nor2_2x U128 ( .a(n90), .b(n89), .y(n91) );
  nor2_2x U129 ( .a(n85), .b(n84), .y(n86) );
  nor2_1x U130 ( .a(registers[5]), .b(registers[4]), .y(n72) );
  nor2_1x U131 ( .a(registers[11]), .b(registers[10]), .y(n73) );
  nor3_1x U132 ( .a(n75), .b(n74), .c(n122), .y(n85) );
  nor2_1x U133 ( .a(registers[3]), .b(registers[2]), .y(n76) );
  or2_1x U134 ( .a(registers[1]), .b(registers[0]), .y(n80) );
  nor3_1x U135 ( .a(registers[9]), .b(registers[8]), .c(n115), .y(n78) );
  nor3_1x U136 ( .a(col[0]), .b(registers[6]), .c(registers[7]), .y(n77) );
  nor3_1x U137 ( .a(n78), .b(n77), .c(n116), .y(n79) );
  a2o1_1x U138 ( .a(n81), .b(n80), .c(n79), .y(n82) );
  nor3_1x U139 ( .a(n83), .b(n82), .c(col[1]), .y(n84) );
  nor2_1x U140 ( .a(registers[15]), .b(registers[14]), .y(n87) );
  nor2_1x U141 ( .a(registers[13]), .b(registers[12]), .y(n88) );
  nor2_1x U142 ( .a(registers[17]), .b(registers[16]), .y(n92) );
  nor3_1x U143 ( .a(n95), .b(n94), .c(n99), .y(n97) );
  nor3_1x U144 ( .a(n98), .b(n97), .c(n96), .y(write_error) );
  a2o1_1x U145 ( .a(registers[0]), .b(n137), .c(n101), .y(boardmem0_d2[0]) );
  a2o1_1x U146 ( .a(registers[1]), .b(n137), .c(n104), .y(boardmem0_d2[1]) );
  a2o1_1x U147 ( .a(registers[2]), .b(n137), .c(n105), .y(boardmem1_d2[0]) );
  a2o1_1x U148 ( .a(registers[3]), .b(n137), .c(n106), .y(boardmem1_d2[1]) );
  or2_1x U149 ( .a(n122), .b(n107), .y(n119) );
  nor3_1x U150 ( .a(n124), .b(n132), .c(n119), .y(n108) );
  a2o1_1x U151 ( .a(registers[4]), .b(n137), .c(n108), .y(boardmem2_d2[0]) );
  nor3_1x U152 ( .a(n124), .b(n135), .c(n119), .y(n109) );
  a2o1_1x U153 ( .a(registers[5]), .b(n137), .c(n109), .y(boardmem2_d2[1]) );
  a2o1_1x U154 ( .a(registers[6]), .b(n137), .c(n110), .y(boardmem3_d2[0]) );
  a2o1_1x U155 ( .a(registers[7]), .b(n137), .c(n111), .y(boardmem3_d2[1]) );
  nor3_1x U156 ( .a(n116), .b(n115), .c(n112), .y(n113) );
  a2o1_1x U157 ( .a(registers[8]), .b(n137), .c(n113), .y(boardmem4_d2[0]) );
  nor3_1x U158 ( .a(n116), .b(n115), .c(n114), .y(n117) );
  a2o1_1x U159 ( .a(registers[9]), .b(n137), .c(n117), .y(boardmem4_d2[1]) );
  nor3_1x U160 ( .a(n132), .b(n120), .c(n119), .y(n118) );
  a2o1_1x U161 ( .a(registers[10]), .b(n137), .c(n118), .y(boardmem5_d2[0]) );
  nor3_1x U162 ( .a(n120), .b(n135), .c(n119), .y(n121) );
  a2o1_1x U163 ( .a(registers[11]), .b(n137), .c(n121), .y(boardmem5_d2[1]) );
  nand3_1x U164 ( .a(row[1]), .b(n130), .c(n122), .y(n127) );
  nor3_1x U165 ( .a(n124), .b(n132), .c(n127), .y(n123) );
  a2o1_1x U166 ( .a(registers[12]), .b(n137), .c(n123), .y(boardmem6_d2[0]) );
  nor3_1x U167 ( .a(n124), .b(n135), .c(n127), .y(n125) );
  a2o1_1x U168 ( .a(registers[13]), .b(n137), .c(n125), .y(boardmem6_d2[1]) );
  nor3_1x U169 ( .a(n132), .b(n128), .c(n127), .y(n126) );
  a2o1_1x U170 ( .a(registers[14]), .b(n137), .c(n126), .y(boardmem7_d2[0]) );
  nor3_1x U171 ( .a(n128), .b(n135), .c(n127), .y(n129) );
  a2o1_1x U172 ( .a(registers[15]), .b(n137), .c(n129), .y(boardmem7_d2[1]) );
  nand3_1x U173 ( .a(row[1]), .b(n131), .c(n130), .y(n134) );
  a2o1_1x U174 ( .a(registers[16]), .b(n137), .c(n133), .y(boardmem8_d2[0]) );
  a2o1_1x U175 ( .a(registers[17]), .b(n137), .c(n136), .y(boardmem8_d2[1]) );
endmodule

