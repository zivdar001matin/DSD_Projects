LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY detector_tb IS END detector_tb;
ARCHITECTURE test of detector_tb IS
    COMPONENT detector IS
        PORT(
            nrst:   IN std_logic;
            mclk:   IN std_logic;
            din :   IN std_logic;
            z   :   OUT std_logic
        );
    END COMPONENT;
    FOR ALL  : detector USE ENTITY work.detector(mealy);
    SIGNAL nrst_t :   std_logic;
    SIGNAL mclk_t :   std_logic := '0';
    SIGNAL din_t  :   std_logic;
    SIGNAL z_t    :   std_logic;
BEGIN
    u1: detector PORT MAP (nrst_t, mclk_t, din_t, z_t);
    PROCESS
    BEGIN
        nrst_t <= '0';
        din_t <= '0';
        WAIT FOR 23 ns;
        nrst_t <= '1';
        WAIT FOR 5 ns;
        din_t <= '1';
        WAIT FOR 35 ns;
        din_t <= '0';
        WAIT FOR 15 ns;
        din_t <= '1';
        WAIT;
    END PROCESS;
    -- Creating clock with 1/3 duty cycle
    mclk_t <= '1' AFTER 10 ns WHEN mclk_t='0' ELSE '0' AFTER 5 ns;

END test;