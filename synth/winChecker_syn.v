
module winChecker ( reset, registers, winstate );
  input [17:0] registers;
  output [1:0] winstate;
  input reset;
  wire   N57, tie_0_, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168;

  latch_c_1x tie_reg_0_ ( .ph(n86), .d(N57), .q(tie_0_) );
  nor2_1x U91 ( .a(n168), .b(n167), .y(n86) );
  nand2_1x U92 ( .a(n134), .b(n133), .y(n92) );
  nand2_1x U93 ( .a(n147), .b(n148), .y(n94) );
  nor2_1x U94 ( .a(registers[14]), .b(n134), .y(n132) );
  inv_1x U95 ( .a(n124), .y(n127) );
  nor2_1x U96 ( .a(registers[15]), .b(registers[14]), .y(n87) );
  nor2_1x U97 ( .a(registers[4]), .b(registers[5]), .y(n96) );
  nor2_1x U98 ( .a(registers[17]), .b(registers[16]), .y(n97) );
  nand2_1x U99 ( .a(registers[2]), .b(n157), .y(n162) );
  inv_1x U100 ( .a(registers[10]), .y(n147) );
  inv_1x U101 ( .a(registers[14]), .y(n141) );
  nand2_1x U102 ( .a(registers[3]), .b(n157), .y(n154) );
  inv_1x U103 ( .a(registers[15]), .y(n140) );
  inv_1x U104 ( .a(registers[3]), .y(n133) );
  inv_1x U105 ( .a(registers[11]), .y(n148) );
  nor2_1x U106 ( .a(registers[13]), .b(n118), .y(n121) );
  inv_1x U107 ( .a(registers[2]), .y(n134) );
  inv_1x U108 ( .a(registers[5]), .y(n118) );
  inv_1x U109 ( .a(registers[16]), .y(n125) );
  inv_1x U110 ( .a(registers[12]), .y(n117) );
  nor2_1x U111 ( .a(registers[7]), .b(n139), .y(n100) );
  inv_1x U112 ( .a(registers[13]), .y(n139) );
  nor2_1x U113 ( .a(n98), .b(registers[12]), .y(n101) );
  inv_1x U114 ( .a(registers[6]), .y(n98) );
  nor2_1x U115 ( .a(registers[1]), .b(registers[0]), .y(n91) );
  inv_1x U116 ( .a(registers[7]), .y(n146) );
  a2o1_1x U117 ( .a(n98), .b(n146), .c(n87), .y(n90) );
  nor2_1x U118 ( .a(registers[9]), .b(registers[8]), .y(n88) );
  a2o1_1x U119 ( .a(n117), .b(n139), .c(n88), .y(n89) );
  nor3_1x U120 ( .a(n91), .b(n90), .c(n89), .y(n93) );
  nand3_1x U121 ( .a(n94), .b(n93), .c(n92), .y(n95) );
  nor3_1x U122 ( .a(n97), .b(n96), .c(n95), .y(N57) );
  mux2_c_1x U123 ( .d0(registers[7]), .d1(n139), .s(registers[1]), .y(n99) );
  nor3_1x U124 ( .a(n101), .b(n100), .c(n99), .y(n116) );
  mux2_c_1x U125 ( .d0(n117), .d1(registers[6]), .s(registers[0]), .y(n115) );
  inv_1x U126 ( .a(registers[1]), .y(n102) );
  nor2_1x U127 ( .a(n102), .b(registers[17]), .y(n105) );
  nor2_1x U128 ( .a(registers[0]), .b(n125), .y(n104) );
  mux2_c_1x U129 ( .d0(registers[17]), .d1(n102), .s(registers[9]), .y(n103)
         );
  nor3_1x U130 ( .a(n105), .b(n104), .c(n103), .y(n113) );
  inv_1x U131 ( .a(registers[0]), .y(n106) );
  mux2_c_1x U132 ( .d0(n106), .d1(registers[16]), .s(registers[8]), .y(n112)
         );
  inv_1x U133 ( .a(registers[4]), .y(n119) );
  nor2_1x U134 ( .a(registers[3]), .b(n118), .y(n107) );
  a2o1_1x U135 ( .a(registers[2]), .b(n119), .c(n107), .y(n110) );
  mux2_c_1x U136 ( .d0(registers[3]), .d1(n118), .s(registers[1]), .y(n109) );
  mux2_c_1x U137 ( .d0(registers[4]), .d1(n134), .s(registers[0]), .y(n108) );
  nor3_1x U138 ( .a(n110), .b(n109), .c(n108), .y(n111) );
  a2o1_1x U139 ( .a(n113), .b(n112), .c(n111), .y(n114) );
  a2o1_1x U140 ( .a(n116), .b(n115), .c(n114), .y(n166) );
  mux2_c_1x U141 ( .d0(n117), .d1(registers[4]), .s(registers[8]), .y(n131) );
  mux2_c_1x U142 ( .d0(registers[13]), .d1(n118), .s(registers[9]), .y(n122)
         );
  nor2_1x U143 ( .a(n119), .b(registers[12]), .y(n120) );
  nor3_1x U144 ( .a(n122), .b(n121), .c(n120), .y(n130) );
  nor2_1x U145 ( .a(registers[10]), .b(n125), .y(n123) );
  a2o1_1x U146 ( .a(n148), .b(registers[17]), .c(n123), .y(n128) );
  mux2_c_1x U147 ( .d0(n148), .d1(registers[17]), .s(registers[5]), .y(n124)
         );
  mux2_c_1x U148 ( .d0(registers[10]), .d1(n125), .s(registers[4]), .y(n126)
         );
  nor3_1x U149 ( .a(n128), .b(n127), .c(n126), .y(n129) );
  a2o1_1x U150 ( .a(n131), .b(n130), .c(n129), .y(n164) );
  a2o1_1x U151 ( .a(n133), .b(registers[15]), .c(n132), .y(n137) );
  mux2_c_1x U152 ( .d0(registers[14]), .d1(n134), .s(registers[8]), .y(n136)
         );
  mux2_c_1x U153 ( .d0(registers[3]), .d1(n140), .s(registers[9]), .y(n135) );
  nor3_1x U154 ( .a(n137), .b(n136), .c(n135), .y(n157) );
  nor2_1x U155 ( .a(registers[12]), .b(n141), .y(n138) );
  a2o1_1x U156 ( .a(n139), .b(registers[15]), .c(n138), .y(n144) );
  mux2_c_1x U157 ( .d0(registers[13]), .d1(n140), .s(registers[17]), .y(n143)
         );
  mux2_c_1x U158 ( .d0(registers[12]), .d1(n141), .s(registers[16]), .y(n142)
         );
  nor3_1x U159 ( .a(n144), .b(n143), .c(n142), .y(n158) );
  nand2_1x U160 ( .a(registers[13]), .b(n158), .y(n153) );
  nor2_1x U161 ( .a(registers[6]), .b(n147), .y(n145) );
  a2o1_1x U162 ( .a(n146), .b(registers[11]), .c(n145), .y(n151) );
  mux2_c_1x U163 ( .d0(registers[6]), .d1(n147), .s(registers[8]), .y(n150) );
  mux2_c_1x U164 ( .d0(registers[7]), .d1(n148), .s(registers[9]), .y(n149) );
  nor3_1x U165 ( .a(n151), .b(n150), .c(n149), .y(n159) );
  nand2_1x U166 ( .a(registers[7]), .b(n159), .y(n152) );
  nand3_1x U167 ( .a(n154), .b(n153), .c(n152), .y(n155) );
  a2o1_1x U168 ( .a(registers[5]), .b(n164), .c(n155), .y(n156) );
  a2o1_1x U169 ( .a(registers[1]), .b(n166), .c(n156), .y(n168) );
  nand2_1x U170 ( .a(registers[12]), .b(n158), .y(n161) );
  nand2_1x U171 ( .a(n159), .b(registers[6]), .y(n160) );
  nand3_1x U172 ( .a(n162), .b(n161), .c(n160), .y(n163) );
  a2o1_1x U173 ( .a(registers[4]), .b(n164), .c(n163), .y(n165) );
  a2o1_1x U174 ( .a(registers[0]), .b(n166), .c(n165), .y(n167) );
  or2_1x U175 ( .a(tie_0_), .b(n167), .y(winstate[0]) );
  or2_1x U176 ( .a(tie_0_), .b(n168), .y(winstate[1]) );
endmodule

