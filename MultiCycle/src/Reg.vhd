library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Reg is 
	generic(width: integer := 32);
	port(
		clk, reset: in STD_LOGIC;
		d: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		q: out STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end Reg;

architecture Asynch of Reg is 
begin
	process(clk, reset) begin
        if(reset = '1') then 
            q <= (others => '0');
        elsif (rising_edge(clk)) then 
            q <= d;
		end if;
	end process;
end Asynch;

