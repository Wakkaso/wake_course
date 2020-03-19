///////////////////////////////////////////////////
// Module acs1.v 
// Hierarchy: acs4.v
// Module function: 
//  Module acs1.v calculates the surviving metrics for one state. The
//  inputs are two path metrics from previous time slot. Each path metric
//  is added with associated branch metric which also presents the input to
//  the module. The smaller total metric is selected and output as well as the
//  decision bit.


///////////////////////////////////////////////////////////////////////////////
module acs1(phi1,phi2,path_metric0_s1,path_metric1_s1,branch_metric0_s1,
            branch_metric1_s1,path_metric_out_s1,decision_s1,sel_initial_s1,
            initial_metric_s1);
///////////////////////////////////////////////////////////////////////////////

input         phi1,phi2;               // Two external clock phases (non-overlapped clock)

input  [3:0]  path_metric0_s1,         // Two path metrics from previous time slot
	            path_metric1_s1;         // use 4-bit register instead of 2-bit to avoid the overflow in ACS
input  [1:0]  branch_metric0_s1,       // Two branch metrics
              branch_metric1_s1;
input         sel_initial_s1;          // 1 selects the initial state to be loaded 
input  [3:0]  initial_metric_s1;

output        decision_s1;             // The result about which path metric is smaller
output [3:0]  path_metric_out_s1;      // Output the servivor path metric

reg    [3:0]  path_metric_out_s1;

wire   [4:0]  total_metric0_s1,        // path metric + branch metric
              total_metric1_s1;
wire   [3:0]  new_path_metric_s1,      // smaller of the two total metrics 
              selected_path_metric_s1; // path metric selected after checking the initial state
              
reg    [3:0]  path_metric_out_s2;


/////////////// Add, Compare, Select logic ////////////////////////////////////

assign total_metric0_s1 = path_metric0_s1 + branch_metric0_s1;
assign total_metric1_s1 = path_metric1_s1 + branch_metric1_s1;

assign decision_s1= total_metric0_s1 >= total_metric1_s1;
assign new_path_metric_s1= decision_s1 ? total_metric1_s1[3:0] : total_metric0_s1[3:0];

assign selected_path_metric_s1 = sel_initial_s1 ? initial_metric_s1 : new_path_metric_s1;

//////////// Latch at phi1 ////////////////////////////////////////////////////

always @(phi1 or selected_path_metric_s1)
 if (phi1)
     path_metric_out_s2 = selected_path_metric_s1;

//////////// Latch at phi2 ////////////////////////////////////////////////////

always @(phi2 or path_metric_out_s2)
 if (phi2)
     path_metric_out_s1 = path_metric_out_s2;

//////////////////////////////////////////////////////////////////////////////

endmodule
