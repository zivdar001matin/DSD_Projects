LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY elevator_tb IS END elevator_tb;
ARCHITECTURE test of elevator_tb IS
    COMPONENT elevator IS
        PORT(
            nreset          :   IN std_logic;
            clk             :   IN std_logic;
            switch          :   IN std_logic_vector(4 DOWNTO 1);
            go              :   IN std_logic_vector(4 DOWNTO 1);
            come            :   IN std_logic_vector(4 DOWNTO 1);
            motor_up        :   OUT std_logic;
            motor_down      :   OUT std_logic;
            current_floor   :   OUT std_logic_vector(1 DOWNTO 0);
            move_state      :   OUT std_logic_vector(1 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL nreset_t         :   std_logic;
    SIGNAL clk_t            :   std_logic := '0';
    SIGNAL switch_t         :   std_logic_vector(4 DOWNTO 1);
    SIGNAL go_t             :   std_logic_vector(4 DOWNTO 1) := "0000";
    SIGNAL come_t           :   std_logic_vector(4 DOWNTO 1) := "0000";
    SIGNAL motor_up_t       :   std_logic;
    SIGNAL motor_down_t     :   std_logic;
    SIGNAL current_floor_t  :   std_logic_vector(1 DOWNTO 0);
    SIGNAL move_state_t     :   std_logic_vector(1 DOWNTO 0);

BEGIN
    CUT: elevator PORT MAP (nreset_t, clk_t, switch_t, go_t, come_t, motor_up_t, motor_down_t, current_floor_t, move_state_t);
    clk_t <= NOT clk_t AFTER 10 ns;
    PROCESS
    BEGIN
        nreset_t <= '0';
        switch_t <= "0001";
        WAIT FOR 12 ns; -- 12 ns
        nreset_t <= '1';
        WAIT FOR 22 ns; -- 34 ns
        go_t(3) <= '1';     -- Person_1 wanna go to the 3rd floor
        WAIT FOR 30 ns; -- 64 ns
        switch_t <= "0000"; -- Elevator between 1st and 2nd floor
        WAIT FOR 25 ns; -- 89 ns
        come_t <= "0011";   -- Come 1st and 2nd floor
        WAIT FOR 45 ns; -- 134 ns
        switch_t <= "0010"; -- Elevator arrives 2nd floor
        come_t(2) <= '0';   -- Person_2 on the 2nd floor gets in
        go_t(1) <= '1';     -- Person_2 wanna go to the 1st floor
        WAIT FOR 30 ns; -- 164 ns
        switch_t <= "0000"; -- Elevator between 2nd and 3rd floor
        WAIT FOR 50 ns; -- 214 ns
        switch_t <= "0100"; -- Elevator arrives 3rd floor
        go_t(3) <= '0';     -- Person_1 gets out
        WAIT FOR 30 ns; -- 244 ns
        switch_t <= "0000"; -- Elevator between 2nd and 3rd floor
        WAIT FOR 50 ns; -- 294 ns
        switch_t <= "0010"; -- Elevator arrives 2nd floor
        WAIT FOR 30 ns; -- 324 ns
        switch_t <= "0000"; -- Elevator between 1st and 2nd
        WAIT FOR 50 ns; -- 374 ns
        switch_t <= "0001"; -- Elevator arrives 1st floor
        go_t(1) <= '0';     -- Person_2 gets out
        come_t(1) <= '0';   -- Person_3 gets in
        WAIT;
    END PROCESS;
END test;