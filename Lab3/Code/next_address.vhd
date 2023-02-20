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

begin

	-- pc select process
	-- branch type process

end arch;
