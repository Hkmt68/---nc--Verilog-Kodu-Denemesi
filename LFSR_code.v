`timescale 1ns / 1ps

module LFSR_code (

input clk,
output Q,
input load_enable,
input shift_enable,
input [31:0] seed

);

reg [31:0] Q_reg;


wire taps ;

always @(posedge clk  )
begin
    if (load_enable)
        Q_reg <= seed;
    else if (shift_enable)
        Q_reg <= {Q_reg [30:0],taps };
    else
    Q_reg <=Q_reg ;
end

assign Q=Q_reg[31] ;
assign taps = Q_reg [31]^(Q_reg[20]^(Q_reg [1]^Q_reg[0]));



endmodule