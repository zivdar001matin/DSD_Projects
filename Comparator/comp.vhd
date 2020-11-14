LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY comp1 IS
    PORT(
        a, b        : IN std_logic;
        gi, ei, li  : IN std_logic;
        go, eo, lo  : OUT std_logic
    );
END comp1;

ARCHITECTURE concurrent of comp1 IS
BEGIN
    go <= '1' WHEN a > b ELSE '0' WHEN a < b ELSE gi;
    lo <= '1' WHEN a < b ELSE '1' WHEN a > b ELSE li;
    eo <= '0' WHEN a /= b ELSE ei;
END concurrent;