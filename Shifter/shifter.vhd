
-- g_<name> corresponds to Generic
-- p_<name> corresponds to Port
-- c_<name> corresponds to Constant
-- s_<name> corresponds to Signal
-- v_<name> corresponds to Variable
-- t_<name> corresponds to Type

-- Packages
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- Entity Port and Generic
ENTITY shifter IS 
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
END shifter;
-- Entity Architecture
ARCHITECTURE sequential OF shifter IS
    SIGNAL s_register : std_logic_vector(31 DOWNTO 0);
BEGIN
    PROCESS (clk)
        TYPE intermediate_results is array(0 to 5) of std_logic_vector(31 downto 0);
        VARIABLE v_intermediate  : intermediate_results;
        VARIABLE v_shift_bit    : integer;
        VARIABLE v_sign_extend : std_logic;
        VARIABLE v_sout : std_logic;
    BEGIN
    v_sign_extend := p_dir and p_shty(0) and s_register(31); -- used for arithmetic shift
    IF clk = '1' THEN
        IF p_shty = "11" THEN               -- Parallel Load
            s_register <= p_din;
        ELSE
            --Initialize; reverse if we're shifting to the right
            IF (p_dir = '1') THEN
                FOR i IN 0 TO 31 LOOP
                    v_intermediate(0)(i) := s_register(32 - i - 1);
                END LOOP;
            ELSE
                v_intermediate(0) := s_register;
            END IF;

            -- Do Shifting
            v_shift_bit := 1;
            FOR i in 0 to 4 LOOP
                IF p_sham(i) = '1' THEN
                    v_intermediate(i + 1)(31 downto v_shift_bit) := v_intermediate(i)(32 - v_shift_bit - 1 downto 0);
                    IF p_shty = "00" THEN       -- Shift Logical
                        v_intermediate(i + 1)(v_shift_bit - 1 downto 0) := (others => p_sin);
                        v_sout := v_intermediate(i)(32 - v_shift_bit);
                    ELSIF p_shty = "01" THEN    -- Shift Arithmetic
                        v_intermediate(i + 1)(v_shift_bit - 1 downto 0) := (others => v_sign_extend);
                        v_sout := v_intermediate(i)(32 - v_shift_bit);
                    ELSIF p_shty = "10" THEN    -- Shift Circular
                        v_intermediate(i + 1)(v_shift_bit - 1 downto 0) := v_intermediate(i)(31 downto 32 - v_shift_bit);
                    END IF;
                ELSE
                    v_intermediate(i + 1) := v_intermediate(i);
                END IF;
                v_shift_bit := v_shift_bit * 2;
            END LOOP;

            -- Set output; reverse if we're shifting to the right
            IF (p_dir = '1') THEN
                FOR i IN 0 TO 31 LOOP
                    s_register(i) <= v_intermediate(5)(32 - i - 1);
                END LOOP;
            ELSE
                s_register <= v_intermediate(5);
            END IF;
            p_sout <= v_sout;
        END IF;
    END IF;
    p_dout <= s_register;
    END PROCESS;
END sequential;