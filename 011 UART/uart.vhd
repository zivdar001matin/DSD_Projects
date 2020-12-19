LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY uart IS
	PORT(
        nrst            : IN std_logic;
        clk             : IN std_logic;
        start           : IN std_logic;
        rx              : IN std_logic;
        data_in         : IN std_logic_vector(7 DOWNTO 0);
        baud   	        : IN std_logic_vector(7 DOWNTO 0);
        data_ready      : OUT std_logic;
        tx  	        : OUT std_logic;
		data_out        : OUT std_logic_vector(7 DOWNTO 0)
	);
END uart;