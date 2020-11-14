
-- g_<name> corresponds to Generic
-- p_<name> corresponds to Port
-- t_<name> corresponds to Test Signals

-- Packages
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity isn't needed for testbench
ENTITy mult_tb IS
END mult_tb;

ARCHITECTURE test OF mult_tb IS
    COMPONENT mult IS
        GENERIC (
            g_size : integer := 4
        );
        PORT(
            p_a, p_b        : IN std_logic_vector(g_size-1 DOWNTO 0);
            p_s             : OUT std_logic_vector(2*g_size-1 DOWNTO 0);
            p_cout          : OUT std_logic
        );
    END COMPONENT;

    --Test Signals
    SIGNAL t_a      : std_logic_vector(3 DOWNTO 0);
    SIGNAL t_b      : std_logic_vector(3 DOWNTO 0);
    SIGNAL t_s      : std_logic_vector(5 DOWNTO 0);
    SIGNAL t_cout   : std_logic;

BEGIN
    -- Entity Instantiation
    CUT: mult GENERIC MAP (4) PORT MAP (t_a, t_b, t_s, t_cout);

    t_a <= X"A";
    t_b <= X"1";

END test;