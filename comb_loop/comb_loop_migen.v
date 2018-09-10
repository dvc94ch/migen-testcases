/* Machine-generated using Migen */
`default_nettype none

module top(
	input sys_clk,
	output a,
	output b,
	output reg c
);


initial begin
	c = 1'd0;
end

assign a = (~sys_clk);
assign b = c;
always @(*) begin
	c = 1'd0;
	if (a) begin
		c = 1'd0;
	end else begin
		c = 1'd1;
	end
end

endmodule
