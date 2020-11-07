LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY sram_tb IS
END sram_tb;

ARCHITECTURE test OF sram_tb IS
    COMPONENT sram IS
        GENERIC(
            row_num :   integer := 1024;
            data_wid:   integer := 8;
            addr_wid:   integer := 10
        );
        PORT(
            clk, rnw    :   IN  std_logic;
            din         :   IN  std_logic_vector(data_wid-1 DOWNTO 0);
            addr        :   IN  std_logic_vector(data_wid-1 DOWNTO 0);
            dout        :   OUT std_logic_vector(data_wid-1 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL clk_t    :std_logic := '0';
    SIGNAL rnw_t    :std_logic;
    SIGNAL din_t    :std_logic_vector(7 DOWNTO 0);
    SIGNAL addr_t   :std_logic_vector(9 DOWNTO 0);
    SIGNAL dout_t   :std_logic_vector(7 DOWNTO 0);

BEGIN
    -- Entity Instantiate
    CUT: sram   GENERIC MAP (1024, 8, 10)
                PORT MAP    (clk_t, rnw_t, din_t, addr_t, dout_t);
    clk_t <= NOT clk_t AFTER 10ns;
    rnw_t <= '0', '1' AFTER 51ns, '0' AFTER 91ns;
    din_t <= X"00", X"01" AFTER 35ns, X"F0" AFTER 70ns, X"FF" AFTER 95ns;
    addr_t <= "0000000001", "0000000010" AFTER 26ns, "0000000011" AFTER 46ns, "0000000100" AFTER 56ns, "0000000101" AFTER 66ns;
END test;