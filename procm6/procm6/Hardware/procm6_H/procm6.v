module procm6 (
input clk, rst,
input signed [31:0] io_in,
output signed [31:0] io_out,
output [1:0] req_in,
output [1:0] out_en);

wire signed [31:0] in_float;
wire signed [31:0] out_float;

assign in_float = io_in;

wire proc_req_in, proc_out_en;
wire [0:0] addr_in;
wire [0:0] addr_out;

proc_fx #(.NUBITS(32),
.MDATAS(498),
.MINSTS(8471),
.SDEPTH(16),
.NUIOIN(2),
.NUIOOU(2),
.MLT(1),
.ADD(1),
.LES(1),
.DIV(1),
.DFILE("C:/Users/LuccaViccini/Desktop/UFJF/IC/VIC_CERN/nipscernufjf/Analise_Ponto_Fixo/procm6/procm6/Hardware/procm6_H/procm6_data.mif"),
.IFILE("C:/Users/LuccaViccini/Desktop/UFJF/IC/VIC_CERN/nipscernufjf/Analise_Ponto_Fixo/procm6/procm6/Hardware/procm6_H/procm6_inst.mif")
) p_procm6 (clk, rst, in_float, out_float, addr_in, addr_out, proc_req_in, proc_out_en);

assign io_out = out_float;

addr_dec #(2) dec_in (proc_req_in, addr_in , req_in);
addr_dec #(2) dec_out(proc_out_en, addr_out, out_en);

endmodule
