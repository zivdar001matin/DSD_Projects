LIBRARY ieee;
USE ieee.std_logic.ALL;
use ieee.numeric_std.all;
PACKAGE basic_utils IS
	TYPE infos IS ARRAY (0 TO 54) OF std_logic;
	TYPE mat2d IS ARRAY (0 TO 1024, 0 TO 1024) OF integer RANGE 0 TO 255;
END basic_utils;

LIBRARY ieee;
USE ieee.std_logic.ALL;
USE work.basic_utils;
ENTITY rotate IS
	PORT (
		inp_header : IN infos;
		inp_pixels : IN mat2d;
		--	0 : no-rotate
		--	1 : 90°
		--	2 : 180°
		--	3 : 270°
		degree	   : IN integer;
		out_header : OUT infos;
		out_pixels : OUT mat2d
	);
END rotate;