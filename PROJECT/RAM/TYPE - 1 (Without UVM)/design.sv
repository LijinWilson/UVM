module RAM #(parameter addr_width = 4, data_width = 8, depth = 16) (clk, rst, cs, wr_en, rd_en, wr_addr, rd_addr, data_in, data_out);
	input clk, rst, cs, wr_en, rd_en;
	input [addr_width-1:0] wr_addr, rd_addr;
	input [data_width-1:0] data_in;
  output reg [data_width-1:0] data_out;
	
	// =============== SPECIFICATION ==============
	// Address of each RAM Location, addr is of 4 bit;
	// Each RAM Location can write and read out data of 8 bit.
	// RAM having Location Depth of 16.
	
	// Internal Reg
	reg [data_width-1:0] MEM [0:depth-1];
	
	always @(posedge clk or negedge rst)
		begin
			if(!rst)
				begin
					data_out <= 0;
					for(integer i = 0; i < depth; i++)
						begin
							MEM[i] <= 0;
						end
				end
				else 
					begin
						if(cs)
								begin
									if(wr_en)
										begin
											MEM[wr_addr] <= data_in; // write operation
										end
									if(rd_en)
										begin
											data_out <= MEM[rd_addr]; // Read operation
										end
								end
					end
		end
		
endmodule
						
					
	
	
