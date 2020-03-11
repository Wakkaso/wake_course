////////////////////////////////////////////////////////////////////////////
// Module controller.v 
// Hierarchy: chip_core.v
// Module function: 
//  Module controller.v provides several functions:
//    - provides the parallel load signal to  ACS units with sel_initial_s1 
//    - generates data_valid_s1 signal to indicate the valid decoded bits
//    - generates and encodes the bit sequence when in self-test mode 
//    
// Revision history:
//   Fri Jan 22 1999 16:19:33 - 19:50:04 (created)
//   Sat Feb 13 1999 01:52:02 (removed branch metrics)
/////////////////////////////////////////////////////////////////////////////

module controller(sync_s1,self_test_s1,decoded_column_s1, external_y_s1,
                  sel_initial_s1,data_valid_s1,fail_s1,orig_del_bit_s1,
                  decoded_bit_s1, y2_s1,y1_s1,phi1,phi2);
//////////////////////////////////////////////////////////////////////////////

input       sync_s1;                 // puts the decoder into the initial state on the start of
                                     // the burst sequence
input       self_test_s1;            // puts the decoder in the self-test mode

input [3:0] decoded_column_s1;       // The decoded bit is determined from the 
			                               // decoded column and in the self test mode,
                                     // compared with the original bit generated
                                     // by the pseudo-random generator
input [1:0] external_y_s1;           // y2y1 encoded bits comming from the pins

input       phi1,
            phi2;

output      sel_initial_s1;          // generated to initialize the ACS unit at the
reg         sel_initial_s1;          // begining of the sequence, by sampling the input sync signal.

output      data_valid_s1;           // Active high when decoded bits appear at the
reg         data_valid_s1;           // output of SPU

output      fail_s1;                 // Active high when, in self-test mode, original_bit_s1
                                     // differs from the decoded_bit_s1

output      decoded_bit_s1;

output      orig_del_bit_s1;         // The delayed output of the pseudo_random generator
    

output      y2_s1, y1_s1;


/////////////////// Input latching //////////////////////////////////////////
reg	          sync_s2,
              self_test_s2,
              self_test_l_s1;

reg  [1:0]    external_y_s2,
              external_yl_s1;
 
always @ (phi1 or sync_s1 or self_test_s1 or external_y_s1)
	if (phi1)
          begin
	          sync_s2 = sync_s1;
            self_test_s2 = self_test_s1;
            external_y_s2 = external_y_s1;
          end

always @ (phi2 or sync_s2 or self_test_s2 or external_y_s2 )
	if (phi2)
            begin
	            sel_initial_s1 = sync_s2;
              self_test_l_s1 = self_test_s2;
              external_yl_s1 = external_y_s2;
            end


///////////////////////// Shift Register /////////////////////////////////////

wire   [10:0] shift_in_s1;
reg    [10:0] shift_in_s2,
              shift_out_s1;

wire          orig_bit_s1;
wire          data_valid_in_s1;
reg           data_valid_s2;
	
// When sel_initial is high shift register is initialized to 1 and  shifts
// out 1 after 11 cycles which is going to trigger the data valid
// signal. Besides that, when in self-test mode, it delays the original bits
// of the pseudo random generator, needed for the comparison with the decoded
// bits from SPU.

assign shift_in_s1 =  sel_initial_s1 ? {10'b0,1'b1} : {shift_out_s1[9:0],orig_bit_s1};

///////////////////////////////////////////////////////////////////////////////

                                    
always @(phi1 or shift_in_s1)
     if (phi1)
         shift_in_s2 = shift_in_s1;

always @(phi2 or shift_in_s2)
     if (phi2)
         shift_out_s1 = shift_in_s2;           

assign orig_del_bit_s1 = shift_out_s1[10];

// In the cycle prior to the first bit of the sequence sync_s1 is sampled
// into sel_initial_s1. sel_initial_s1 deasserts data_valid_s1 and asserts
// it eleven cycles later as the first one is being shifted out of the
// shift register. Once data_valid_s1 is asserted it can be deasserted
// only with sel_initial_s1

assign data_valid_in_s1 =  sel_initial_s1 ? 0 : 
        ( (!data_valid_s1 & shift_out_s1[10]) ? 1 : data_valid_s1);
        
always @(phi1 or data_valid_in_s1)
      if (phi1)
        data_valid_s2 = data_valid_in_s1;

always @(phi2 or data_valid_s2)
      if (phi2)
        data_valid_s1 = data_valid_s2;


//////////////////////// Pseudo-Random Generator /////////////////////////////

// This part implements 7 bit long PSR Gen. (100000)

wire [6:0] pseudo_in_s1;
reg  [6:0] pseudo_in_s2,
           pseudo_out_s1;

assign pseudo_in_s1 = sel_initial_s1 ? {6'b0,1'b1} : 
      {pseudo_out_s1[5:1],pseudo_out_s1[6] ^ pseudo_out_s1[0],pseudo_out_s1[6]};
 
always @(phi1 or pseudo_in_s1)
      if (phi1)
        pseudo_in_s2 = pseudo_in_s1;

always @(phi2 or pseudo_in_s2)
      if (phi2)
        pseudo_out_s1 = pseudo_in_s2;

assign orig_bit_s1 = pseudo_out_s1[6];


///////////////////////// Convolutional Encoder //////////////////////////////

// 1/2, constraint size 3 convolutional encoder is implemented in this section
// with generator polynomials (5,7) : (1+D^2,1+D+D^2), "+" => xor

wire [1:0] enc_state_in_s1;
reg  [1:0] enc_state_s1, enc_state_s2;
wire       self_test_y1_s1,               // encoded outputs for self-test mode
           self_test_y2_s1;

assign enc_state_in_s1 = sel_initial_s1 ? 2'b00 : {orig_bit_s1,enc_state_s1[1]};

always @(phi1  or enc_state_in_s1)
       if (phi1)
          enc_state_s2 = enc_state_in_s1;
    
always @(phi2 or  enc_state_s2)
       if (phi2)
          enc_state_s1 = enc_state_s2;
    
assign self_test_y2_s1 = orig_bit_s1 ^                   enc_state_s1[0];
assign self_test_y1_s1 = orig_bit_s1 ^ enc_state_s1[1] ^ enc_state_s1[0];

///////////////////////////////////////////////////////////////////////////////

assign {y2_s1,y1_s1} = self_test_l_s1 ? {self_test_y2_s1,self_test_y1_s1} : external_yl_s1;


//////////////////////////// Self-Test ///////////////////////////////////////

// majority function (can be just decoded_column_s1[0], but we will try
// the majority function in order to decrease the error rate

assign decoded_bit_s1 = (decoded_column_s1[3] & decoded_column_s1[2]) | 
                        (decoded_column_s1[1] & decoded_column_s1[0]);

// fail_s1 is valid signal only when in self_test mode
 
assign fail_s1 = sel_initial_s1 ? 0:
                 self_test_l_s1 & data_valid_s1 & (orig_del_bit_s1 != decoded_bit_s1);

// When sel_initial_s1 is high fail_s1 is low. fail is deasserted in
// free-run mode and also in self_test mode before data_valid goes high.
//////////////////////////////////////////////////////////////////////////////
endmodule










