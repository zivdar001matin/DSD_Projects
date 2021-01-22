LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
USE work.basic_utils.ALL;
ENTITY myrotate IS
	PORT (
		inp_header : IN unsigned(0 TO 53);
		inp_pixels : IN mat2d;
		--	0 : no-rotate
		--	1 : 90°
		--	2 : 180°
		--	3 : 270°
		degree	   : IN integer;
		out_header : OUT unsigned(0 TO 53);
		out_pixels : OUT mat2d
	);
END myrotate;

ARCHITECTURE concurrent OF myrotate IS

	SIGNAL s_infos	: arr3_usigned53;
	SIGNAL s_pixels	: mat2d_3arr;

BEGIN

	s_infos(0) <= inp_header;
	s_pixels(0) <= inp_pixels;

	-- rotate 90°
	Level1: FOR i IN 0 TO 15 GENERATE
		Level2: FOR j IN 0 TO 15 GENERATE
			s_pixels(1)(i, 3*j+0) <= s_pixels(0)(j, 3*i+0);
			s_pixels(1)(i, 3*j+1) <= s_pixels(0)(j, 3*i+1);
			s_pixels(1)(i, 3*j+2) <= s_pixels(0)(j, 3*i+2);
		END GENERATE Level2;
	END GENERATE Level1;

	Level1_1: FOR i IN 0 TO 17 GENERATE
		s_infos(1)(i) <= inp_header(i);
	END GENERATE Level1_1;
	Level1_2: FOR i IN 0 TO 4 GENERATE
		s_infos(1)(18+i) <= inp_header(23+i);
		s_infos(1)(23+i) <= inp_header(18+i);
	END GENERATE Level1_2;
	Level1_3: FOR i IN 28 TO 53 GENERATE
		s_infos(1)(i) <= inp_header(i);
	END GENERATE Level1_3;


	-- rotate 180°
	Level1_4: FOR i IN 0 TO 15 GENERATE
		Level2_1: FOR j IN 0 TO 15 GENERATE
			s_pixels(2)(i, 3*j+0) <= s_pixels(0)(15-i, 3*j+0);
			s_pixels(2)(i, 3*j+1) <= s_pixels(0)(15-i, 3*j+1);
			s_pixels(2)(i, 3*j+2) <= s_pixels(0)(15-i, 3*j+2);
		END GENERATE Level2_1;
	END GENERATE Level1_4;
	s_infos(2) <= s_infos(0);

	-- rotate 270°
	Level1_5: FOR i IN 0 TO 15 GENERATE
		Level2_2: FOR j IN 0 TO 15 GENERATE
			s_pixels(3)(i, 3*j+0) <= s_pixels(0)(i, 3*(15-j)+0);
			s_pixels(3)(i, 3*j+1) <= s_pixels(0)(i, 3*(15-j)+1);
			s_pixels(3)(i, 3*j+2) <= s_pixels(0)(i, 3*(15-j)+2);
		END GENERATE Level2_2;
	END GENERATE Level1_5;
	s_infos(3) <= s_infos(1);

	out_header <= s_infos(degree);
	out_pixels <= s_pixels(degree);

END concurrent;