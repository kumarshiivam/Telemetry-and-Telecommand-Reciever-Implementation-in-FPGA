module rf_receiver_telemetry(
    input wire clk,
    input wire reset,
    input wire rf_in,
    output reg received_data
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            received_data <= 0;
        end else begin
            received_data <= rf_in;
        end
    end
endmodule
