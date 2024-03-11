// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps
`timescale 1 ns/10 ps

module eq2_testbench;
   // signal declaration
   reg  [5:0] test_inA, test_inB;
   reg [2:0] fxn;
   wire  [5:0] test_out;
   wire test_lt;

   // instantiate the circuit under test
   ALU uut (.A(test_inA), .B(test_inB), .fxn(fxn), .led(test_out), .output_lt(test_lt));

   //  test vector generator
   initial
   begin
      // test vector 1
      test_inA = 6'b000001;
      test_inB = 6'b000001;
      fxn = 3'b110;
      # 20;
      // test vector 2
      test_inA = 6'b000010;
      test_inB = 6'b000001;
      fxn = 3'b111;
      # 20;
      
      // test vector 3
      test_inA = 6'b000011;
      test_inB = 6'b000100;
      fxn = 3'b010;
      # 20;
      // test vector 4
      test_inA = 6'b000011;
      test_inB = 6'b000100;
      fxn = 3'b011;
      # 20;
      
      //less than
      
      // test vector 5
      test_inA = 6'b000011;
      test_inB = 6'b000001;
      fxn = 3'b100;
      # 20;
      // test vector 6
      test_inA = 6'b000001;
      test_inB = 6'b000100;
      fxn = 3'b100;
      # 20;
      
      //xor
      
      // test vector 7
      test_inA = 6'b000011;
      test_inB = 6'b000001;
      fxn = 3'b101;
      # 20;
      // test vector 8
      test_inA = 6'b000001;
      test_inB = 6'b000100;
      fxn = 3'b101;
      # 20;
      
      // stop simulation
      $stop;
   end
   

endmodule