`timescale 1ns / 1ps
`include "LFSR_code.v"

module LFSR_code_tb ();

    reg clk ;
    wire  Q;
    integer  f ;
    integer i;
    reg load_enable;
    reg shift_enable;
    reg [31:0] seed ;
    LFSR_code LFSR_code_tb (.clk(clk),.Q(Q),.load_enable(load_enable),.shift_enable(shift_enable),.seed(seed));
always
begin
    clk = 1'b0;
    #10;
    clk=1'b1;
    #10; 
end

initial 
begin 
f=$fopen("verilog_lfsr_out","w");
$dumpfile("LFSR_code_tb.vcd");
$dumpvars(0, LFSR_code_tb);
clk=0;
seed=32'h00003039;
load_enable=1;
shift_enable=0;
#20;
load_enable=0;
shift_enable=1;

for (i=0 ; i<200 ; i= i+1)
begin 
    #20;
    @(posedge clk );
    $fwrite (f,"%b\n",Q);
end
    $fclose(f);
    $finish;
end 

endmodule//Â LFSR_TB