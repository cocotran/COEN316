library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity next_address is
	port(
		-- two register inputs
		rt, rs : in std_logic_vector(31 downto 0);

		-- PC register
		pc : in std_logic_vector(31 downto 0);

		target_address : in std_logic_vector(25 downto 0);

		branch_type : in std_logic_vector(1 downto 0);
		pc_sel : in std_logic_vector(1 downto 0);

		next_pc : out std_logic_vector(31 downto 0));
end next_address ;

architecture arch of next_address is

	signal branch_out : std_logic_vector(31 downto 0);
	signal sign_extended_branch_offset : std_logic_vector(31 downto 0);

begin

	sign_extended_branch_offset(31 downto 16) <= (others => target_address(15)); 
	sign_extended_branch_offset(15 downto 0) <= target_address(15 downto 0);


	pc_select_process : process(pc_sel, target_address, rs, pc, branch_out, sign_extended_branch_offset)
	begin
		case( pc_sel ) is		

			when "00" => next_pc <= (branch_out AND sign_extended_branch_offset) + pc + 1;

			when "01" => next_pc <= "000000" & target_address;

			when "10" => next_pc <= rs;

			when others => next_pc <= (others => '0');

		end case;
	end process;


	branch_select_process: process(pc, branch_type, rs, rt)
	begin
		case ( branch_type ) is
			-- no branch
			when "00" => branch_out <= (others => '0');

			-- beq
			when "01" =>
				if rs = rt then
					branch_out <= (others => '1');
				else
					branch_out <= (others => '0');
				end if;

			-- bne
			when "10" =>
				if rs /= rt then
					branch_out <= (others => '1');
				else
					branch_out <= (others => '0');
				end if;

			-- bltz
			when others =>
				-- check if negative
				if rs(31) = '1'  then
                    branch_out <= (others => '1');
                else
                    branch_out <= (others => '0');
                end if ;

		end case;
	end process;

end arch;














