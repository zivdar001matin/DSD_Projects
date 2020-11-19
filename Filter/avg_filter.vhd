LIBRARY ieee;
USE ieee.std_logic.ALL;
PACKAGE basic_utils IS
	TYPE mat2d IS ARRAY (0 TO 255,0 TO 255) OF integer RANGE 0 TO 255;
END basic_utils;

-- We could use zero padding
LIBRARY ieee;
USE ieee.std_logic.ALL;
USE work.basic_utils;
ENTITY avg_filter IS
	PORT (
		inp_pic : IN mat2d;
		out_pic : OUT mat2d
	);
END avg_filter;

ARCHITECTURE concurrent OF avg_filter IS
BEGIN
	-- First row
	FOR j IN 1 TO 254 GENERATE
		out_pic(0)(j) <= (  inp_pic(0)(j-1) + inp_pic(0)(j) + inp_pic(0)(j+1) +
				            inp_pic(1)(j-1) + inp_pic(1)(j) + inp_pic(1)(j+1)) / 9;
	END GENERATE;

	-- First column	--TODO
	-- Last column --TODO

	-- Main matrix
	Level1: FOR i IN 1 TO 254 GENERATE
		Level2: FOR j IN 1 TO 254 GENERATE
			out_pic(i)(j) <= (  inp_pic(i-1)(j-1) + inp_pic(i-1)(j) + inp_pic(i-1)(j+1) +
					            inp_pic(i)(j-1)   + inp_pic(i)(j)   + inp_pic(i)(j+1) +
					            inp_pic(i+1)(j-1) + inp_pic(i+1)(j) + inp_pic(i+1)(j+1)) / 9;
		END GENERATE Level2;
	END GENERATE Level1;

	-- Last row
	FOR j IN 1 TO 254 GENERATE
		out_pic(255)(j) <= (inp_pic(255)(j-1) + inp_pic(255)(j) + inp_pic(255)(j+1) +
				            inp_pic(254)(j-1) + inp_pic(254)(j) + inp_pic(254)(j+1)) / 9;
	END GENERATE;
END concurrent