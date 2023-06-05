`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:28:20 05/19/2023
// Design Name:   TOP_UART
// Module Name:   C:/Users/Pulak Mondal/Desktop/Shiva/UART_Rx_Tx/test_UART.v
// Project Name:  UART_Rx_Tx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP_UART
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_UART;

	// Inputs
	reg clk=1;
	reg rst=1;
	reg Rx;
	reg [4:0] addr_RAM;

	// Outputs
	wire Tx;
	wire [7:0] data_LED;

	// Instantiate the Unit Under Test (UUT)
	TOP_UART uut (clk,rst,Rx,addr_RAM,Tx,data_LED);

	parameter BAUD_rate = 115200;
	reg [31:0] width = 1_000_000_000/BAUD_rate;
    
	 always #7.5 clk=~clk;
	 
	 initial begin
			rst=0;
			#(15*width) rst=1;
			addr_RAM = 5'b0000;
		  Rx=1;
		  #width rst=0;
		  #(10*width);
		  #(width*2) Rx=0; // start bit  10=0000_1010
		  #width Rx=0;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=0;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=0;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   15=0000_1111
		  #width Rx=1;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=0;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   25=0001_1001
		  #width Rx=1;     //data[0]
		  #width Rx=0;     //data[1]
		  #width Rx=0;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   31=0001_1111
		  #width Rx=1;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   45=0010_1101
		  #width Rx=1;     //data[0]
		  #width Rx=0;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=0;     //data[4]
		  #width Rx=1;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   64=0100_0000
		  #width Rx=0;     //data[0]
		  #width Rx=0;     //data[1]
		  #width Rx=0;     //data[2]
		  #width Rx=0;     //data[3]
		  #width Rx=0;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=1;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   99=0110_0011
		  #width Rx=1;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=0;     //data[2]
		  #width Rx=0;     //data[3]
		  #width Rx=0;     //data[4]
		  #width Rx=1;     //data[5]
		  #width Rx=1;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit

			#(width*15) Rx=0; // start bit 	127 = 0111_1111
		  #width Rx=1;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=1;     //data[5]
		  #width Rx=1;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   155 = 1001_1011
		  #width Rx=1;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=0;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=1;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   255 = 1111_1111
		  #width Rx=1;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=1;     //data[5]
		  #width Rx=1;     //data[6]
		  #width Rx=1;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   190 = 1011_1110
		  #width Rx=0;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=1;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=1;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=1;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   84=0101_0100
		  #width Rx=0;     //data[0]
		  #width Rx=0;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=0;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=1;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   55=0011_0111
		  #width Rx=1;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=0;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=1;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   32 = 0010_0000
		  #width Rx=0;     //data[0]
		  #width Rx=0;     //data[1]
		  #width Rx=0;     //data[2]
		  #width Rx=0;     //data[3]
		  #width Rx=0;     //data[4]
		  #width Rx=1;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   20 = 0001_0100
		  #width Rx=0;     //data[0]
		  #width Rx=0;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=0;     //data[3]
		  #width Rx=1;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   7 = 0000_0111
		  #width Rx=1;     //data[0]
		  #width Rx=1;     //data[1]
		  #width Rx=1;     //data[2]
		  #width Rx=0;     //data[3]
		  #width Rx=0;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*15) Rx=0; // start bit   1 = 0000_0001
		  #width Rx=1;     //data[0]
		  #width Rx=0;     //data[1]
		  #width Rx=0;     //data[2]
		  #width Rx=0;     //data[3]
		  #width Rx=0;     //data[4]
		  #width Rx=0;     //data[5]
		  #width Rx=0;     //data[6]
		  #width Rx=0;     //data[7]
		  #width Rx=1;     //stop bit
		  
		  #(width*5) 
		  #(width*5) addr_RAM = 5'b0001;
		  #(width*5) addr_RAM = 5'b0010;
		  #(width*5) addr_RAM = 5'b0011;
		  #(width*5) addr_RAM = 5'b0100;
		  #(width*5) addr_RAM = 5'b0101;
		  #(width*5) addr_RAM = 5'b1000;
		  
		  
   end
      
endmodule

