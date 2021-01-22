LIBRARY ieee;
USE ieee.std_logic1164.ALL;
use ieee.numeric_std.all;
PACKAGE basic_utils IS
	TYPE infos IS std_logic_vector(0 to 53);
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

ARCHITECTURE concurrent OF rotate IS

	SIGNAL s_infos	: std_logic_vector(0 TO 3) OF infos;
	SIGNAL s_pixels	: std_logic_vector(0 TO 3) OF mat2d;
	SIGNAL s_width	: std_logic_vector(3 DOWNTO 0);
	SIGNAL s_height	: std_logic_vector(3 DOWNTO 0);

BEGIN

	s_infos(0) <= inp_infos;
	s_pixels(0) <= inp_pixels;
	s_width <= to_integer(unsigned(inp_header(18) & inp_header(19) & inp_header(20) & inp_header(22)));
	s_height <= to_integer(unsigned(inp_header(23) & inp_header(24) & inp_header(25) & inp_header(26)));

	-- rotate 90°
	Level1: FOR i IN 0 TO s_width GENERATE
		Level2: FOR j IN 0 TO s_height GENERATE
			s_pixels(1)(i)(3*j+0) <= s_pixels(0)(j)(3*i+0);
			s_pixels(1)(i)(3*j+1) <= s_pixels(0)(j)(3*i+1);
			s_pixels(1)(i)(3*j+2) <= s_pixels(0)(j)(3*i+2);
		END GENERATE Level2;
	END GENERATE Level1;

	Level1: FOR i IN 0 TO 17 GENERATE
		s_infos(1)(i) <= inp_header(i);
	END GENERATE Level1;
	Level1: FOR i IN 0 TO 3 GENERATE
		s_infos(1)(18+i) <= inp_header(23+i);
		s_infos(1)(23+i) <= inp_header(18+i);
	END GENERATE Level1;
	Level1: FOR i IN 27 TO 54 GENERATE
		s_infos(1)(i) <= inp_header(i);
	END GENERATE Level1;


	-- rotate 180°
	Level1: FOR i IN 0 TO s_width GENERATE
		Level2: FOR j IN 0 TO s_height GENERATE
			s_pixels(2)(i)(3*j+0) <= s_pixels(0)(s_width-i)(3*j+0);
			s_pixels(2)(i)(3*j+1) <= s_pixels(0)(s_width-i)(3*j+1);
			s_pixels(2)(i)(3*j+2) <= s_pixels(0)(s_width-i)(3*j+2);
		END GENERATE Level2;
	END GENERATE Level1;
	s_infos(2) <= s_infos(0);

	-- rotate 270°
	Level1: FOR i IN 0 TO s_width GENERATE
		Level2: FOR j IN 0 TO s_height GENERATE
			s_pixels(3)(i)(3*j+0) <= s_pixels(0)(i)(3*(s_height-j)+0);
			s_pixels(3)(i)(3*j+1) <= s_pixels(0)(i)(3*(s_height-j)+1);
			s_pixels(3)(i)(3*j+2) <= s_pixels(0)(i)(3*(s_height-j)+2);
		END GENERATE Level2;
	END GENERATE Level1;
	s_infos(3) <= s_infos(1);

	out_header <= s_infos(degree)
	out_pixels <= s_pixels(degree)

END concurrent;

ARCHITECTURE behavioral OF rotate IS

	SIGNAL s_width	: std_logic_vector(3 DOWNTO 0);
	SIGNAL s_height	: std_logic_vector(3 DOWNTO 0);

BEGIN

	s_width <= to_integer(unsigned(inp_header(18) & inp_header(19) & inp_header(20) & inp_header(22)));
	s_height <= to_integer(unsigned(inp_header(23) & inp_header(24) & inp_header(25) & inp_header(26)));

    PROCESS(inp_header, inp_pixels, degree)

        VARIABLE x0, x0		: integer;
        VARIABLE a, b		: integer;
        VARIABLE xx, yy		: integer;
        VARIABLE sinf, cosf	: integer;
        VARIABLE v_pixels	: mat2d;


        BEGIN

            x0 := (s_width - 1) / 2;
            y0 := (s_height - 1) / 2;

			WITH degree SELECT
				sinf <= 0	WHEN 0,
						1	WHEN 1,
						0	WHEN 2,
						-1	WHEN OTHERS; -- WHEN 3

			WITH degree SELECT
				cosf <= 1	WHEN 0,
						0	WHEN 1,
						-1	WHEN 2,
						0	WHEN OTHERS; -- WHEN 3
                
            FOR x IN 0 TO s_width - 1 LOOP
				FOR y IN 0 TO s_height - 1 LOOP

                    a := x - x0;
                    b := y - y0;
                    xx := a * cosf - b * sinf + x0;
					yy := a * sinf + b * cosf + y0;

                    IF xx >= 0 AND xx < s_width AND yy >= 0 AND yy < s_height THEN
						v_pixels((y * s_height + x) * 3 + 0) := image_input((yy * s_height + xx) * 3 + 0);
						v_pixels((y * s_height + x) * 3 + 1) := image_input((yy * s_height + xx) * 3 + 1);
						v_pixels((y * s_height + x) * 3 + 2) := image_input((yy * s_height + xx) * 3 + 2);
                    END IF;
                END LOOP;
			END LOOP;

			out_header <= (OTHERS => '0')
			out_pixles <= v_pixels;

    END PROCESS;
END behavioral;