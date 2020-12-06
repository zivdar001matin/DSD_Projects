LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY compn IS
    GENERIC (
        n : integer := 4
    );
    PORT(
        a, b        : IN std_logic_vector(n-1 DOWNTO 0);
        go, eo, lo  : OUT std_logic
    );
END compn;
ARCHITECTURE concurrent OF compn IS
    COMPONENT comp1 IS
        PORT(
            a, b        : IN std_logic;
            gi, ei, li  : IN std_logic;
            go, eo, lo  : OUT std_logic
        );
    END COMPONENT;
    SIGNAL g, e, l : std_logic_vector(n DOWNTO 0);
BEGIN
    g(0) <= '0';
    e(0) <= '1';
    l(0) <= '0';
    cmp: FOR i IN n-1 DOWNTO 0 GENERATE 
        u1 : comp1 PORT MAP(a(n-1-i), b(i), g(i), e(i), l(i), g(i+1), e(i+1), l(i+1));
    END GENERATE cmp;
    go <= g(n);
    eo <= e(n);
    lo <= l(n);
END concurrent;