
-- g_<name> corresponds to Generic
-- p_<name> corresponds to Port
-- c_<name> corresponds to Constant
-- s_<name> corresponds to Signal

-- Packages
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- Entity Port and Generic
ENTITY alu IS 
    GENERIC (
        g_size : integer := 32
    );
    PORT(
        p_A     : IN signed(g_size - 1 DOWNTO 0);
        p_B     : IN signed(g_size - 1 DOWNTO 0);
        p_cin   : IN integer;
        p_sin   : IN std_logic;
        p_funct : IN signed(3 DOWNTO 0);
        p_sout  : OUT std_logic;
        p_cout  : OUT std_logic;
        p_Ov    : OUT std_logic;
        p_Z     : OUT signed(g_size - 1 DOWNTO 0)
    );
END alu;

-- Entity Architecture
ARCHITECTURE arch OF alu IS
    -- Design decision
    CONSTANT c_zero : signed(g_size -1 DOWNTO 0) := (others => '0');

    SIGNAL s_AplusB             : signed(g_size DOWNTO 0);
    SIGNAL s_AplusB_Ov          : std_logic;
    SIGNAL s_AplusBplusCin      : signed(g_size DOWNTO 0);
    SIGNAL s_AplusBplusCin_Ov   : std_logic;
    SIGNAL s_GT                 : std_logic;
    SIGNAL s_LT                 : std_logic;
    SIGNAL s_EQ                 : std_logic;

BEGIN
    s_AplusB    <=  ('0' & p_A) + ('0' & p_B);
    s_AplusB_Ov <=  (p_A(g_size - 1) AND p_B(g_size - 1) AND NOT s_AplusB(g_size - 1)) OR
                    (NOT p_A(g_size - 1) AND NOT p_B(g_size - 1) AND s_AplusB(g_size - 1));

    s_AplusBplusCin     <=  ('0' & p_A) + ('0' & p_B) + p_cin;
    s_AplusBplusCin_Ov  <=  (p_A(g_size - 1) AND p_B(g_size - 1) AND NOT s_AplusBplusCin(g_size - 1)) OR
                            (NOT p_A(g_size - 1) AND NOT p_B(g_size - 1) AND s_AplusBplusCin(g_size - 1));

    s_GT <= '1' WHEN p_A>p_B ELSE '0';
    s_LT <= '1' WHEN p_A<p_B ELSE '0';
    s_EQ <= '1' WHEN p_A=p_B ELSE '0';

    WITH p_funct SELECT
        p_Z <=  NOT p_B(g_size - 1) & p_B(g_size - 2 DOWNTO 0)  WHEN "0000",
                s_AplusB(g_size - 1 DOWNTO 0)                   WHEN "0001",
                s_AplusBplusCin(g_size - 1 DOWNTO 0)            WHEN "0010",
                p_A - p_B                                       WHEN "0011",
                -p_B                                            WHEN "0100",
                NOT p_B                                         WHEN "0101",
                p_A ror 1                                       WHEN "0110",
                p_A OR p_B                                      WHEN "0111",
                p_A XOR p_B                                     WHEN "1000",
                p_A(g_size  - 2 DOWNTO 0) & p_sin               WHEN "1001",
                p_sin & p_A(g_size  - 1 DOWNTO 1)               WHEN "1010",
                p_A rol 1                                       WHEN "1011",
                p_A ror 1                                       WHEN "1100",
                c_zero(g_size-2 DOWNTO 0) & s_GT                WHEN "1101",
                c_zero(g_size-2 DOWNTO 0) & s_LT                WHEN "1110",
                c_zero(g_size-2 DOWNTO 0) & s_EQ                WHEN "1111",
                c_zero                                          WHEN OTHERS;
    
    WITH p_funct SELECT
        p_cout  <=  s_AplusB(g_size)        WHEN "0001",
                    s_AplusBplusCin(g_size) WHEN "0010",
                    '0'                     WHEN OTHERS;
    WITH p_funct SELECT
        p_Ov    <=  s_AplusB_OV         WHEN "0001",
                    s_AplusBplusCin_Ov  WHEN "0010",
                    '0'                 WHEN OTHERS;
    WITH p_funct SELECT
        p_sout  <=  p_A(g_size  - 1)    WHEN "1001",
                    p_A(0)              WHEN "1010",
                    '0'                 WHEN OTHERS;
END arch;