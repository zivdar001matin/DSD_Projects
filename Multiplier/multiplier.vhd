
-- g_<name> corresponds to Generic
-- p_<name> corresponds to Port
-- c_<name> corresponds to Constant
-- s_<name> corresponds to Signal

-- Packages
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity Port and Generic
ENTITY mult IS
    GENERIC (
        g_size : integer := 4
    );
    PORT(
        p_a, p_b        : IN std_logic_vector(g_size-1 DOWNTO 0);
        p_s             : OUT std_logic_vector(2*g_size-1 DOWNTO 0);
        p_cout          : OUT std_logic
    );
END mult;
ARCHITECTURE combinational OF mult IS
    COMPONENT adder IS
        PORT(
            p_a     : IN std_logic;
            p_b     : IN std_logic;
            p_cin   : IN std_logic;
            p_s     : OUT std_logic;
            p_cout  : OUT std_logic
        );
    END COMPONENT;
-- Design desicions
    TYPE Type_and IS ARRAY (2*g_size-2 DOWNTO 0) OF std_logic_vector(g_size-1 DOWNTO 0); 
    SIGNAL s_and  : Type_and;
    -- s_carry(i)(j) represents i column, j row
    TYPE Type_carry IS ARRAY (2*g_size-3 DOWNTO 0) OF std_logic_vector(g_size DOWNTO 0); 
    SIGNAL s_carry : Type_carry;
    -- s_sum(i)(j) represents i row, j column 
    TYPE Type_sum IS ARRAY (g_size+1 DOWNTO 0) OF std_logic_vector(g_size DOWNTO 0); 
    SIGNAL s_sum  : Type_sum;
BEGIN
    s_carry(0) <= (others=>'0');
    Init_L1: FOR i IN 0 TO g_size-1 GENERATE
        Init_L2: FOR j IN 0 TO g_size-1 GENERATE
            s_and(i)(j) <= p_a(i) AND p_b(j);
        END GENERATE Init_L2;
    END GENERATE Init_L1;
    Init2_L1: FOR i IN g_size TO 2*g_size-2 GENERATE
        s_and(i) <= (others=>'0');
    END GENERATE Init2_L1;
    s_sum(0) <= '0' & s_and(0);
    p_s(0) <= s_sum(0)(0);
    L1: FOR i IN 1 TO 2*g_size-3 GENERATE
        L2: FOR j IN 0 TO g_size-1 GENERATE
            u1 : adder PORT MAP(s_and(i)(j), s_sum(i-1)(j+1), s_carry(j)(i-1),
                            s_sum(i)(j), s_carry(j+1)(i-1));
        END GENERATE L2;
        s_sum(i)(g_size) <= s_carry(g_size)(i-1);
        p_s(i) <= s_sum(i)(0);
    END GENERATE L1;
    p_s(2*g_size-1 DOWNTO 2*g_size-2) <= s_sum(2*g_size-3)(2 DOWNTO 1);
    p_cout <= s_carry(g_size)(g_size);
END combinational;