library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Controller is
	port(
		opcode, funct: in STD_LOGIC_VECTOR(5 DOWNTO 0);
		ALUControl:   out STD_LOGIC_VECTOR(2 DOWNTO 0);
		ZeroFlag:                         in STD_LOGIC;
		MemWrite, MemToReg:              out STD_LOGIC; 
		RegWrite, RegDist:               out STD_LOGIC;
		ALUSrc, PCSrc:                   out STD_LOGIC;
		jump:                            out STD_LOGIC;
	);
end Controller;

architecture Structural of Controller is 
	component MainControlDecoder is 
		port(
			opcode:  in STD_LOGIC_VECTOR(5 DOWNTO 0);
			ALUOp:  out STD_LOGIC_VECTOR(1 DOWNTO 0);
			MemWrite, MemToReg: 	   out STD_LOGIC;
			RegDist, RegWrite:  	   out STD_LOGIC;
			ALUSrc, branch, jump   	   out STD_LOGIC;
		);
	end component;
	component ALUControlDecoder is 
		port(
			funct: 		 in STD_LOGIC_VECTOR(31 DOWNTO 26);
			ALUOp: 		   in STD_LOGIC_VECTOR(1 DOWNTO 0);
			ALUControl:   out STD_LOGIC_VECTOR(2 DOWNTO 0);
		);
	end component;
	SIGNAL ALUOp: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL branch: STD_LOGIC;
begin
	MainDecoder: MainControlDecoder port map(opcode, ALUOp, MemWrite, MemToReg, RegDist, RegWrite, ALUSrc, branch, jump);
	ALUDecoder: ALUControlDecoder port map(funct, ALUOp, ALUControl);
	PCSrc <= branch AND ZeroFlag;
end Structural;