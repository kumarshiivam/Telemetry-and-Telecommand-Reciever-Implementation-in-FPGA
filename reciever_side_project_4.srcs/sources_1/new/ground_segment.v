module ground_segment(
    input wire clk,
    input wire reset,
    input wire [7:0] telecommand_in,
    output wire [7:0] telemetry_out
);
    wire [7:0] encoded_command;
    wire modulated_command;
    wire rf_command;
    wire received_rf;
    wire [7:0] demodulated_telemetry;
    wire [7:0] received_telemetry;

    ccsds_telecommand_encoder telecommand_encoder (
        .clk(clk),
        .reset(reset),
        .command_in(telecommand_in),
        .encoded_command(encoded_command)
    );

    telecommand_subcarrier_modulator telecommand_modulator (
        .clk(clk),
        .reset(reset),
        .data_in(encoded_command),
        .modulated_out(modulated_command)
    );

    rf_transmitter_telecommand rf_transmitter (
        .clk(clk),
        .reset(reset),
        .modulated_in(modulated_command),
        .rf_out(rf_command)
    );

    rf_receiver_telemetry rf_receiver (
        .clk(clk),
        .reset(reset),
        .rf_in(rf_command),
        .received_data(received_rf)
    );

    telemetry_subcarrier_demodulator telemetry_demodulator (
        .clk(clk),
        .reset(reset),
        .received_data(received_rf),
        .demodulated_data(demodulated_telemetry)
    );

    ccsds_telemetry_decoder telemetry_decoder (
        .clk(clk),
        .reset(reset),
        .telemetry_in(demodulated_telemetry),
        .decoded_telemetry(received_telemetry)
    );

    assign telemetry_out = received_telemetry;

endmodule
