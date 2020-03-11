/////////////////////////////////////////////////////////////////////////
// Module system.v 
// Hierarchy: None ( It is the master )
// Module function: 
// Module system.v generates input signals for chip_core and test the
// validity of the output signals from the chip_core.

/////////////////////////////////////////////////////////////////////////

module system();

//////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////
wire            phi1,phi2;

reg             sync_s1,
                self_test_s1;
wire     [1:0]  external_y_s1; //encoded vector y2y1
 
wire            orig_del_bit_s1, // delayed bit out of the on-chip PSR Gen.
                                 // to be used in verification of on-chip
                                 // compare circuitry  
                fail_s1,      // used for the same purpose as orig_del_bit_s1  
                data_valid_s1,
                decoded_bit_s1;

wire     [3:0]  decoded_column_s1, // decoded vector from spu
                decisions_s1;

wire    [15:0]  path_metrics_s1;
////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////

chip_core chip_core(sync_s1,self_test_s1,external_y_s1,
                    orig_del_bit_s1,fail_s1,data_valid_s1,decoded_bit_s1,
                    decoded_column_s1,decisions_s1,path_metrics_s1,phi1,phi2);

clkgen    clkgen(phi1,phi2);
/*
snooper  chip_snoop( phi1, phi2, sync_s1, self_test_s1, 
	external_y_s1, orig_del_bit_s1, fail_s1, data_valid_s1, 
	decoded_bit_s1, decoded_column_s1, decisions_s1, path_metrics_s1);
*/
//////////////////////// Pseudo-Random Generator /////////////////////////////

// This part implements 8 bit long PSR Gen. (1000000)

wire [7:0] pseudo_in_s1;
reg  [7:0] pseudo_in_s2,
           pseudo_out_s1;
wire       orig_bit_s1;
reg        delayed_bit_s1;

assign pseudo_in_s1 = sync_s1 ? {7'b0,1'b1} : 
 {pseudo_out_s1[6:1],pseudo_out_s1[7] ^ pseudo_out_s1[0],pseudo_out_s1[7]};
 
always @(phi1 or pseudo_in_s1)
      if (phi1)
        pseudo_in_s2 = pseudo_in_s1;

always @(phi2 or pseudo_in_s2)
      if (phi2)
          begin
            pseudo_out_s1 = pseudo_in_s2;
            delayed_bit_s1 <= #2880 pseudo_out_s1[7];
          end
assign orig_bit_s1 = pseudo_out_s1[7];

///////////////////////////////////////////////////////////////////////////////

///////////////////////// Convolutional Encoder //////////////////////////////

// 1/2, constraint size 3 convolutional encoder is implemented in this section
// with generator polynomials (5,7) : (1+D^2,1+D+D^2), "+" => xor

wire       y1_s1,y2_s1; // Artificially defined wires to check self-test in M 
wire [1:0] enc_state_in_s1;
reg  [1:0] enc_state_s1,
           enc_state_s2;

assign enc_state_in_s1 = sync_s1 ? 2'b00 : 
                         {orig_bit_s1,enc_state_s1[1]};

always @(phi1 or enc_state_in_s1)
       if (phi1)
          enc_state_s2 = enc_state_in_s1;
    
always @(phi2 or enc_state_s2)
       if (phi2)
          enc_state_s1 = enc_state_s2;

assign external_y_s1[1] = orig_bit_s1 ^                   enc_state_s1[0];
assign external_y_s1[0] = orig_bit_s1 ^ enc_state_s1[1] ^ enc_state_s1[0];

assign y1_s1 = external_y_s1[0];
assign y2_s1 = external_y_s1[1];
    
///////////////////////////////////////////////////////////////////////////////

///////////////////////// Sync generation /////////////////////////////////////

`define m_length 100

reg [9:0] length_s1,
          length_s2;
reg self_test_tmp_s2;
initial
 begin
   self_test_s1 = 0;
   length_s1 = 0;
   length_s2 = 0;
   sync_s1 = 0;
   $dumpvars; 
/* $gr_waves(   "phi1", phi1,
                "phi2", phi2,
		"sync_s1", sync_s1,
		"length_s1", length_s1,
                "length_s2", length_s2,
                "orig_bit_s1", orig_bit_s1,
                "delayed_bit_s1", delayed_bit_s1,
                "decoded_bit_s1", decoded_bit_s1,
                "external_y_s1", external_y_s1,
                "data_valid_s1", data_valid_s1
		);
*/	
 end

always @(phi1 or length_s1 or self_test_s1)
       if (phi1)
          begin
            length_s2 = length_s1;
            self_test_tmp_s2 = ! self_test_s1;
          end


always @(phi2 or length_s2 or self_test_tmp_s2)
       if (phi2)
          begin
            if (length_s2 == `m_length)
               begin 
                 length_s1 = 0;
                 sync_s1 = 1;
                 self_test_s1 = self_test_tmp_s2;
	       end
            else 
               begin
                 length_s1 = length_s2 + 1;
                 sync_s1 = 0;
               end
          end
//////////////////////////////////////////////////////////////////////////
//////////////////// Writing output to .dat files ////////////////////////

// FILE_self_test_decoded, FILE_self_test_orig, 
// FILE_free_run_decoded, FILE_free_run_orig, contain the original and
// decoded bits in self-test and free-run modes
integer FILE_self_test_decoded,
        FILE_self_test_orig,
        FILE_free_run_decoded,
        FILE_free_run_orig;
reg self_test_l_s1,
    self_test_l_s2,
    sel_initial_s1,
    sel_initial_s2; // imitate latched signals on chip for the purpose of
                    // synchronization during comparison

initial
 begin
   FILE_self_test_decoded = $fopen("self_test_decoded.dat");
   FILE_self_test_orig    = $fopen("self_test_orig.dat");
   FILE_free_run_decoded  = $fopen("free_run_decoded.dat");
   FILE_free_run_orig     = $fopen("free_run_orig.dat");
 end

 always @(phi1 or self_test_s1 or sync_s1)
       if (phi1)
           begin
             self_test_l_s2 = self_test_s1;
             sel_initial_s2 = sync_s1;
           end

 always @(phi2 or self_test_l_s2 or sel_initial_s2)
       if (phi2)
           begin
             self_test_l_s1 = self_test_l_s2;
             sel_initial_s1 = sel_initial_s2;
           end

 // $fwrite is a command which allows you to write text to the file 
 
 always @(phi1 or data_valid_s1 or decoded_bit_s1 or orig_del_bit_s1 or
          delayed_bit_s1 or self_test_l_s1 or sel_initial_s1)
  if (phi1)
     if (data_valid_s1 & !sel_initial_s1)
         if (self_test_l_s1) 
           begin
            $fwrite(FILE_self_test_decoded,"%b\n",decoded_bit_s1);
            $fwrite(FILE_self_test_orig,"%b\n", orig_del_bit_s1);
           end
         else
          begin
            $fwrite(FILE_free_run_decoded,"%b\n", decoded_bit_s1);
            $fwrite(FILE_free_run_orig,"%b\n", delayed_bit_s1);
          end
/////////////////////////////////////////////////////////////////////////     
endmodule










