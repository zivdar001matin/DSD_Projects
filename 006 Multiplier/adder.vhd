-- p_<name> corresponds to Port

-- Packages
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- Entity Port
ENTITY adder IS 
    PORT(
        p_a     : IN std_logic;
        p_b     : IN std_logic;
        p_cin   : IN std_logic;
        p_s   : OUT std_logic;
        p_cout   : OUT std_logic
    );
END adder;

-- Entity Architecture
ARCHITECTURE fa OF adder IS
BEGIN
    p_s <= p_a XOR p_b XOR p_cin;
    p_cout <= (p_a AND p_b) OR (p_a AND p_cin) OR (p_b AND p_cin);
END fa;
