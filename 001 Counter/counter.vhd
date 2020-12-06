LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY counter IS
    PORT (
        nrst    : IN    std_logic;
        clk     : IN    std_logic;
        mode    : IN    integer;
        -- 0: register (parallel load)
        -- 1: logical right shift
        -- 2: logical left shift
        -- 3: arith right shift
        -- 4: circular right shift
        -- 5: circular left shift
        -- 6: up count
        -- 7: down count
        din     : IN    std_logic_vector(7 DOWNTO 0);
        dout    : OUT   std_logic_vector(7 DOWNTO 0)
    );
END counter;

ARCHITECTURE behavioral OF counter IS
    SIGNAL temp : std_logic_vector(7 DOWNTO 0);
BEGIN
    PROCESS (clk)
    BEGIN
        IF clk = '1' THEN
            IF nrst = '0' THEN
                dout <= (OTHERS => '0');
            ELSE
                IF    mode = 0 THEN
                    temp <= din;
                ELSIF mode = 1 THEN
                    temp <= '0' & temp(7 DOWNTO 1);
                ELSIF mode = 2 THEN
                    temp <= temp(6 DOWNTO 0) & '0';
                ELSIF mode = 3 THEN
                    temp <= temp(7) & temp(7 DOWNTO 1);
                ELSIF mode = 4 THEN
                    temp <= temp(0) & temp(7 DOWNTO 1);
                ELSIF mode = 5 THEN
                    temp <= temp(6 DOWNTO 0) & temp(7);
                ELSIF mode = 6 THEN
                    temp <= temp + 1;
                ELSIF mode = 7 THEN
                    temp <= temp - 1;
                END IF;
            END IF;
            dout <= temp;
        END IF;
    END PROCESS;


END behavioral;