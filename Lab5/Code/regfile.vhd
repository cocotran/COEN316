-- 32 x 32 register file
-- two read ports, one write port with write enable
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity regfile is
	port( 
	din : in std_logic_vector(31 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	write : in std_logic;
	read_a : in std_logic_vector(4 downto 0);
	read_b : in std_logic_vector(4 downto 0);
	write_address : in std_logic_vector(4 downto 0);
	out_a : out std_logic_vector(31 downto 0);
	out_b : out std_logic_vector(31 downto 0));
end regfile ;

architecture arch of regfile is
	type t_register_array is array (0 to 31) of std_logic_vector(31 downto 0);
	signal register_array: t_register_array;
begin
	
	-- asynchronous reset and synchronous write
	write_process : process(reset, clk, write)
	begin
		if (reset = '1') then
			for i in 0 to 31 loop
				register_array(i) <= "00000000000000000000000000000000";
			end loop;
		elsif (write = '1' and rising_edge(clk)) then
			register_array(to_integer(unsigned(write_address))) <= din;
		end if;
	end process;


	-- asynchronous read
	read_process : process(read_a, read_b, register_array)
	begin
		out_a <= register_array(to_integer(unsigned(read_a)));
		out_b <= register_array(to_integer(unsigned(read_b)));
	end process;
end arch;
