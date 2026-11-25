module alu (
	input[31:0] a,
	input[31:0] b,
	input [3:0] alu_ctrl,
	output reg [31:0] result,
	output		zero

);

	localparam ALU_ADD = 4'b0000;
	localparam ALU_SUB = 4'b0001;
	localparam ALU_AND = 4'b0010;
        localparam ALU_OR = 4'b0011;
        localparam ALU_XOR = 4'b0100;
        localparam ALU_SLL = 4'b0101;
        localparam ALU_SRL = 4'b0110;
        localparam ALU_SRA = 4'b0111;
        localparam ALU_SLT = 4'b1000;
        localparam ALU_SLTU = 4'b1001;

	always@(*) begin 
	    case (alu_ctrl)
	        ALU_ADD: result = a+b;
	        ALU_SUB: result = b-a;
	        ALU_AND: result = a&b;
		default: result =32'b0;
	    endcase
	end
endmodule
