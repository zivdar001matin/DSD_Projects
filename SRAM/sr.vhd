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