//Elise Heim
//Testbench

`timescale 1ns/1ps

module FirstLab_Testbench();
		reg clk, rst, read;
		reg[4:0] rd, rs1, rs2;
		reg[31:0] data_in;
		wire[31:0] rs1_out, rs2_out;
	
		// FirstLab(clk, rst, rd, rs1, rs2, data_in, read, rs1_out, rs2_out)
		FirstLab	regFile(clk, rst, rd, rs1, rs2, data_in, read, rs1_out, rs2_out);
		
		always begin
			#5 clk <= ~clk;
		end
		
		initial begin
			clk <= 0;
			rst <= 1; 
			#5 rst <= 0;
			
			//write first time
			#15 read <= 0;
			data_in <= 50;
			rd <= 1;
			
			//write second time
			#15 read <= 0;
			data_in <= 25;
			rd <= 27;
			
			//read first time
			#15 read <= 1;
			rs1 <= 1;
			rs2 <= 27;
			
			//write third time
			#15 read <= 0;
			data_in <= 5;
			rd <= 3;
			
			//read second time
			#15 read <= 1;
			rs1 <= 1;
			rs2 <= 3;
			
			//read third time 
			#15 read <= 1;
			rs1 <= 27;
			rs2 <= 3;
			
			//finish testing
			#15 $stop;
			
		end
		
endmodule


