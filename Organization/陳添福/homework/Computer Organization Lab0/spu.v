////////////////////////////////////////////////////
// Module spu.v 
// Hierarchy: decoder_core.v
// Module function: 
//  Module spu.v  implements the register-exchange technique for tracing
//  of the survivor path.

//////////////////////////////////////////////////// 

module spu(decisions_s1,decoded_column_s1,phi1,phi2);

////////////////////////////////////////////////////

input         phi1,phi2;
input  [3:0]  decisions_s1;

output [3:0]  decoded_column_s1;


reg   [10:0]  path_in_00_s1,
              path_in_01_s1,
              path_in_10_s1,
              path_in_11_s1;

reg   [10:0]  path_out_00_s2,
              path_out_01_s2,
              path_out_10_s2,
              path_out_11_s2;

reg   [10:0]  path_out_00_s1,
              path_out_01_s1,
              path_out_10_s1,
              path_out_11_s1;
/*
wire    phi1_b,
        phi1_bb,
        phi2_b,
        phi2_bb;
wire [3:0] decisions_b_s1;
assign decisions_b_s1 = ~decisions_s1;
assign phi1_b = ~phi1; 
assign phi1_bb =~(~phi1); 
assign phi2_b = ~phi2; 
assign phi2_bb =~(~phi2); 

snooper spusnoop(
        phi1, phi1_b, phi2, phi2_b, 
        decisions_s1, decisions_b_s1, decoded_column_s1);
*/

/////////////////////////////////////////////////////
// Update the survivor path index for tracing back
//
// At any time, there are only four paths surviving which correspond to the four
// states in the trellis slice. Every path is updated from one of the two
// candidates according to the trellis structure. After the update, each path
// stores the whole decoded sequence which corresponds to the tail of the 
// current state. If decision bit is one we shift in the lower of the two
// input candidates.

always @ (phi1 or  path_out_00_s1 or path_out_01_s1 or
path_out_10_s1 or path_out_11_s1 or decisions_s1)

begin
  case(decisions_s1[0])
    1'b1 :  path_in_00_s1 = {path_out_01_s1[9:0], 1'b0};         
    1'b0 :  path_in_00_s1 = {path_out_00_s1[9:0], 1'b0};
    default :  path_in_00_s1 ={10'bx,1'b0} ;
  endcase
  case(decisions_s1[1])
    1'b1 :  path_in_01_s1 = {path_out_11_s1[9:0], 1'b0};
    1'b0 :  path_in_01_s1 = {path_out_10_s1[9:0], 1'b0};
    default :  path_in_01_s1 ={10'bx,1'b0} ;
  endcase
  case(decisions_s1[2])
    1'b1 :  path_in_10_s1 = {path_out_01_s1[9:0], 1'b1};
    1'b0 :  path_in_10_s1 = {path_out_00_s1[9:0], 1'b1};
    default :  path_in_10_s1 = {10'bx,1'b1};
  endcase
  case(decisions_s1[3])
    1'b1 :  path_in_11_s1 = {path_out_11_s1[9:0], 1'b1};
    1'b0 :  path_in_11_s1 = {path_out_10_s1[9:0], 1'b1};
    default :  path_in_11_s1 = {10'bx,1'b1};
  endcase
end


//////////////////////////////////////////////////////////

always @(phi1 or path_in_00_s1 or path_in_01_s1 or path_in_10_s1 or 
         path_in_11_s1)
  if (phi1)
      begin	
          path_out_00_s2 = path_in_00_s1;
          path_out_01_s2 = path_in_01_s1;
          path_out_10_s2 = path_in_10_s1;
          path_out_11_s2 = path_in_11_s1;
      end

always @(phi2 or path_out_00_s2 or path_out_01_s2 or path_out_10_s2 or 
         path_out_11_s2)
  if (phi2)
      begin	
          path_out_00_s1 = path_out_00_s2;
          path_out_01_s1 = path_out_01_s2;
          path_out_10_s1 = path_out_10_s2;
          path_out_11_s1 = path_out_11_s2;
      end

/////////////////////////////////////////////////////////////////////////////
// All the bits in the path_out_??_s1[?] should be the same since this
// represents the common trunk for all four paths, in each moment. The actual
// decoded bit is chosen from any of the four bits in a vector. It is
// possible to decrease the error probability by choosing the decoded bit
// from the majority function performed on the bits of bits_out_s1 vector.
////////////////////////////////////////////////////////////////////////////

assign decoded_column_s1 = {path_out_11_s1[10],path_out_10_s1[10],
                      path_out_01_s1[10],path_out_00_s1[10]};  

/////////////////////////////////////////////////////////////////////////////
endmodule








