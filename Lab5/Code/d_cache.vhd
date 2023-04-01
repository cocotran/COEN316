library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity d_cache is
	port( 
		din : in std_logic_vector(31 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		write : in std_logic;
		address : in std_logic_vector(4 downto 0);
		d_out : out std_logic_vector(31 downto 0));
end d_cache ;

architecture arch of d_cache is

    type t_reg_array is array (0 to 31) of std_logic_vector(31 downto 0);
    signal reg_array  : t_reg_array;

begin

    writing : process( clk,reset )
    begin
        if (reset = '1') then
            for i in 0 to 31 loop
                reg_array(i) <= "00000000000000000000000000000000";
            end loop ;
        
        elsif (clk'event and clk='1') then
            if (write='1') then -- only write under this condition
                reg_array(conv_integer(address)) <= din;
            end if;

        end if;
    end process; 


    reading : process( address,reg_array )
    begin
    	d_out <= reg_array(conv_integer(address));
    end process;

end arch ;
