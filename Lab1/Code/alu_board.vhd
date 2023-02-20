library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

entity alu is
port(
	x_in, y_in : in std_logic_vector(3 downto 0); -- two input
	-- operands
	add_sub : in std_logic ;
	-- 0 = add , 1 = sub
	logic_func : in std_logic_vector(1 downto 0 ) ; -- 00 = AND,
	-- 01 = OR , 10 = XOR , 11 = NOR
	func : in std_logic_vector(1 downto 0 ) ; -- 00 = lui,5
	-- 01 = setless , 10 = arith , 11 = logic
	output_out : out std_logic_vector(3 downto 0) ;
	overflow : out std_logic ;
	zero : out std_logic);
end alu ;

architecture arc of alu is
	signal x,y, output, add_sub_out, logic_out : std_logic_vector(31 downto 0);
begin
	
	-- assign port inputs to internal signals x and y
	x(3 downto 0) <= x_in(3) & x_in(2) & x_in(1) & x_in(0);
	y(3 downto 0) <= y_in(3) & y_in(2) & y_in(1) & y_in(0);
	x(31 downto 4) <= (others => '0');
	y(31 downto 4) <= (others => '0');
	
	output_out(3 downto 0) <= output(3 downto 0);

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
