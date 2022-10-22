//Elise Heim

module FirstLab(clk, rst, rd, rs1, rs2, data_in, read, rs1_out, rs2_out);
	input clk, rst, read;
	input[4:0] rd, rs1, rs2;
	input[31:0] data_in;
	
	output reg[31:0] rs1_out, rs2_out;
	
	reg[31:0] memory[31:0];
	
	integer i;
	
	always @(posedge clk) begin
		if (rst) begin 
			for(i=0; i < 32; i = i + 1)
				memory[i] = 0;
		end
		
		else begin
			if (read) begin
				rs1_out = memory[rs1];
				rs2_out = memory[rs2];
			end
			else begin
				memory[rd] = data_in;
			end
		end
	end
endmodule 