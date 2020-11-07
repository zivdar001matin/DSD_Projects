
-- t_<name> corresponds to Test Signals

-- Packages
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- Entity isn't needed for testbench
ENTITy alu_tb IS
END alu_tb;

ARCHITECTURE test OF alu_tb IS
    COMPONENT alu IS
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
    END COMPONENT;

    --Test Signals
    SIGNAL t_A      : signed(7 DOWNTO 0);
    SIGNAL t_B      : signed(7 DOWNTO 0);
    SIGNAL t_cin    : integer;
    SIGNAL t_sin    : std_logic;
    SIGNAL t_funct  : signed(3 DOWNTO 0) := "0000";
    SIGNAL t_sout   : std_logic;
    SIGNAL t_cout   : std_logic;
    SIGNAL t_Ov     : std_logic;
    SIGNAL t_Z      : signed(7 DOWNTO 0);

BEGIN
    -- Entity Instantiation
    CUT: alu GENERIC MAP (8) PORT MAP (t_A, t_B, t_cin, t_sin, t_funct, t_sout, t_cout, t_Ov, t_Z);

    t_A <= X"C0", X"7F" AFTER 40ns, X"00" AFTER 60ns;
    t_B <= X"60", X"01" AFTER 40ns, X"00" AFTER 60ns;
    t_cin <= 1;
    t_sin <= '1';
    t_funct <= "0000" ,"0001" AFTER 20ns, "0010" AFTER 30ns, "0001" AFTER 50ns;
END test;