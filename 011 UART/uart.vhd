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
        tx  	        : OUT std_logic;
        data_ready      : BUFFER std_logic;
		data_out        : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END uart;


ARCHITECTURE behavioral OF uart IS
	type send_state_type IS (idle, send_Zero, send_num, send_xor, wait_state, get_res);
	type get_state_type IS (idle  , get_num , get_xor , parity_check , send_res);
	
BEGIN
	 PROCESS(clk)
		VARIABLE state_s: send_state_type:= idle;
		VARIABLE next_state_s: send_state_type;
		VARIABLE baud_counter_s, bit_counter_s: integer RANGE 0 TO 8 := 0;
		VARIABLE res_flag: boolean := false;
		-------------------------------
		VARIABLE state: get_state_type := idle;
		VARIABLE next_state : get_state_type;
		VARIABLE baud_counter : integer RANGE 0 TO 8 := 0;
		VARIABLE bit_counter : integer RANGE 0 TO 8 := 0;
		VARIABLE parity: std_logic ;
		-------------------------------
	BEGIN
		IF clk = '1' THEN 

			-------------------------------
			------- RESET -----------------
			-------------------------------
			IF nrst = '0' THEN 
				-- send signals
				state_s := idle;
				next_state_s := idle;
				baud_counter_s := 0;
				bit_counter_s := 0;
				res_flag := false;
				--get signals
				state := idle;
				next_state := idle;
				baud_counter := 0;
				bit_counter := 0;
				--outputs
				tx <= '1';
				data_ready <= '0';
				data_out <= (OTHERS => '0');
			ELSE 
				state_s := next_state_s;
				
				--------------------------
				-- send ------------------
				--------------------------
				CASE state_s IS 
					WHEN idle => 
						IF start = '1' THEN 
							next_state_s := send_zero;
						END IF;
					WHEN send_zero =>
						IF baud_counter_s < to_integer(unsigned(baud)) THEN 
							baud_counter_s := baud_counter_s + 1;
							tx <= '0';
						ELSE
							next_state_s := send_num;
							baud_counter_s := 0;
						END IF;
					WHEN send_num => 
						IF baud_counter_s < to_integer(unsigned(baud)) and bit_counter_s <= 7 THEN
							tx <= data_in(bit_counter_s);
							baud_counter_s := baud_counter_s + 1;
						ELSIF baud_counter_s = to_integer(unsigned(baud)) THEN 
							baud_counter_s := 0;
							bit_counter_s := bit_counter_s + 1;
						ELSE
							next_state_s := send_xor;
							bit_counter_s := 0;
							baud_counter_s := 0;
						END IF;
					WHEN send_xor => 
						IF baud_counter_s < to_integer(unsigned(baud)) THEN
							tx <= data_in(0) XOR data_in(1) XOR data_in(2) XOR data_in(3) XOR data_in(4) XOR data_in(5) XOR data_in(6) XOR data_in(7);
							baud_counter_s := baud_counter_s + 1;
						ELSE 
							baud_counter_s := 0;
							next_state_s := wait_state;
						END IF;
					WHEN wait_state => 
						IF baud_counter_s < to_integer(unsigned(baud)) THEN 
							baud_counter_s := baud_counter_s + 1;
						ELSE 
							baud_counter_s := 0;
							next_state_s := get_res;
						END IF;
					WHEN get_res => 
						IF baud_counter_s < to_integer(unsigned(baud)) THEN
							IF rx = '0' THEN 
								res_flag := true;
							END IF;
							baud_counter_s := baud_counter_s + 1;
						ELSE 
							IF res_flag = true THEN 
								next_state_s := send_num;
							ELSE 
								next_state_s := idle;
								tx <= '1';
							END IF;
							res_flag := false;
						END IF;
				END CASE;
				--------------------------
				-- GET -------------------
				--------------------------
				CASE state IS
				WHEN idle =>
					IF rx = '1' THEN
						NULL;
					ELSE
						IF baud_counter < to_integer(unsigned(baud)) THEN
							baud_counter := baud_counter + 1;
						ELSE 
							baud_counter:= 0;
							next_state := get_num;
						END IF;
					END IF;
				WHEN get_num =>
					data_ready <= '0';
					IF baud_counter < to_integer(unsigned(baud)) AND bit_counter <= 7 THEN
						baud_counter := baud_counter +1;
					ELSIF baud_counter = to_integer(unsigned(baud)) THEN
						data_out(bit_counter) <= rx;
						bit_counter := bit_counter +1;
						baud_counter :=0;
					ELSE 
						next_state := get_xor;
						bit_counter := 0;
						baud_counter := 0;
					END IF;
				WHEN get_xor =>
					IF baud_counter < to_integer(unsigned(baud)) THEN
						baud_counter := baud_counter +1;
					ELSE 
						next_state := parity_check;
						parity := rx;
						baud_counter := 0;
					END IF;
				WHEN parity_check =>
					IF baud_counter < to_integer(unsigned(baud)) THEN
						baud_counter := baud_counter +1;
						IF parity =  (data_out(0) xor data_out(1) xor data_out(2) xor data_out(3) xor data_out(4)  xor data_out(5)  xor data_out(6)  xor data_out(7)) THEN
							data_ready <= '1';
						ELSE 
							data_ready<= '0';
						END IF;
					ELSE	
						next_state := send_res;
						baud_counter := 0;
					END IF;
				WHEN send_res =>
					IF baud_counter <= to_integer(unsigned(baud)) THEN
						baud_counter := baud_counter + 1;
						tx<= data_ready;
					ELSE
						IF data_ready = '0' THEN
							next_state := get_num;
						ELSE
							next_state := idle;
							
						END IF;
						baud_counter := 0;
					END IF;
				END CASE;
				state := next_state;
			END IF;
		END IF;
	END PROCESS ;
END behavioral;