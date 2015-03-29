
module ai ( registers, xoro, row, col );
  input [17:0] registers;
  output [1:0] xoro;
  output [1:0] row;
  output [1:0] col;
  wire   n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164;

  inv_2x U88 ( .a(1'b1), .y(xoro[0]) );
  inv_2x U90 ( .a(1'b0), .y(xoro[1]) );
  nor2_1x U94 ( .a(n131), .b(n130), .y(n132) );
  nand2_1x U95 ( .a(n93), .b(n109), .y(n130) );
  nor2_1x U96 ( .a(n115), .b(n90), .y(n133) );
  nor2_1x U97 ( .a(n140), .b(n89), .y(n90) );
  nor2_1x U98 ( .a(n148), .b(n112), .y(n89) );
  nand2_1x U99 ( .a(n144), .b(n126), .y(n127) );
  nor2_1x U100 ( .a(n123), .b(n135), .y(n125) );
  nand2_1x U101 ( .a(n153), .b(n121), .y(n122) );
  inv_1x U102 ( .a(n161), .y(n129) );
  inv_1x U103 ( .a(n158), .y(n160) );
  nand2_1x U104 ( .a(n109), .b(n103), .y(n124) );
  nand2_1x U105 ( .a(n154), .b(n153), .y(n155) );
  nand2_1x U106 ( .a(n149), .b(n148), .y(n150) );
  nor2_1x U107 ( .a(n135), .b(n116), .y(n149) );
  nand2_1x U108 ( .a(n148), .b(n141), .y(n156) );
  nand2_1x U109 ( .a(n142), .b(n140), .y(n157) );
  nor2_1x U110 ( .a(n100), .b(n141), .y(n140) );
  nor2_1x U111 ( .a(n139), .b(n138), .y(n142) );
  inv_1x U112 ( .a(n141), .y(n131) );
  nand2_1x U113 ( .a(n120), .b(n123), .y(n141) );
  inv_4x U114 ( .a(registers[10]), .y(n120) );
  inv_1x U115 ( .a(n159), .y(n118) );
  inv_1x U116 ( .a(n145), .y(n112) );
  inv_1x U117 ( .a(n109), .y(n114) );
  nand2_1x U118 ( .a(n146), .b(n107), .y(n116) );
  inv_1x U119 ( .a(n100), .y(n146) );
  nand2_1x U120 ( .a(n109), .b(n108), .y(n119) );
  nand2_1x U121 ( .a(n103), .b(n102), .y(n104) );
  inv_1x U122 ( .a(n135), .y(n121) );
  nor2_1x U123 ( .a(n100), .b(n147), .y(n103) );
  inv_1x U124 ( .a(n101), .y(n144) );
  inv_1x U125 ( .a(n99), .y(n110) );
  nand2_1x U126 ( .a(n153), .b(n139), .y(n99) );
  inv_1x U127 ( .a(n94), .y(n139) );
  inv_1x U128 ( .a(n93), .y(n153) );
  inv_1x U129 ( .a(n138), .y(n107) );
  nor2_1x U130 ( .a(n115), .b(n148), .y(n109) );
  nor2_2x U131 ( .a(registers[1]), .b(registers[0]), .y(n115) );
  nor2_1x U132 ( .a(registers[10]), .b(n123), .y(n145) );
  nor2_1x U133 ( .a(registers[7]), .b(registers[6]), .y(n135) );
  nor2_1x U134 ( .a(registers[17]), .b(registers[16]), .y(n147) );
  nor2_1x U135 ( .a(registers[3]), .b(registers[2]), .y(n101) );
  nor2_1x U136 ( .a(registers[15]), .b(registers[14]), .y(n94) );
  nor2_1x U137 ( .a(registers[9]), .b(registers[8]), .y(n93) );
  nor2_1x U138 ( .a(registers[5]), .b(registers[4]), .y(n100) );
  nor2_1x U139 ( .a(registers[11]), .b(registers[10]), .y(n138) );
  nor2_1x U140 ( .a(registers[12]), .b(registers[13]), .y(n148) );
  inv_4x U141 ( .a(n115), .y(n164) );
  inv_1x U142 ( .a(registers[13]), .y(n88) );
  a2o1_1x U143 ( .a(registers[6]), .b(n88), .c(registers[12]), .y(n123) );
  nand3_1x U144 ( .a(n133), .b(n107), .c(n99), .y(n98) );
  and2_1x U145 ( .a(n149), .b(n131), .y(n91) );
  a2o1_1x U146 ( .a(n145), .b(n107), .c(n91), .y(n92) );
  nand3_1x U147 ( .a(n109), .b(n101), .c(n92), .y(n97) );
  nand3_1x U148 ( .a(n153), .b(n121), .c(n94), .y(n158) );
  a2o1_1x U149 ( .a(n101), .b(n158), .c(n124), .y(n95) );
  a2o1_1x U150 ( .a(n130), .b(n95), .c(n120), .y(n96) );
  nand3_1x U151 ( .a(n98), .b(n97), .c(n96), .y(col[0]) );
  nand3_1x U152 ( .a(n100), .b(n110), .c(n144), .y(n106) );
  nand3_1x U153 ( .a(n121), .b(n101), .c(n139), .y(n102) );
  nand3_1x U154 ( .a(registers[10]), .b(n153), .c(n104), .y(n105) );
  nand3_1x U155 ( .a(n107), .b(n106), .c(n105), .y(n108) );
  nand3_1x U156 ( .a(n147), .b(n110), .c(n144), .y(n111) );
  a2o1_1x U157 ( .a(n135), .b(n112), .c(n111), .y(n113) );
  nor3_1x U158 ( .a(n116), .b(n114), .c(n113), .y(n159) );
  nand3_1x U159 ( .a(n131), .b(n164), .c(n116), .y(n117) );
  nand3_1x U160 ( .a(n119), .b(n118), .c(n117), .y(col[1]) );
  nor3_1x U161 ( .a(n120), .b(n144), .c(n124), .y(n161) );
  nand3_1x U162 ( .a(n140), .b(n164), .c(n122), .y(n128) );
  nor3_1x U163 ( .a(n125), .b(registers[10]), .c(n124), .y(n126) );
  nand3_1x U164 ( .a(n129), .b(n128), .c(n127), .y(n137) );
  a2o1_1x U165 ( .a(n133), .b(n138), .c(n132), .y(n134) );
  a2o1_1x U166 ( .a(n135), .b(n161), .c(n134), .y(n136) );
  a2o1_1x U167 ( .a(n139), .b(n137), .c(n136), .y(row[0]) );
  or2_1x U168 ( .a(n142), .b(n149), .y(n143) );
  nand3_1x U169 ( .a(n145), .b(n144), .c(n143), .y(n152) );
  nand3_1x U170 ( .a(registers[10]), .b(n147), .c(n146), .y(n151) );
  nand3_1x U171 ( .a(n152), .b(n151), .c(n150), .y(n154) );
  nand3_1x U172 ( .a(n157), .b(n156), .c(n155), .y(n163) );
  a2o1_1x U173 ( .a(n161), .b(n160), .c(n159), .y(n162) );
  a2o1_1x U174 ( .a(n164), .b(n163), .c(n162), .y(row[1]) );
endmodule

