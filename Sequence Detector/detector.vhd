LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY detector IS
    PORT(
        nrst:   IN std_logic;
        mclk:   IN std_logic;   -- master clock
        din :   IN std_logic;
        z   :   OUT std_logic
    );
END detector;

ARCHITECTURE mealy OF detector IS
    -- always declare state for state machines
    TYPE state IS (s0, s1, s2, s3);
    SIGNAL curr_state, next_state   : state;
BEGIN
    -- Combinational Part
    com: PROCESS (din, curr_state)
    BEGIN
        IF      curr_state = s0 THEN
            IF din='1' THEN
                next_state <= s1;
            END IF;
            z <='0';
        ELSIF   curr_state = s1 THEN
            IF din='0' THEN
                next_state <= s0;
            ELSE
                next_state <= s2;
            END IF;
            z <='0';
        ELSIF   curr_state = s2 THEN
            IF din='0' THEN
                next_state <= s3;
            ELSE
                next_state <= s2;
            END IF;
            z <='0';
        ELSE  --curr_state = s3 THEN
            IF din='0' THEN
                next_state <= s0;
            ELSE
                next_state <= s2;
            END IF;
            z <='1';
        END IF;
    END PROCESS com;
    -- Seequential Part
    seq: PROCESS (nrst, mclk)
    BEGIN
        IF nrst = '0' THEN
            curr_state <= s0;
        ELSIF mclk='1' AND mclk'EVENT THEN
            curr_state <= next_state;
        END IF;
    END PROCESS seq;
END mealy;



ARCHITECTURE moore OF detector IS
    -- always declare state for state machines
    TYPE state IS (s0, s1, s2, s3, s4);
    SIGNAL curr_state, next_state   : state;
BEGIN
    -- Combinational Part
    com: PROCESS (din, curr_state)
    BEGIN
        IF      curr_state = s0 THEN
            IF din='1' THEN
                next_state <= s1;
            END IF;
            z <='0';
        ELSIF   curr_state = s1 THEN
            IF din='0' THEN
                next_state <= s0;
            ELSE
                next_state <= s2;
            END IF;
            z <='0';
        ELSIF   curr_state = s2 THEN
            IF din='0' THEN
                next_state <= s3;
            ELSE
                next_state <= s2;
            END IF;
            z <='0';
        ELSIF  curr_state = s3 THEN
            IF din='0' THEN
                next_state <= s0;
            ELSE
                next_state <= s4;
            END IF;
            z <='0';
        ELSE --curr_state = s4 THEN
            IF din='0' THEN
                next_state <= s0;
            ELSE
                next_state <= s4;
            END IF;
            z <='1';
        END IF;
    END PROCESS com;
    -- Seequential Part
    seq: PROCESS (nrst, mclk)
    BEGIN
        IF nrst = '0' THEN
            curr_state <= s0;
        ELSIF mclk='1' AND mclk'EVENT THEN
            curr_state <= next_state;
        END IF;
    END PROCESS seq;
END moore;