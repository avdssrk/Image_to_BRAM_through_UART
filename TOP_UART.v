`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:46 05/19/2023 
// Design Name: 
// Module Name:    TOP_UART 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TOP_UART(input clk,
					input rst,
					input Rx,
					input [9:0] addr_b,
					output Tx,
					output [7:0] data_ram);
	
	parameter [21:0] baud_rate=115200;   //9600, 19200, 115200
   parameter [4:0] divisions =16;
	
	parameter [7:0] READY_RX = 8'b00110011;
    
    
    wire ticks;
	 wire Tx_en;
	 wire Tx_done;
	 
	 reg status_flag=1;
	 reg [3:0] count_data=0;
	 
//	 always@(posedge rst) 
//	 begin
//			status_flag=1;
//			count_data<=0;
//	 end
    
    Baud_rate_generator buad_en_16_x(clk,baud_rate,divisions,ticks);
	 
    UART_rx uart_rx(Rx,rst,clk,ticks,addr_b,Rx_Data,Tx_en,data_ram);
	 
	 UART_tx uart_tx(clk,ticks,rst,READY_RX,status_flag,Tx,Tx_done);
	 
	
	// To reset the status flag after transmission is done
	always @(posedge ticks)
	begin	
		if(Tx_done==1)
			status_flag<=0;
		else if(rst==1) begin
			status_flag<=1;
		end
		else begin
			status_flag<=0;
		end
	end
	


endmodule
