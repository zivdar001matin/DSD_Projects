
-- g_<name> corresponds to Generic
-- p_<name> corresponds to Port
-- c_<name> corresponds to Constant
-- s_<name> corresponds to Signal
-- v_<name> corresponds to Variable
-- <name>_t corresponds to Test Signal

-- Packages
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- Entity Port and Generic
ENTITY shifter_tb IS 
END shifter_tb;

-- Entity Architecture
ARCHITECTURE sequential OF shifter_tb IS
    COMPONENT shifter IS
        PORT(
            clk, nrst   : IN std_logic;
            p_sham      : IN std_logic_vector(4 DOWNTO 0);
            p_shty      : IN std_logic_vector(1 DOWNTO 0);
            p_dir       : IN std_logic;
            p_din       : IN std_logic_vector(31 DOWNTO 0);
            p_sin       : IN std_logic;
            p_dout      : OUT std_logic_vector(31 DOWNTO 0);
            p_sout      : OUT std_logic
        );
    END COMPONENT;
    SIGNAL clk_t        : std_logic := '0';
    SIGNAL nrst_t       : std_logic := '0';
    SIGNAL sham_t       : std_logic_vector(4 DOWNTO 0);
    SIGNAL shty_t       : std_logic_vector(1 DOWNTO 0) := "00";
    SIGNAL dir_t        : std_logic;
    SIGNAL din_t        : std_logic_vector(31 DOWNTO 0);
    SIGNAL sin_t        : std_logic;
    SIGNAL dout_t       : std_logic_vector(31 DOWNTO 0);
    SIGNAL sout_t       : std_logic;

BEGIN
    -- Entity Instantiate
    CUT: shifter    PORT MAP (clk_t, nrst_t, sham_t , shty_t , dir_t, din_t, sin_t, dout_t, sout_t);
    clk_t <= NOT clk_t AFTER 10 ns;
    sham_t <= "00100";
    shty_t <= "11", "00" AFTER 15 ns, "01" AFTER 115 ns, "10" AFTER 215 ns;
    dir_t <= '0', '1' AFTER 125 ns;
    din_t <= X"0000FFFF";
    sin_t <= '0';

END sequential;