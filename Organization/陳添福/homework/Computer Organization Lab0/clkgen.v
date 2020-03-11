/////////////////////////////////////////////////////////////////////////////
module clkgen(phi1, phi2);
/////////////////////////////////////////////////////////////////////////////


 output        phi1,           // Two-phase non-overlapping clocks
                phi2;

  reg           phi1,
                phi2;
          // Start with both clocks low
  initial
    begin
      phi1 = 0;
      phi2 = 0;
      #30000 $finish;
    end

  // Generate two-phase non-overlapping clock waveforms
  always
    begin
      #20 phi1 = 0; // 1ns scale works  
      #5 phi2 = 1;
      #20 phi2 = 0; 
      #5 phi1 = 1;
    end 
              
endmodule


