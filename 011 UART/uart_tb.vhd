ENTITY uart_tb IS END uart_tb;

LIBRARY ieee;
USE  ieee.std_logic_1164.all;

ARCHITECTURE tb OF uart_tb IS 
    COMPONENT uart IS 
        PORT(
            nrst            : IN std_logic;
            clk             : IN std_logic;
            start           : IN std_logic;
            rx              : IN std_logic;
            data_in         : IN std_logic_vector(7 DOWNTO 0);
            baud   	        : IN std_logic_vector(7 DOWNTO 0);
            tx  	        : OUT std_logic;
            data_ready      : BUFFER std_logic;
            data_out        : BUFFER std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL start_t_1, rx_t_1, nrst_t: std_logic;
    SIGNAL clk_t                    : std_logic:= '1';
    SIGNAL data_in_t_1, baud_t   	: std_logic_vector(7 DOWNTO 0);
    SIGNAL data_ready_t_1, tx_t_1  	: std_logic;
    SIGNAL data_out_t_1        	    : std_logic_vector(7 DOWNTO 0);
    SIGNAL start_t_2, rx_t_2        : std_logic;
    SIGNAL data_in_t_2              : std_logic_vector(7 DOWNTO 0);
    SIGNAL data_ready_t_2, tx_t_2  	: std_logic;
    SIGNAL data_out_t_2        	    : std_logic_vector(7 DOWNTO 0);
BEGIN 
    clk_t <= NOT clk_t AFTER 5 ns;
    uatt1: uart 
        PORT MAP (
            start => start_t_1,
            rx => rx_t_1,
            clk => clk_t,
            nrst => nrst_t,
            data_in => data_in_t_1,
            baud => baud_t,
            data_ready => data_ready_t_1,
            tx => tx_t_1,
            data_out => data_out_t_1
        );
	uatt2: uart 
        PORT MAP (
            start => start_t_2,
            rx => rx_t_2,
            clk => clk_t,
            nrst => nrst_t,
            data_in => data_in_t_2,
            baud => baud_t,
            data_ready => data_ready_t_2,
            tx => tx_t_2,
            data_out => data_out_t_2
        );
    rx_t_1 <= tx_t_2;
    rx_t_2 <= tx_t_1;

    nrst_t <= '0', '1' AFTER 15 ns;
    start_t_1 <= '0', '1' AFTER 25 ns, '0' AFTER 35 ns;
    start_t_2 <= '0';
    data_in_t_1 <= (OTHERS => '0'), "10101010" AFTER 15 ns;
    baud_t <= (OTHERS => '0'), "00000010" AFTER 15 ns;
END tb;
