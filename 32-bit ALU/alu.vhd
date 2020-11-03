
-- g_<name> corresponds to Generic
-- p_<name> corresponds to Port
-- c_<name> corresponds to Constant
-- s_<name> corresponds to Signal

ENTITY alu IS 
    GENERIC (
        g_size : integer := 32
    );
    PORT(
        p_A     : IN std_logic_vector(g_size - 1 DOWNTO 0);
        p_B     : IN std_logic_vector(g_size - 1 DOWNTO 0);
        p_cin   : IN std_logic;
        p_sin   : IN std_logic;
        p_funct : IN std_logic_vector(4 DOWNTO 0);
        p_sout  : OUT std_logic;
        p_cout  : OUT std_logic;
        p_Ov    : OUT std_logic;
        p_Z    : OUT std_logic_vector(g_size - 1 DOWNTO 0)
    );
END alu;
