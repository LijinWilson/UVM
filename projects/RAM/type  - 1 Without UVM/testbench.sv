module norm_ram_tb();

	parameter addr_width = 4;
  parameter data_width = 8;
  parameter depth      = 16;

	reg clk = 0, rst, cs, wr_en, rd_en;
	reg [addr_width-1:0] wr_addr, rd_addr;
	reg [data_width-1:0] data_in;
	
	wire [data_width-1:0] data_out;
	
	// instantiating main top module
	RAM #(addr_width, data_width, depth) tt1(clk, rst, cs, wr_en, rd_en, wr_addr, rd_addr, data_in, data_out);
	
	
	//Clock Generation
	initial
		begin
			forever #5 clk = ~clk;
			
		end
		
	
	//Stimulus Generation
	initial
		begin
			
			cs = 1;
			rst = 0;
			
			#10;
			
			rst = 1;
			
			#10;
			
			wr_en = 1;
			rd_en = 0;
			
			#10;
		
			// WRITE Operation
			for(integer i = 0; i < depth; i++)
				begin
					wr_addr = i;
					data_in = i + 10;
					@(posedge clk);
				end
				
			#10; 
			
			wr_en = 0;
			rd_en = 1;
			
			// READ Operation
			for(integer i = 0; i < depth; i++)
				begin
					rd_addr = i;
					// data_out = tt1.MEM[rd_addr];
					@(posedge clk);
					@(posedge clk);
				end
				
			#20; $finish();
		end
		
	initial
		begin
			$monitor("TIME = %0t | rst = %0b | cs = %0b | wr_en = %0b | rd_en = %0b | wr_addr = %0d | rd_addr = %0d | data_in = %0d | data_out = %0d", $time, rst, cs, wr_en, rd_en, wr_addr, rd_addr, data_in, data_out);
		end
		
endmodule
		
