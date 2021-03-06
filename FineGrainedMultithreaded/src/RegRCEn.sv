`timescale 1 ns / 1 ps

module RegRCEn #(parameter WIDTH = 32)(
	input logic reset, clear, clk,
	input logic en,
	input logic[WIDTH - 1:0] d,
	output logic[WIDTH - 1:0] q
    );

    always_ff @ (posedge clk, posedge reset, posedge clear)
    begin
        if (reset || clear)
            q <= 0;
        else begin
            if (en) q <= d;
        end 
    end
endmodule
