module ccsds_telemetry_decoder(
    input wire clk,
    input wire reset,
    input wire [7:0] telemetry_in,
    output reg [7:0] decoded_telemetry
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            decoded_telemetry <= 8'd0;
        end else begin
            // Simple decoding for demonstration (e.g., XOR with the same key)
            decoded_telemetry <= telemetry_in ^ 8'hAA;
        end
    end
endmodule
