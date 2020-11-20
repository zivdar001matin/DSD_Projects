LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_tb IS
END adder_tb;

ARCHITECTURE sequential OF adder_tb IS
    COMPONENT adder IS
        GENERIC (n : integer := 8);
        PORT(
            a, b    : IN std_logic_vector(n-1 DOWNTO 0);
            cin     : IN std_logic;
            sum     : OUT std_logic_vector(n-1 DOWNTO 0);
            cout    : OUT std_logic
        );
    END COMPONENT;

    CONSTANT n  : integer := 32;
    SIGNAL a_t, b_t : std_logic_vector(n-1 DOWNTO 0);
    SIGNAL cin_t    : std_logic;
    SIGNAL sum_t    : std_logic_vector(n-1 DOWNTO 0);
    SIGNAL cout_t   : std_logic;

    BEGIN
        u1 : adder  GENERIC MAP (32)
                    PORT MAP (b=>b_t, a=>a_t, cin=>cin_t, cout=>cout_t, sum=>sum_t);
        a_t <= X"FFFFFFFF";
        b_t <= X"00000000", X"00000001" AFTER 10 ns, X"000000FF" AFTER 20 ns;
        cin_t <= '0', '1' AFTER 15 ns;

END sequential;