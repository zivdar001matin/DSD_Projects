LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY compn_tb IS
END compn_tb;

ARCHITECTURE concurrent OF compn_tb IS
    COMPONENT compn IS
        GENERIC(
            n : integer := 4
        );
        PORT(
            a, b    : IN std_logic_vector(n-1 DOWNTO 0);
            go, eo, lo : OUT std_logic
        );
    END COMPONENT;
    SIGNAL a_t, b_t : std_logic_vector(31 DOWNTO 0);
    SIGNAL go_t, eo_t, lo_t : std_logic;
BEGIN
    u1 : compn  GENERIC MAP (32)
                PORT MAP(a_t, b_t, go_t, eo_t, lo_t);

    a_t <= X"00000000" , X"000F0F00" AFTER 20 ns, X"F0F00000" AFTER 30 ns;
    b_t <= X"00000000" , X"00000F00" AFTER 15 ns, X"F0F000E0" AFTER 25 ns;
END concurrent;