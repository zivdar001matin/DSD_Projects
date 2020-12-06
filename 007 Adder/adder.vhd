LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder IS
    GENERIC (n : integer := 8);
    PORT(
        a, b    : IN std_logic_vector(n-1 DOWNTO 0);
        cin     : IN std_logic;
        sum     : OUT std_logic_vector(n-1 DOWNTO 0);
        cout    : OUT std_logic
    );
END adder;

ARCHITECTURE sequential OF adder IS
    
BEGIN
    PROCESS (a, b, cin)
        VARIABLE c    : std_logic_vector(n DOWNTO 0);
    BEGIN 
        c(0) := cin;
        FOR i IN 0 TO n-1 LOOP
            sum(i) <= a(i) XOR b(i) XOR c(i);
            c(i+1) := (a(i) and b(i)) OR (a(i) AND c(i)) OR (c(i) AND b(i)); 
        END LOOP;
        cout <= c(n-1);
    END PROCESS;
END sequential;