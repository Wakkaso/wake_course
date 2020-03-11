///////////////////////////////////////////////////
// Module acs4.v 
// Hierarchy: decoder_core.v
// Module function: 
//  Module acs4.v calculates the surviving metrics for all four states. The
//  inputs are path metrics from previous time slot. New path metrics are
//  calculated for next time slot
////////////////////////////////////////////////////////////////////////// 

////////////////////////// Definitions ////////////////////////////////////

//`define initial_metric00   4'b0000
//`define initial_metric01   4'b1010 
//`define initial_metric10   4'b1010
//`define initial_metric11   4'b1010

// After two trellis stages all the unwanted initial paths (the ones
// which do not start from state 00) die out. We have chosen initial
// path metric of 10 for the unwanted initial states (01, 10, 11) so that 
// the maximum possible path metric of these states after two stages of
// trellis (10+2+2) does not end up being cut by modulo operation. The
// value of 2 represents the maximum possible value of branch metric for
// any transition. 

///////////////////////////////////////////////////////////////////////////////
module 
 acs4(y2_s1,y1_s1,sel_initial_s1,decisions_s1,path_metrics_s1,phi1,phi2);

///////////////////////////////////////////////////////////////////////////////

input           sel_initial_s1,
                y2_s1,            // Encoded outuuts from encoder in controller.v
                y1_s1;

input           phi1,
                phi2;

output  [3:0]   decisions_s1;     // Sum of the all decisions of each ACS

output  [15:0]  path_metrics_s1;  // Sum of the all path metrics vector for testing purposes  


// 2-bit register for each branch metric
wire 	  [1:0]	  b00_s1,           // Hamming distance of input and  00
                b01_s1,           // Hamming distance of input and  01
                b10_s1,           // Hamming distance of input and  10
                b11_s1;           // Hamming distance of input and  11 

wire		        d00_s1,           // decision bit from ACS00
                d01_s1,           // decision bit from ACS01
                d10_s1,           // decision bit from ACS10
                d11_s1;           // decision bit from ACS11

wire    [3:0]   path_metric_out00_s1,
                path_metric_out01_s1,
                path_metric_out10_s1,
                path_metric_out11_s1;

//////////////////////// Branch metric generation /////////////////////////////

assign b00_s1 = y2_s1 + y1_s1;
assign b01_s1 = y2_s1 + !y1_s1;
assign b10_s1 = !y2_s1 + y1_s1;
assign b11_s1 = !y2_s1 + !y1_s1;


/////////////// ACS module for state 00 ///////////////////////////////////////

acs1   acs00(.phi1(phi1), .phi2(phi2),
             .path_metric0_s1(path_metric_out00_s1),
             .path_metric1_s1(path_metric_out01_s1),
             .branch_metric0_s1(b00_s1),
	           .branch_metric1_s1(b11_s1),
             .path_metric_out_s1(path_metric_out00_s1),
	           .decision_s1(d00_s1),
             .sel_initial_s1(sel_initial_s1), 
             .initial_metric_s1(4'b0000));
         //  .initial_metric_s1(`initial_metric00));


/////////////// ACS module for state 10 ///////////////////////////////////////

acs1   acs10(.phi1(phi1), .phi2(phi2),
             .path_metric0_s1(path_metric_out00_s1),
             .path_metric1_s1(path_metric_out01_s1),
             .branch_metric0_s1(b11_s1),
	           .branch_metric1_s1(b00_s1),
             .path_metric_out_s1(path_metric_out10_s1),
	           .decision_s1(d10_s1),
             .sel_initial_s1(sel_initial_s1),
             .initial_metric_s1(4'b1010));
         //  .initial_metric_s1(`initial_metric10));


/////////////// ACS module for state 01 ///////////////////////////////////////

acs1   acs01(.phi1(phi1), .phi2(phi2),
             .path_metric0_s1(path_metric_out10_s1),
             .path_metric1_s1(path_metric_out11_s1),
             .branch_metric0_s1(b01_s1),
	           .branch_metric1_s1(b10_s1),
             .path_metric_out_s1(path_metric_out01_s1),
	           .decision_s1(d01_s1),
             .sel_initial_s1(sel_initial_s1),
             .initial_metric_s1(4'b1010));
         //  .initial_metric_s1(`initial_metric01));


/////////////// ACS module for state 11 ///////////////////////////////////////

acs1   acs11(.phi1(phi1), .phi2(phi2),
             .path_metric0_s1(path_metric_out10_s1),
             .path_metric1_s1(path_metric_out11_s1),
             .branch_metric0_s1(b10_s1),
	           .branch_metric1_s1(b01_s1),
             .path_metric_out_s1(path_metric_out11_s1),
	           .decision_s1(d11_s1),
             .sel_initial_s1(sel_initial_s1),
             .initial_metric_s1(4'b1010));
         //  .initial_metric_s1(`initial_metric11));

////////////////////////////////////////////////////////////////////////////// 

assign decisions_s1 = {d11_s1,d10_s1,d01_s1,d00_s1};

assign path_metrics_s1 = { path_metric_out11_s1,
                           path_metric_out10_s1,
                           path_metric_out01_s1,
                           path_metric_out00_s1  };

////////////////////////////////////////////////////////////////////////////
endmodule










