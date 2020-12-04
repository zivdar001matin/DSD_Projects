LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY elevator IS
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
END elevator;

ARCHITECTURE moore OF elevator IS
    TYPE state IS (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13);
    SIGNAL curr_state, next_state   : state;
    SIGNAL to_out                   : std_logic_vector(5 DOWNTO 0);
BEGIN
    motor_up        <= to_out(5);
    motor_down      <= to_out(4);
    current_floor   <= to_out(3 DOWNTO 2);
    move_state      <= to_out(1 DOWNTO 0);
    -- Combinational Part
    com: PROCESS (switch, go, come, curr_state)
    BEGIN
        IF      curr_state = s0 THEN
            IF (come(1)='1') OR (go(1)='1') THEN
                next_state <= s0;
            ELSIF (come(2)='1') OR (come(3)='1') OR (come(4)='1') OR (go(2)='1') OR (go(3)='1') OR (go(4)='1') THEN
                next_state <= s1;
            END IF;
            to_out <= "000000";

        ELSIF   curr_state = s1 THEN
            IF switch(2)='1' THEN
                next_state <= s5;
            END IF;
            to_out <= "100001";

        ELSIF   curr_state = s2 THEN
            IF switch(1)='1' THEN
                next_state <= s0;
            END IF;
            to_out <= "010110";

        ELSIF   curr_state = s3 THEN
            IF (come(1)='0') AND (go(1)='0') THEN
                next_state <= s4;
            ELSIF (come(1)='1') OR (go(1)='1') THEN
                next_state <= s2;
            END IF;
            to_out <= "000110";

        ELSIF   curr_state = s4 THEN
            IF (come(2)='1') OR (go(2)='1') THEN
                next_state <= s4;
            ELSIF (come(3)='1') OR (come(4)='1') OR (go(3)='1') OR (go(4)='1') THEN
                next_state <= s5;
            ELSIF (come(1)='1') OR (go(1)='1') THEN
                next_state <= s3;
            END IF;
            to_out <= "000100";

        ELSIF   curr_state = s5 THEN
            IF (come(3)='0') AND (come(4)='0') AND (go(3)='0') AND (go(4)='0') THEN
                next_state <= s4;
            ELSIF (come(3)='1') OR (come(4)='1') OR (go(3)='1') OR (go(4)='1') THEN
                next_state <= s6;
            END IF;
            to_out <= "000101";

        ELSIF   curr_state = s6 THEN
            IF switch(3)='1' THEN
                next_state <= s10;
            END IF;
            to_out <= "100101";

        ELSIF   curr_state = s7 THEN
            IF switch(2)='1' THEN
                next_state <= s3;
            END IF;
            to_out <= "011010";

        ELSIF   curr_state = s8 THEN
            IF (come(1)='0') AND (come(2)='0') AND (go(1)='0') AND (go(2)='0') THEN
                next_state <= s9;
            ELSIF (come(1)='1') OR (come(2)='1') OR (go(1)='1') OR (go(2)='1') THEN
                next_state <= s7;
            END IF;
            to_out <= "001010";

        ELSIF   curr_state = s9 THEN
            IF (come(3)='1') OR (go(3)='1') THEN
                next_state <= s9;
            ELSIF (come(4)='1') OR (go(4)='1') THEN
                next_state <= s10;
            ELSIF (come(1)='1') OR (come(2)='1') OR (go(1)='1') OR (go(2)='1') THEN
                next_state <= s8;
            END IF;
            to_out <= "001000";

        ELSIF   curr_state = s10 THEN
            IF (come(4)='0') AND (go(4)='0') THEN
                next_state <= s9;
            ELSIF (come(4)='1') OR (go(4)='1') THEN
                next_state <= s11;
            END IF;
            to_out <= "001001";

        ELSIF   curr_state = s11 THEN
            IF switch(4)='1' THEN
                next_state <= s13;
            END IF;
            to_out <= "101001";

        ELSIF   curr_state = s12 THEN
            IF switch(3)='1' THEN
                next_state <= s8;
            END IF;
            to_out <= "011110";

        ELSE -- curr_state = 13 THEN
            IF (come(4)='1') OR (go(4)='1') THEN
                next_state <= s13;
            ELSIF (come(1)='1') OR (come(2)='1') OR (come(3)='1') OR (go(1)='1') OR (go(2)='1') OR (go(3)='1') THEN
                next_state <= s12;
            END IF;
            to_out <= "001100";

        END IF;
    END PROCESS com;

    -- Sequential Part
    seq: PROCESS (nreset, clk, current_floor)
    BEGIN
        IF nreset = '0' THEN
            IF      current_floor = "0001" THEN
                curr_state <= s0;
            ELSIF   current_floor = "0010" THEN
                curr_state <= s4;
            ELSIF   current_floor = "0100" THEN
                curr_state <= s9;
            ELSE -- current_floor = "1000" THEN
                curr_state <= s13;
            END IF;
        ELSIF clk='1' AND clk'EVENT THEN
            curr_state <= next_state;
        END IF;
    END PROCESS seq;

END moore;