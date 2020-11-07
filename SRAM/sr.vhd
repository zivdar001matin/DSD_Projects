LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY sram IS
    GENERIC(
        row_num :   integer := 64;
        data_wid:   integer := 16;
        addr-wid:   integer := 6
    );
    PORT(
        clk, rnw    :   IN  std_logic;
        din         :   IN  std_logic_vector(data_wid-1 DOWNTO 0);
        addr        :   IN  std_logic_vector(data_wid-1 DOWNTO 0);
        dout        :   OUT std_logic_vector(data_wid-1 DOWNTO 0)
    );
END sram;
ARCHITECTURE test OF sram IS
    TYPE mem_type IS ARRAY (0 TO row_num) OF std_logic_vector(data_wid-1 DOWNTO 0);
    SIGNAL buf : mem_type := (OTHERS=> (OTHERS=>'0'));
BEGIN
    PROCESS (clk)
    BEGIN
        IF rnw='0' THEN
            buf(conv_integer(addr)) <= din;
        END IF;
    END PROCESS;
    dout <= buf(conv_integer(addr));
END test;