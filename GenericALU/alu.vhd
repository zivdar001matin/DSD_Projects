
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

BEGIN
    PROCESS(p_A, p_B, p_cin, p_sin, p_funct)
    BEGIN
        IF p_funct = "0000" THEN
            p_Z <= NOT p_B(g_size - 1) & p_B(g_size - 2 DOWNTO 0);
        ELSIF p_funct = "0001" THEN -- TODO p_cout
            p_Z <= p_A + p_B;
        ELSIF p_funct = "0010" THEN -- TODO p_cout
            p_Z <= p_A + p_B + p_cin;
        ELSIF p_funct = "0011" THEN -- TODO p_cout
            p_Z <= p_A - p_B;
        ELSIF p_funct = "0100" THEN
            p_Z <= -p_B;
        ELSIF p_funct = "0101" THEN
            p_Z <= NOT p_B;
        ELSIF p_funct = "0110" THEN
            p_Z <= p_A AND p_B;
        ELSIF p_funct = "0111" THEN
            p_Z <= p_A OR p_B;
        ELSIF p_funct = "1000" THEN
            p_Z <= p_A XOR p_B;
        ELSIF p_funct = "1001" THEN
            p_Z <= p_A sll 1;
        ELSIF p_funct = "1010" THEN
            p_Z <= p_A srl 1;
        ELSIF p_funct = "1011" THEN
            p_Z <= p_A(g_size - 2 DOWNTO 0) & p_sin;
            p_sout <= p_A(g_size - 1);
        ELSIF p_funct = "1100" THEN
            p_Z <= p_sin & p_A(g_size - 1 DOWNTO 1);
            p_sout <= p_A(0);
        ELSIF p_funct = "1101" THEN
            IF p_A > p_B THEN
                p_Z <= c_zero + 1;
            ELSE
                p_Z <=  c_zero;
            END IF;
        ELSIF p_funct = "1110" THEN
            IF p_A < p_B THEN
                p_Z <= c_zero + 1;
            ELSE
                p_Z <= c_zero;
            END IF;
        ELSIF p_funct = "1111" THEN
            IF p_A = p_B THEN
                p_Z <= c_zero + 1;
            ELSE
                p_Z <= c_zero;
            END IF;
        ELSE
            p_Z <= c_zero;
        END IF;
    END PROCESS;
END arch;