
module synth_block ( ph1, ph2, reset, input_error, row_write, col_write, 
        xoro_write, row_ai, col_ai, row_out, col_out, xoro_out, win, 
        write_error );
  input [1:0] row_write;
  input [1:0] col_write;
  input [1:0] xoro_write;
  output [1:0] row_ai;
  output [1:0] col_ai;
  output [1:0] row_out;
  output [1:0] col_out;
  output [1:0] xoro_out;
  output [1:0] win;
  input ph1, ph2, reset, input_error;
  output write_error;
  wire   outcon_state_0_, outcon_state_1_, outcon_state_2_, outcon_state_3_,
         wc_tie_1_, wc_N57, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517;
  wire   [17:0] registers;
  wire   [1:0] b_boardmem0_d2;
  wire   [3:0] outcon_statereg_d2;
  wire   [1:0] b_boardmem8_d2;
  wire   [1:0] b_boardmem7_d2;
  wire   [1:0] b_boardmem6_d2;
  wire   [1:0] b_boardmem5_d2;
  wire   [1:0] b_boardmem4_d2;
  wire   [1:0] b_boardmem3_d2;
  wire   [1:0] b_boardmem2_d2;
  wire   [1:0] b_boardmem1_d2;
  wire   [1:0] b_boardmem0_f_mid;
  wire   [3:0] outcon_statereg_f_mid;
  wire   [1:0] b_boardmem8_f_mid;
  wire   [1:0] b_boardmem7_f_mid;
  wire   [1:0] b_boardmem6_f_mid;
  wire   [1:0] b_boardmem5_f_mid;
  wire   [1:0] b_boardmem4_f_mid;
  wire   [1:0] b_boardmem3_f_mid;
  wire   [1:0] b_boardmem2_f_mid;
  wire   [1:0] b_boardmem1_f_mid;

  latch_c_1x b_boardmem0_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem0_f_mid[1]), 
        .q(registers[1]) );
  latch_c_1x b_boardmem8_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem8_d2[1]), 
        .q(b_boardmem8_f_mid[1]) );
  latch_c_1x b_boardmem8_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem8_f_mid[1]), 
        .q(registers[17]) );
  latch_c_1x b_boardmem8_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem8_d2[0]), 
        .q(b_boardmem8_f_mid[0]) );
  latch_c_1x b_boardmem8_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem8_f_mid[0]), 
        .q(registers[16]) );
  latch_c_1x b_boardmem7_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem7_d2[1]), 
        .q(b_boardmem7_f_mid[1]) );
  latch_c_1x b_boardmem7_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem7_f_mid[1]), 
        .q(registers[15]) );
  latch_c_1x b_boardmem7_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem7_d2[0]), 
        .q(b_boardmem7_f_mid[0]) );
  latch_c_1x b_boardmem7_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem7_f_mid[0]), 
        .q(registers[14]) );
  latch_c_1x b_boardmem6_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem6_d2[1]), 
        .q(b_boardmem6_f_mid[1]) );
  latch_c_1x b_boardmem6_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem6_f_mid[1]), 
        .q(registers[13]) );
  latch_c_1x b_boardmem6_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem6_d2[0]), 
        .q(b_boardmem6_f_mid[0]) );
  latch_c_1x b_boardmem6_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem6_f_mid[0]), 
        .q(registers[12]) );
  latch_c_1x b_boardmem5_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem5_d2[1]), 
        .q(b_boardmem5_f_mid[1]) );
  latch_c_1x b_boardmem5_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem5_f_mid[1]), 
        .q(registers[11]) );
  latch_c_1x b_boardmem5_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem5_d2[0]), 
        .q(b_boardmem5_f_mid[0]) );
  latch_c_1x b_boardmem5_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem5_f_mid[0]), 
        .q(registers[10]) );
  latch_c_1x b_boardmem2_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem2_d2[1]), 
        .q(b_boardmem2_f_mid[1]) );
  latch_c_1x b_boardmem2_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem2_f_mid[1]), 
        .q(registers[5]) );
  latch_c_1x b_boardmem2_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem2_d2[0]), 
        .q(b_boardmem2_f_mid[0]) );
  latch_c_1x b_boardmem2_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem2_f_mid[0]), 
        .q(registers[4]) );
  latch_c_1x b_boardmem4_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem4_d2[1]), 
        .q(b_boardmem4_f_mid[1]) );
  latch_c_1x b_boardmem4_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem4_f_mid[1]), 
        .q(registers[9]) );
  latch_c_1x b_boardmem4_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem4_d2[0]), 
        .q(b_boardmem4_f_mid[0]) );
  latch_c_1x b_boardmem4_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem4_f_mid[0]), 
        .q(registers[8]) );
  latch_c_1x b_boardmem3_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem3_d2[1]), 
        .q(b_boardmem3_f_mid[1]) );
  latch_c_1x b_boardmem3_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem3_f_mid[1]), 
        .q(registers[7]) );
  latch_c_1x b_boardmem3_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem3_d2[0]), 
        .q(b_boardmem3_f_mid[0]) );
  latch_c_1x b_boardmem3_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem3_f_mid[0]), 
        .q(registers[6]) );
  latch_c_1x b_boardmem1_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem1_d2[1]), 
        .q(b_boardmem1_f_mid[1]) );
  latch_c_1x b_boardmem1_f_slave_q_reg_1_ ( .ph(ph1), .d(b_boardmem1_f_mid[1]), 
        .q(registers[3]) );
  latch_c_1x b_boardmem1_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem1_d2[0]), 
        .q(b_boardmem1_f_mid[0]) );
  latch_c_1x b_boardmem1_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem1_f_mid[0]), 
        .q(registers[2]) );
  latch_c_1x b_boardmem0_f_master_q_reg_0_ ( .ph(ph2), .d(b_boardmem0_d2[0]), 
        .q(b_boardmem0_f_mid[0]) );
  latch_c_1x b_boardmem0_f_slave_q_reg_0_ ( .ph(ph1), .d(b_boardmem0_f_mid[0]), 
        .q(registers[0]) );
  latch_c_1x b_boardmem0_f_master_q_reg_1_ ( .ph(ph2), .d(b_boardmem0_d2[1]), 
        .q(b_boardmem0_f_mid[1]) );
  latch_c_1x wc_tie_reg_1_ ( .ph(n260), .d(wc_N57), .q(wc_tie_1_) );
  latch_c_1x outcon_statereg_f_slave_q_reg_3_ ( .ph(ph1), .d(
        outcon_statereg_f_mid[3]), .q(outcon_state_3_) );
  latch_c_1x outcon_statereg_f_master_q_reg_0_ ( .ph(ph2), .d(
        outcon_statereg_d2[0]), .q(outcon_statereg_f_mid[0]) );
  latch_c_1x outcon_statereg_f_slave_q_reg_0_ ( .ph(ph1), .d(
        outcon_statereg_f_mid[0]), .q(outcon_state_0_) );
  latch_c_1x outcon_statereg_f_master_q_reg_1_ ( .ph(ph2), .d(
        outcon_statereg_d2[1]), .q(outcon_statereg_f_mid[1]) );
  latch_c_1x outcon_statereg_f_slave_q_reg_1_ ( .ph(ph1), .d(
        outcon_statereg_f_mid[1]), .q(outcon_state_1_) );
  latch_c_1x outcon_statereg_f_master_q_reg_2_ ( .ph(ph2), .d(
        outcon_statereg_d2[2]), .q(outcon_statereg_f_mid[2]) );
  latch_c_1x outcon_statereg_f_slave_q_reg_2_ ( .ph(ph1), .d(
        outcon_statereg_f_mid[2]), .q(outcon_state_2_) );
  latch_c_1x outcon_statereg_f_master_q_reg_3_ ( .ph(ph2), .d(
        outcon_statereg_d2[3]), .q(outcon_statereg_f_mid[3]) );
  nor2_1x U297 ( .a(n312), .b(n311), .y(n313) );
  nor2_1x U298 ( .a(n312), .b(n309), .y(n310) );
  nor2_1x U299 ( .a(n312), .b(n281), .y(n292) );
  nand2_1x U300 ( .a(n454), .b(n453), .y(n455) );
  nand2_2x U301 ( .a(n337), .b(n336), .y(n338) );
  nor2_2x U302 ( .a(n393), .b(n469), .y(n397) );
  nor2_2x U303 ( .a(col_write[0]), .b(n264), .y(n265) );
  inv_2x U304 ( .a(n480), .y(n506) );
  nor2_2x U305 ( .a(n466), .b(n422), .y(n423) );
  nor2_2x U306 ( .a(n393), .b(n496), .y(n375) );
  nand2_2x U307 ( .a(outcon_state_2_), .b(n407), .y(n508) );
  inv_2x U308 ( .a(n432), .y(n314) );
  nand2_2x U309 ( .a(n460), .b(n407), .y(n480) );
  inv_2x U310 ( .a(n329), .y(n331) );
  nor2_2x U311 ( .a(n341), .b(outcon_state_1_), .y(n407) );
  inv_2x U312 ( .a(n325), .y(n337) );
  inv_2x U313 ( .a(n476), .y(n504) );
  inv_2x U314 ( .a(n488), .y(n514) );
  nor2_2x U315 ( .a(n307), .b(n443), .y(n267) );
  nor2_2x U316 ( .a(outcon_state_0_), .b(n411), .y(n510) );
  nor2_1x U317 ( .a(n471), .b(n492), .y(n474) );
  inv_2x U318 ( .a(n433), .y(n443) );
  nor2_1x U319 ( .a(n493), .b(n492), .y(n500) );
  nand2_1x U320 ( .a(n483), .b(n424), .y(n329) );
  inv_2x U321 ( .a(n318), .y(n448) );
  inv_2x U322 ( .a(n352), .y(n353) );
  inv_2x U323 ( .a(n410), .y(n341) );
  inv_2x U324 ( .a(n326), .y(n436) );
  nor2_2x U325 ( .a(n342), .b(outcon_state_3_), .y(n410) );
  inv_4x U326 ( .a(registers[8]), .y(n382) );
  inv_4x U327 ( .a(registers[11]), .y(n507) );
  inv_2x U328 ( .a(registers[9]), .y(n389) );
  inv_2x U329 ( .a(registers[14]), .y(n472) );
  inv_2x U330 ( .a(registers[6]), .y(n394) );
  inv_4x U331 ( .a(registers[5]), .y(n496) );
  inv_2x U332 ( .a(registers[7]), .y(n373) );
  inv_4x U333 ( .a(registers[4]), .y(n469) );
  inv_4x U334 ( .a(registers[16]), .y(n481) );
  inv_2x U335 ( .a(registers[17]), .y(n503) );
  inv_4x U336 ( .a(registers[1]), .y(n502) );
  nor2_2x U337 ( .a(registers[3]), .b(registers[2]), .y(n326) );
  inv_2x U338 ( .a(registers[15]), .y(n495) );
  inv_2x U339 ( .a(outcon_state_0_), .y(n342) );
  inv_2x U340 ( .a(outcon_state_1_), .y(n459) );
  inv_2x U341 ( .a(outcon_state_3_), .y(n478) );
  inv_2x U342 ( .a(outcon_state_2_), .y(n460) );
  nand2_2x U343 ( .a(col_write[1]), .b(n290), .y(n312) );
  inv_4x U344 ( .a(row_write[1]), .y(n275) );
  nor2_2x U345 ( .a(xoro_write[0]), .b(xoro_write[1]), .y(n272) );
  inv_4x U346 ( .a(row_write[0]), .y(n296) );
  inv_4x U347 ( .a(col_write[0]), .y(n290) );
  nor2_1x U348 ( .a(n307), .b(n311), .y(n308) );
  nor2_1x U349 ( .a(n307), .b(n309), .y(n305) );
  nand2_1x U350 ( .a(n292), .b(n296), .y(n283) );
  nand2_1x U351 ( .a(n285), .b(n296), .y(n279) );
  nand2_1x U352 ( .a(n297), .b(n275), .y(n281) );
  nor2_1x U353 ( .a(n508), .b(n507), .y(n509) );
  nor2_1x U354 ( .a(n504), .b(n503), .y(n505) );
  nor2_1x U355 ( .a(n495), .b(n494), .y(n499) );
  nor2_1x U356 ( .a(n504), .b(n481), .y(n482) );
  nor2_1x U357 ( .a(n479), .b(n501), .y(n487) );
  nor2_1x U358 ( .a(n472), .b(n494), .y(n473) );
  nor2_2x U359 ( .a(n471), .b(n400), .y(n403) );
  nor2_2x U360 ( .a(n493), .b(n379), .y(n380) );
  nor2_1x U361 ( .a(n373), .b(n395), .y(n374) );
  nand2_1x U362 ( .a(n449), .b(n448), .y(n450) );
  nand2_1x U363 ( .a(n448), .b(n441), .y(n439) );
  nand2_1x U364 ( .a(n463), .b(n441), .y(n330) );
  nor2_2x U365 ( .a(row_write[1]), .b(n270), .y(n271) );
  nor2_1x U366 ( .a(n443), .b(n421), .y(n418) );
  inv_1x U367 ( .a(n453), .y(n419) );
  nand2_2x U368 ( .a(n483), .b(n414), .y(n449) );
  inv_4x U369 ( .a(n437), .y(n414) );
  nor2_2x U370 ( .a(registers[10]), .b(n424), .y(n437) );
  inv_4x U371 ( .a(registers[10]), .y(n483) );
  nor2_2x U372 ( .a(n433), .b(n325), .y(n432) );
  inv_4x U373 ( .a(registers[0]), .y(n479) );
  inv_4x U374 ( .a(registers[12]), .y(n471) );
  inv_4x U375 ( .a(registers[13]), .y(n493) );
  inv_4x U376 ( .a(reset), .y(n408) );
  nand2_2x U377 ( .a(n324), .b(n436), .y(n466) );
  nor2_1x U378 ( .a(n468), .b(n467), .y(n260) );
  nor2_1x U379 ( .a(col_write[0]), .b(col_write[1]), .y(n303) );
  nor2_2x U380 ( .a(n301), .b(n294), .y(n295) );
  nor2_2x U381 ( .a(n298), .b(n294), .y(n293) );
  nor2_2x U382 ( .a(n301), .b(n283), .y(n284) );
  nor2_2x U383 ( .a(n298), .b(n283), .y(n282) );
  nand2_1x U384 ( .a(row_write[0]), .b(n285), .y(n289) );
  nand2_1x U385 ( .a(xoro_write[0]), .b(n408), .y(n298) );
  nand2_1x U386 ( .a(xoro_write[1]), .b(n408), .y(n301) );
  nor2_1x U387 ( .a(col_write[1]), .b(n281), .y(n285) );
  nor2_1x U388 ( .a(input_error), .b(write_error), .y(n297) );
  nor2_1x U389 ( .a(n466), .b(n465), .y(wc_N57) );
  nor2_1x U390 ( .a(n460), .b(n459), .y(n461) );
  nor2_2x U391 ( .a(n438), .b(n312), .y(n269) );
  nor2_2x U392 ( .a(n307), .b(n261), .y(n266) );
  inv_4x U393 ( .a(n463), .y(n438) );
  inv_4x U394 ( .a(n304), .y(n309) );
  inv_4x U395 ( .a(n306), .y(n311) );
  nor2_2x U396 ( .a(n301), .b(n300), .y(n306) );
  nor2_2x U397 ( .a(n298), .b(n300), .y(n304) );
  nand2_2x U398 ( .a(n413), .b(n412), .y(outcon_statereg_d2[2]) );
  nand2_1x U399 ( .a(outcon_state_2_), .b(outcon_statereg_d2[0]), .y(n412) );
  inv_4x U400 ( .a(n510), .y(n458) );
  nor2_2x U401 ( .a(n478), .b(n477), .y(n476) );
  nor2_1x U402 ( .a(outcon_state_3_), .b(outcon_state_0_), .y(n470) );
  nand2_2x U403 ( .a(n403), .b(n402), .y(n404) );
  nor2_2x U404 ( .a(n378), .b(n377), .y(n379) );
  nor2_2x U405 ( .a(n368), .b(n367), .y(n393) );
  nand2_2x U406 ( .a(n323), .b(n322), .y(col_ai[0]) );
  nand2_2x U407 ( .a(n320), .b(n319), .y(n321) );
  nor2_2x U408 ( .a(n421), .b(n416), .y(n434) );
  inv_4x U409 ( .a(n417), .y(n464) );
  nor2_2x U410 ( .a(n296), .b(n271), .y(n273) );
  inv_4x U411 ( .a(n427), .y(n447) );
  inv_4x U412 ( .a(n462), .y(n421) );
  inv_4x U413 ( .a(n332), .y(n442) );
  nand2_2x U414 ( .a(n503), .b(n481), .y(n332) );
  nand2_2x U415 ( .a(n433), .b(n427), .y(n417) );
  nand2_2x U416 ( .a(n495), .b(n472), .y(n427) );
  nand2_2x U417 ( .a(n373), .b(n394), .y(n462) );
  nor2_2x U418 ( .a(n420), .b(n329), .y(n446) );
  inv_4x U419 ( .a(n441), .y(n420) );
  nand2_2x U420 ( .a(n496), .b(n469), .y(n441) );
  nand2_2x U421 ( .a(n507), .b(n483), .y(n463) );
  nand2_2x U422 ( .a(n318), .b(n453), .y(n325) );
  nand2_2x U423 ( .a(n502), .b(n479), .y(n453) );
  nand2_2x U424 ( .a(n493), .b(n471), .y(n318) );
  nand2_2x U425 ( .a(n389), .b(n382), .y(n433) );
  or2_1x U426 ( .a(n290), .b(col_write[1]), .y(n307) );
  mux2_c_1x U427 ( .d0(n447), .d1(n326), .s(n275), .y(n261) );
  mux2_c_1x U428 ( .d0(n448), .d1(n419), .s(n275), .y(n263) );
  mux2_c_1x U429 ( .d0(n442), .d1(n420), .s(n275), .y(n262) );
  mux2_c_1x U430 ( .d0(n263), .d1(n262), .s(col_write[1]), .y(n264) );
  nor3_1x U431 ( .a(row_write[0]), .b(n266), .c(n265), .y(n274) );
  nor3_1x U432 ( .a(col_write[0]), .b(col_write[1]), .c(n421), .y(n268) );
  nor3_1x U433 ( .a(n269), .b(n268), .c(n267), .y(n270) );
  nor3_1x U434 ( .a(n274), .b(n273), .c(n272), .y(write_error) );
  nor3_1x U435 ( .a(col_write[0]), .b(n298), .c(n279), .y(n276) );
  a2o1_1x U436 ( .a(registers[0]), .b(n408), .c(n276), .y(b_boardmem0_d2[0])
         );
  nor3_1x U437 ( .a(col_write[0]), .b(n279), .c(n301), .y(n277) );
  a2o1_1x U438 ( .a(registers[1]), .b(n408), .c(n277), .y(b_boardmem0_d2[1])
         );
  nor3_1x U439 ( .a(n290), .b(n298), .c(n279), .y(n278) );
  a2o1_1x U440 ( .a(registers[2]), .b(n408), .c(n278), .y(b_boardmem1_d2[0])
         );
  nor3_1x U441 ( .a(n290), .b(n279), .c(n301), .y(n280) );
  a2o1_1x U442 ( .a(registers[3]), .b(n408), .c(n280), .y(b_boardmem1_d2[1])
         );
  a2o1_1x U443 ( .a(registers[4]), .b(n408), .c(n282), .y(b_boardmem2_d2[0])
         );
  a2o1_1x U444 ( .a(registers[5]), .b(n408), .c(n284), .y(b_boardmem2_d2[1])
         );
  nor3_1x U445 ( .a(col_write[0]), .b(n298), .c(n289), .y(n286) );
  a2o1_1x U446 ( .a(registers[6]), .b(n408), .c(n286), .y(b_boardmem3_d2[0])
         );
  nor3_1x U447 ( .a(col_write[0]), .b(n301), .c(n289), .y(n287) );
  a2o1_1x U448 ( .a(registers[7]), .b(n408), .c(n287), .y(b_boardmem3_d2[1])
         );
  nor3_1x U449 ( .a(n290), .b(n298), .c(n289), .y(n288) );
  a2o1_1x U450 ( .a(registers[8]), .b(n408), .c(n288), .y(b_boardmem4_d2[0])
         );
  nor3_1x U451 ( .a(n290), .b(n301), .c(n289), .y(n291) );
  a2o1_1x U452 ( .a(registers[9]), .b(n408), .c(n291), .y(b_boardmem4_d2[1])
         );
  nand2_1x U453 ( .a(row_write[0]), .b(n292), .y(n294) );
  a2o1_1x U454 ( .a(registers[10]), .b(n408), .c(n293), .y(b_boardmem5_d2[0])
         );
  a2o1_1x U455 ( .a(registers[11]), .b(n408), .c(n295), .y(b_boardmem5_d2[1])
         );
  nand3_1x U456 ( .a(row_write[1]), .b(n297), .c(n296), .y(n300) );
  nor2_1x U457 ( .a(reset), .b(n471), .y(n299) );
  a2o1_1x U458 ( .a(n303), .b(n304), .c(n299), .y(b_boardmem6_d2[0]) );
  nor2_1x U459 ( .a(reset), .b(n493), .y(n302) );
  a2o1_1x U460 ( .a(n306), .b(n303), .c(n302), .y(b_boardmem6_d2[1]) );
  a2o1_1x U461 ( .a(registers[14]), .b(n408), .c(n305), .y(b_boardmem7_d2[0])
         );
  a2o1_1x U462 ( .a(registers[15]), .b(n408), .c(n308), .y(b_boardmem7_d2[1])
         );
  a2o1_1x U463 ( .a(registers[16]), .b(n408), .c(n310), .y(b_boardmem8_d2[0])
         );
  a2o1_1x U464 ( .a(registers[17]), .b(n408), .c(n313), .y(b_boardmem8_d2[1])
         );
  nor3_1x U465 ( .a(n442), .b(n420), .c(n325), .y(n324) );
  nand3_1x U466 ( .a(n447), .b(n324), .c(n418), .y(n315) );
  nand3_1x U467 ( .a(n466), .b(n315), .c(n314), .y(n316) );
  nand2_1x U468 ( .a(registers[10]), .b(n316), .y(n323) );
  a2o1_1x U469 ( .a(registers[6]), .b(n493), .c(registers[12]), .y(n424) );
  a2o1_1x U470 ( .a(n446), .b(n462), .c(n437), .y(n317) );
  nand3_1x U471 ( .a(n326), .b(n318), .c(n317), .y(n320) );
  a2o1_1x U472 ( .a(n437), .b(n318), .c(n446), .y(n415) );
  nand2_1x U473 ( .a(n417), .b(n415), .y(n319) );
  nand3_1x U474 ( .a(n463), .b(n321), .c(n453), .y(n322) );
  nand3_1x U475 ( .a(registers[10]), .b(n326), .c(n324), .y(n416) );
  nor3_1x U476 ( .a(n326), .b(n332), .c(n330), .y(n327) );
  nand3_1x U477 ( .a(n337), .b(n464), .c(n327), .y(n328) );
  a2o1_1x U478 ( .a(n421), .b(n414), .c(n328), .y(n456) );
  nand3_1x U479 ( .a(n331), .b(n453), .c(n330), .y(n339) );
  nand3_1x U480 ( .a(n420), .b(n464), .c(n436), .y(n335) );
  nand2_1x U481 ( .a(n332), .b(n441), .y(n333) );
  nand3_1x U482 ( .a(registers[10]), .b(n433), .c(n333), .y(n334) );
  nand3_1x U483 ( .a(n335), .b(n334), .c(n463), .y(n336) );
  nand3_1x U484 ( .a(n456), .b(n339), .c(n338), .y(n340) );
  a2o1_1x U485 ( .a(n464), .b(n434), .c(n340), .y(col_ai[1]) );
  nand3_1x U486 ( .a(outcon_state_2_), .b(n478), .c(n459), .y(n411) );
  nand3_1x U487 ( .a(outcon_state_2_), .b(outcon_state_1_), .c(n410), .y(n494)
         );
  nand3_1x U488 ( .a(n480), .b(n458), .c(n494), .y(col_out[0]) );
  nand3_1x U489 ( .a(n460), .b(n459), .c(n342), .y(n477) );
  nand3_1x U490 ( .a(outcon_state_1_), .b(n470), .c(n460), .y(n497) );
  nand3_1x U491 ( .a(n504), .b(n508), .c(n497), .y(col_out[1]) );
  nor2_1x U492 ( .a(registers[8]), .b(n479), .y(n343) );
  a2o1_1x U493 ( .a(registers[1]), .b(n389), .c(n343), .y(n346) );
  mux2_c_1x U494 ( .d0(n502), .d1(registers[9]), .s(n503), .y(n345) );
  mux2_c_1x U495 ( .d0(n479), .d1(registers[8]), .s(n481), .y(n344) );
  nor3_1x U496 ( .a(n346), .b(n345), .c(n344), .y(n358) );
  nor2_1x U497 ( .a(registers[12]), .b(n394), .y(n347) );
  a2o1_1x U498 ( .a(registers[7]), .b(n493), .c(n347), .y(n350) );
  mux2_c_1x U499 ( .d0(n394), .d1(registers[12]), .s(n479), .y(n349) );
  mux2_c_1x U500 ( .d0(n373), .d1(registers[13]), .s(n502), .y(n348) );
  nor3_1x U501 ( .a(n350), .b(n349), .c(n348), .y(n357) );
  inv_1x U502 ( .a(registers[2]), .y(n381) );
  nor2_1x U503 ( .a(registers[4]), .b(n381), .y(n351) );
  a2o1_1x U504 ( .a(registers[3]), .b(n496), .c(n351), .y(n355) );
  mux2_c_1x U505 ( .d0(n381), .d1(registers[4]), .s(n479), .y(n354) );
  mux2_c_1x U506 ( .d0(registers[3]), .d1(n496), .s(n502), .y(n352) );
  nor3_1x U507 ( .a(n355), .b(n354), .c(n353), .y(n356) );
  nor3_1x U508 ( .a(n358), .b(n357), .c(n356), .y(n392) );
  nor2_1x U509 ( .a(n392), .b(n502), .y(n376) );
  nor2_1x U510 ( .a(registers[13]), .b(n389), .y(n359) );
  a2o1_1x U511 ( .a(n471), .b(registers[8]), .c(n359), .y(n362) );
  mux2_c_1x U512 ( .d0(n389), .d1(registers[13]), .s(n496), .y(n361) );
  mux2_c_1x U513 ( .d0(n382), .d1(registers[12]), .s(n469), .y(n360) );
  nor3_1x U514 ( .a(n362), .b(n361), .c(n360), .y(n368) );
  mux2_c_1x U515 ( .d0(n483), .d1(registers[4]), .s(n481), .y(n366) );
  mux2_c_1x U516 ( .d0(n507), .d1(registers[5]), .s(n503), .y(n365) );
  nor2_1x U517 ( .a(registers[4]), .b(n483), .y(n363) );
  a2o1_1x U518 ( .a(registers[11]), .b(n496), .c(n363), .y(n364) );
  nor3_1x U519 ( .a(n366), .b(n365), .c(n364), .y(n367) );
  mux2_c_1x U520 ( .d0(registers[8]), .d1(n394), .s(n483), .y(n371) );
  mux2_c_1x U521 ( .d0(registers[9]), .d1(n373), .s(n507), .y(n370) );
  nand2_1x U522 ( .a(registers[9]), .b(n373), .y(n369) );
  nand3_1x U523 ( .a(n371), .b(n370), .c(n369), .y(n372) );
  a2o1_1x U524 ( .a(registers[8]), .b(n394), .c(n372), .y(n395) );
  nor3_1x U525 ( .a(n376), .b(n375), .c(n374), .y(n388) );
  nor3_1x U526 ( .a(n472), .b(n481), .c(n471), .y(n378) );
  nor3_1x U527 ( .a(registers[12]), .b(registers[14]), .c(registers[16]), .y(
        n377) );
  nand3_1x U528 ( .a(registers[17]), .b(registers[15]), .c(n380), .y(n387) );
  nor2_1x U529 ( .a(n382), .b(registers[14]), .y(n385) );
  mux2_c_1x U530 ( .d0(n389), .d1(registers[9]), .s(n495), .y(n384) );
  mux2_c_1x U531 ( .d0(n382), .d1(registers[14]), .s(n381), .y(n383) );
  nor3_1x U532 ( .a(n385), .b(n384), .c(n383), .y(n391) );
  nand3_1x U533 ( .a(registers[9]), .b(registers[3]), .c(n391), .y(n386) );
  nand3_1x U534 ( .a(n388), .b(n387), .c(n386), .y(n468) );
  mux2_c_1x U535 ( .d0(n389), .d1(registers[9]), .s(registers[3]), .y(n390) );
  nand3_1x U536 ( .a(n391), .b(registers[2]), .c(n390), .y(n406) );
  nor2_1x U537 ( .a(n392), .b(n479), .y(n398) );
  nor2_1x U538 ( .a(n395), .b(n394), .y(n396) );
  nor3_1x U539 ( .a(n398), .b(n397), .c(n396), .y(n405) );
  nand2_1x U540 ( .a(registers[15]), .b(n503), .y(n399) );
  nand3_1x U541 ( .a(registers[14]), .b(registers[16]), .c(n399), .y(n400) );
  nor3_1x U542 ( .a(registers[13]), .b(registers[15]), .c(registers[17]), .y(
        n401) );
  a2o1_1x U543 ( .a(registers[15]), .b(registers[13]), .c(n401), .y(n402) );
  nand3_1x U544 ( .a(n406), .b(n405), .c(n404), .y(n467) );
  and2_1x U545 ( .a(n408), .b(n470), .y(outcon_statereg_d2[0]) );
  and2_1x U546 ( .a(n408), .b(n407), .y(n409) );
  a2o1_1x U547 ( .a(outcon_state_1_), .b(outcon_statereg_d2[0]), .c(n409), .y(
        outcon_statereg_d2[1]) );
  nand3_1x U548 ( .a(n460), .b(outcon_state_1_), .c(n410), .y(n488) );
  a2o1_1x U549 ( .a(n411), .b(n488), .c(reset), .y(n413) );
  nor2_1x U550 ( .a(reset), .b(n494), .y(outcon_statereg_d2[3]) );
  nand3_1x U551 ( .a(n438), .b(n453), .c(n415), .y(n430) );
  a2o1_1x U552 ( .a(n462), .b(n417), .c(n416), .y(n429) );
  nor3_1x U553 ( .a(n420), .b(n419), .c(n418), .y(n425) );
  nor2_1x U554 ( .a(n421), .b(n424), .y(n422) );
  a2o1_1x U555 ( .a(n425), .b(n424), .c(n423), .y(n426) );
  nand3_1x U556 ( .a(n483), .b(n427), .c(n426), .y(n428) );
  nand3_1x U557 ( .a(n430), .b(n429), .c(n428), .y(n431) );
  a2o1_1x U558 ( .a(n432), .b(n449), .c(n431), .y(row_ai[0]) );
  nand3_1x U559 ( .a(n447), .b(n434), .c(n433), .y(n457) );
  a2o1_1x U560 ( .a(n462), .b(n441), .c(n447), .y(n435) );
  nand3_1x U561 ( .a(n437), .b(n436), .c(n435), .y(n440) );
  a2o1_1x U562 ( .a(n440), .b(n439), .c(n438), .y(n445) );
  nand3_1x U563 ( .a(n442), .b(registers[10]), .c(n441), .y(n444) );
  a2o1_1x U564 ( .a(n445), .b(n444), .c(n443), .y(n452) );
  nand3_1x U565 ( .a(n447), .b(n446), .c(n463), .y(n451) );
  nand3_1x U566 ( .a(n452), .b(n451), .c(n450), .y(n454) );
  nand3_1x U567 ( .a(n457), .b(n456), .c(n455), .y(row_ai[1]) );
  nand3_1x U568 ( .a(n508), .b(n458), .c(n488), .y(row_out[0]) );
  a2o1_1x U569 ( .a(n461), .b(n478), .c(n476), .y(row_out[1]) );
  nand3_1x U570 ( .a(n464), .b(n463), .c(n462), .y(n465) );
  or2_1x U571 ( .a(wc_tie_1_), .b(n467), .y(win[0]) );
  or2_1x U572 ( .a(wc_tie_1_), .b(n468), .y(win[1]) );
  nor2_1x U573 ( .a(n469), .b(n497), .y(n475) );
  nand3_1x U574 ( .a(outcon_state_2_), .b(outcon_state_1_), .c(n470), .y(n492)
         );
  nor3_1x U575 ( .a(n475), .b(n474), .c(n473), .y(n491) );
  a2o1_1x U576 ( .a(n478), .b(n477), .c(n476), .y(n501) );
  a2o1_1x U577 ( .a(n506), .b(registers[2]), .c(n482), .y(n486) );
  nor2_1x U578 ( .a(n483), .b(n508), .y(n484) );
  a2o1_1x U579 ( .a(registers[8]), .b(n510), .c(n484), .y(n485) );
  nor3_1x U580 ( .a(n487), .b(n486), .c(n485), .y(n490) );
  nand2_1x U581 ( .a(n514), .b(registers[6]), .y(n489) );
  nand3_1x U582 ( .a(n491), .b(n490), .c(n489), .y(xoro_out[0]) );
  nor2_1x U583 ( .a(n497), .b(n496), .y(n498) );
  nor3_1x U584 ( .a(n500), .b(n499), .c(n498), .y(n517) );
  nor2_1x U585 ( .a(n502), .b(n501), .y(n513) );
  a2o1_1x U586 ( .a(n506), .b(registers[3]), .c(n505), .y(n512) );
  a2o1_1x U587 ( .a(n510), .b(registers[9]), .c(n509), .y(n511) );
  nor3_1x U588 ( .a(n513), .b(n512), .c(n511), .y(n516) );
  nand2_1x U589 ( .a(n514), .b(registers[7]), .y(n515) );
  nand3_1x U590 ( .a(n517), .b(n516), .c(n515), .y(xoro_out[1]) );
endmodule

