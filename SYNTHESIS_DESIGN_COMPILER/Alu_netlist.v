/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : V-2023.12-SP4
// Date      : Mon Nov  3 18:04:49 2025
/////////////////////////////////////////////////////////////


module alu ( a, b, sel, y, carry );
  input [3:0] a;
  input [3:0] b;
  input [1:0] sel;
  output [3:0] y;
  output carry;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29;

  GTECH_AND2 C14 ( .A(N16), .B(N12), .Z(N13) );
  GTECH_OR2 C16 ( .A(sel[1]), .B(N12), .Z(N14) );
  GTECH_OR2 C19 ( .A(N16), .B(sel[0]), .Z(N17) );
  GTECH_AND2 C21 ( .A(sel[1]), .B(sel[0]), .Z(N19) );
  ADD_UNS_OP add_12 ( .A(a), .B(b), .Z({N24, N23, N22, N21, N20}) );
  SUB_UNS_OP sub_13 ( .A(a), .B(b), .Z({N29, N28, N27, N26, N25}) );
  SELECT_OP C36 ( .DATA1(N24), .DATA2(N29), .DATA3(1'b0), .DATA4(1'b0), 
        .CONTROL1(N0), .CONTROL2(N1), .CONTROL3(N2), .CONTROL4(N3), .Z(carry)
         );
  GTECH_BUF B_0 ( .A(N13), .Z(N0) );
  GTECH_BUF B_1 ( .A(N15), .Z(N1) );
  GTECH_BUF B_2 ( .A(N18), .Z(N2) );
  GTECH_BUF B_3 ( .A(N19), .Z(N3) );
  SELECT_OP C37 ( .DATA1({N23, N22, N21, N20}), .DATA2({N28, N27, N26, N25}), 
        .DATA3({N4, N5, N6, N7}), .DATA4({N8, N9, N10, N11}), .CONTROL1(N0), 
        .CONTROL2(N1), .CONTROL3(N2), .CONTROL4(N3), .Z(y) );
  GTECH_AND2 C40 ( .A(a[3]), .B(b[3]), .Z(N4) );
  GTECH_AND2 C41 ( .A(a[2]), .B(b[2]), .Z(N5) );
  GTECH_AND2 C42 ( .A(a[1]), .B(b[1]), .Z(N6) );
  GTECH_AND2 C43 ( .A(a[0]), .B(b[0]), .Z(N7) );
  GTECH_OR2 C44 ( .A(a[3]), .B(b[3]), .Z(N8) );
  GTECH_OR2 C45 ( .A(a[2]), .B(b[2]), .Z(N9) );
  GTECH_OR2 C46 ( .A(a[1]), .B(b[1]), .Z(N10) );
  GTECH_OR2 C47 ( .A(a[0]), .B(b[0]), .Z(N11) );
  GTECH_NOT I_0 ( .A(sel[0]), .Z(N12) );
  GTECH_NOT I_1 ( .A(N14), .Z(N15) );
  GTECH_NOT I_2 ( .A(sel[1]), .Z(N16) );
  GTECH_NOT I_3 ( .A(N17), .Z(N18) );
  GTECH_BUF B_4 ( .A(N13) );
  GTECH_BUF B_5 ( .A(N15) );
endmodule
