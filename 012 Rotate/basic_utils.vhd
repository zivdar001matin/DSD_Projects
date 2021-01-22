LIBRARY ieee;
use ieee.numeric_std.all;
PACKAGE basic_utils IS
	TYPE mat1d IS ARRAY (0 TO 767) OF integer RANGE 0 TO 255; -- 3*16*16 - 1 = 767
	TYPE mat2d IS ARRAY (0 TO 15, 0 TO 47) OF integer RANGE 0 TO 255; -- 3*16 - 1 = 47
	TYPE mat2d_3arr IS ARRAY(0 TO 3) OF mat2d;
	TYPE arr3_usigned53 IS ARRAY(0 TO 3) OF unsigned(0 TO 53);
END basic_utils;