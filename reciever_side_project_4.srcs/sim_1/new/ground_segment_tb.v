`timescale 1ns/1ps
module ground_segment_tb;
    reg clk;
    reg reset;
    reg [7:0] telecommand_in;
    wire [7:0] telemetry_out;
    ground_segment uut (
        .clk(clk),
        .reset(reset),
        .telecommand_in(telecommand_in),
        .telemetry_out(telemetry_out)
    );
    always #5 clk = ~clk; 
     initial begin
        clk = 0;
        reset = 1;
        telecommand_in = 8'd0;
        #20 reset = 0;
        #10 telecommand_in = 8'h55; // Example telecommand
        #20 telecommand_in = 8'hAA; // Example telecommand
        #20 telecommand_in = 8'hFF; // Example telecommand
        #20 telecommand_in = 8'h00; // Example telecommand
        #100 $stop;
    end
    initial begin
        $monitor("Time=%0t : Telecommand=%h, Telemetry=%h", $time, telecommand_in, telemetry_out);
    end
endmodule
