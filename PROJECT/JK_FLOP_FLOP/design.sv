
module jk_ff(clk, rst, j, k, q, q_bar);
	input clk, rst, j, k;
	output reg q;
	output q_bar;

	always_ff @(posedge clk or negedge rst)
		begin
			if(!rst)
				begin
					q <= 0;
				end
			else 
				begin
//					$display("I am in Case");
					case({j,k})
						2'b00:  q <= q;
						2'b01:  q <= 0;
						2'b10:  q <= 1;
						2'b11:  q <= ~q;
					endcase
				end
		end

	assign q_bar = ~q;

endmodule
