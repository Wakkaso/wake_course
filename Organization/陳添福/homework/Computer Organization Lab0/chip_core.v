/////////////////////////////////////////////////////////////////////////
// Module chip_core.v 
// Hierarchy: system.v
// Module function: 
// Module chip_core.v consists of add-compare-select unit (acs4.v),
// survivor path unit (spu.v) and controller (controller.v). 

/////////////////////////////////////////////////////////////////////////

module chip_core(sync_s1,self_test_s1,external_y_s1,
                 orig_del_bit_s1,fail_s1,data_valid_s1,decoded_bit_s1,
                 decoded_column_s1,decisions_s1,path_metrics_s1,phi1,phi2);

//////////////////////////////////////////////////////////////////////////

input           phi1,phi2;
input           sync_s1,
                self_test_s1;
input    [1:0]  external_y_s1;
 
output          orig_del_bit_s1,
                fail_s1,
                data_valid_s1,
                decoded_bit_s1;

output   [3:0]  decoded_column_s1, // decoded vector from spu
                decisions_s1;

output  [15:0]  path_metrics_s1;

wire            sel_initial_s1;
wire            y2_s1, y1_s1;


////////////////////////////////////////////////////////////////////////
controller controller(sync_s1,self_test_s1,decoded_column_s1, external_y_s1,
                      sel_initial_s1,data_valid_s1,fail_s1,orig_del_bit_s1,
                      decoded_bit_s1,y2_s1,y1_s1,phi1,phi2);
acs4       acs4(y2_s1,y1_s1,sel_initial_s1,decisions_s1,path_metrics_s1,
                phi1,phi2);

spu     spu(decisions_s1,decoded_column_s1,phi1,phi2);


/*
snooper data_snoop(phi1, phi2, y2_s1, y1_s1, 
	sel_initial_s1, decisions_s1, decoded_column_s1, path_metrics_s1);
*/


/*
snooper controller_snoop(
	phi1, phi2, y2_s1, y1_s1, 
	sel_initial_s1, orig_del_bit_s1, decoded_bit_s1, data_valid_s1, 
	fail_s1, decoded_column_s1, external_y_s1, self_test_s1, 
	sync_s1);
*/

////////////////////////////////////////////////////////////////////////

endmodule









