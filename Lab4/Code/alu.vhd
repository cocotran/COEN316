library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
port(
	-- two input operands
	x, y : in std_logic_vector(31 downto 0);
	
	-- 0 = add , 1 = sub
	add_sub : in std_logic ;
	
	-- 00 = AND, 01 = OR , 10 = XOR , 11 = NOR
	logic_func : in std_logic_vector(1 downto 0 ) ;

	-- 00 = lui, 01 = setless , 10 = arith , 11 = logic
	func : in std_logic_vector(1 downto 0 ) ;

	-- output	
	output : out std_logic_vector(31 downto 0) ;
	overflow : out std_logic ;
	zero : out std_logic);
end alu ;

architecture arc of alu is
	signal add_sub_out, logic_out : std_logic_vector(31 downto 0);
begin

	-- add/sub
	add_subtract_process : process(x, y, add_sub)
	begin
		if (add_sub = '0') then
			 add_sub_out <= std_logic_vector(signed(x) + signed(y));	
		else
			add_sub_out <= std_logic_vector(signed(x) - signed(y));
		end if;
	end process;

	-- logic
	logic_process : process(x, y, logic_func)
	begin
		case (logic_func) is
			when "00" => logic_out <= x and y;
			when "01" => logic_out <= x or y;
			when "10" => logic_out <= x xor y;
			when others => logic_out <= x nor y;
		end case;
	end process;

	-- mux
	mux_unit_process : process(y, func, add_sub_out, logic_out)
	begin
		case (func) is
			when "00" => output <= y;
			when "01" => output <= "0000000000000000000000000000000" & add_sub_out(31);
			when "10" => output <= add_sub_out;
			when others => output <= logic_out;
		end case;
	end process;

	-- check zero
	check_zero_process : process(add_sub_out)
	begin
		if (add_sub_out = (add_sub_out'range => '0')) then
			zero <= '1';
		else
			zero <= '0';
		end if;
	end process;

	-- check overflow
	-- Addition
	-- (+x) + (+y) = -z
	-- (-x) + (-y) = +z

	-- Subtraction
	-- (+x) - (-y) = -z
	-- (-x) + (+y) = +z
	check_over_flow_process : process(add_sub, add_sub_out)
	begin
		if (add_sub = '0') then
			-- Add
			overflow <= (not x(31) and not y(31) and add_sub_out(31)) or (x(31) and y(31) and not add_sub_out(31));

		else
			-- Sub
			overflow <= (not x(31) and y(31) and add_sub_out(31)) or (x(31) and not y(31) and not add_sub_out(31));
		end if;
	end process;

end arc;













