module rf_transmitter_telecommand(
    input wire clk,
    input wire reset,
    input wire modulated_in,
    output reg rf_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rf_out <= 0;
        end else begin
            rf_out <= modulated_in;
        end
    end
endmodule
