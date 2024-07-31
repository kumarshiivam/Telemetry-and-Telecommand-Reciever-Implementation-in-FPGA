module ccsds_telecommand_encoder(
    input wire clk,
    input wire reset,
    input wire [7:0] command_in,
    output reg [7:0] encoded_command
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            encoded_command <= 8'd0;
        end else begin
            // Simple encoding for demonstration (e.g., XOR with a key)
            encoded_command <= command_in ^ 8'hAA;
        end
    end
endmodule
