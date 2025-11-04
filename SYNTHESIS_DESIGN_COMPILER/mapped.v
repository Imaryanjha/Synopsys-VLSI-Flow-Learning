/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12
// Date      : Tue Oct 14 19:20:02 2025
/////////////////////////////////////////////////////////////


module full_adder ( A, B, C_in, C_out, Clock, SUM );
  input [3:0] A;
  input [3:0] B;
  output [3:0] SUM;
  input C_in, Clock;
  output C_out;
  wire   c_in, c_out;
  wire   [3:0] reg1;
  wire   [3:0] reg2;
  wire   [3:0] sum_i;
  wire   [4:1] \add_1_root_add_33_2/carry ;

  DFFX1_RVT \reg1_reg[3]  ( .D(A[3]), .CLK(Clock), .Q(reg1[3]) );
  DFFX1_RVT \reg1_reg[2]  ( .D(A[2]), .CLK(Clock), .Q(reg1[2]) );
  DFFX1_RVT \reg1_reg[1]  ( .D(A[1]), .CLK(Clock), .Q(reg1[1]) );
  DFFX1_RVT \reg1_reg[0]  ( .D(A[0]), .CLK(Clock), .Q(reg1[0]) );
  DFFX1_RVT \reg2_reg[3]  ( .D(B[3]), .CLK(Clock), .Q(reg2[3]) );
  DFFX1_RVT \reg2_reg[2]  ( .D(B[2]), .CLK(Clock), .Q(reg2[2]) );
  DFFX1_RVT \reg2_reg[1]  ( .D(B[1]), .CLK(Clock), .Q(reg2[1]) );
  DFFX1_RVT \reg2_reg[0]  ( .D(B[0]), .CLK(Clock), .Q(reg2[0]) );
  DFFX1_RVT c_in_reg ( .D(C_in), .CLK(Clock), .Q(c_in) );
  DFFX1_RVT \SUM_reg[3]  ( .D(sum_i[3]), .CLK(Clock), .Q(SUM[3]) );
  DFFX1_RVT \SUM_reg[2]  ( .D(sum_i[2]), .CLK(Clock), .Q(SUM[2]) );
  DFFX1_RVT \SUM_reg[1]  ( .D(sum_i[1]), .CLK(Clock), .Q(SUM[1]) );
  DFFX1_RVT \SUM_reg[0]  ( .D(sum_i[0]), .CLK(Clock), .Q(SUM[0]) );
  DFFX1_RVT C_out_reg ( .D(c_out), .CLK(Clock), .Q(C_out) );
  FADDX1_RVT \add_1_root_add_33_2/L1(0)/U1  ( .A(reg1[0]), .B(reg2[0]), .CI(
        c_in), .CO(\add_1_root_add_33_2/carry [1]), .S(sum_i[0]) );
  FADDX1_RVT \add_1_root_add_33_2/L1(1)/U1  ( .A(reg1[1]), .B(reg2[1]), .CI(
        \add_1_root_add_33_2/carry [1]), .CO(\add_1_root_add_33_2/carry [2]), 
        .S(sum_i[1]) );
  FADDX1_RVT \add_1_root_add_33_2/L1(2)/U1  ( .A(reg1[2]), .B(reg2[2]), .CI(
        \add_1_root_add_33_2/carry [2]), .CO(\add_1_root_add_33_2/carry [3]), 
        .S(sum_i[2]) );
  FADDX1_RVT \add_1_root_add_33_2/L1(3)/U1  ( .A(reg1[3]), .B(reg2[3]), .CI(
        \add_1_root_add_33_2/carry [3]), .CO(c_out), .S(sum_i[3]) );
endmodule

