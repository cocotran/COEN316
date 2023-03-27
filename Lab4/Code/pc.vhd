library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity pc is
	port (
		din : in std_logic_vector(31 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		dout: out std_logic_vector(31 downto 0)
	);
end pc;

architecture arch of pc is

begin

    clock : process( clk, reset )
    begin
        if (reset = '1') then
            dout <= (others => '0');
        
        elsif (clk'event and clk='1') then
            dout <= din;
        end if ;
    end process ; -- write
    --------------------------------------------------------------------------------------------------

end arch ;
