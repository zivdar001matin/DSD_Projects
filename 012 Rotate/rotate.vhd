LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
USE work.basic_utils.ALL;
ENTITY myrotate IS
	PORT (
		inp_header : IN unsigned(0 TO 53);
		inp_pixels : IN mat1d;
		--	0 : no-rotate
		--	1 : 90°
		--	2 : 180°
		--	3 : 270°
		degree	   : IN integer;
		out_header : OUT unsigned(0 TO 53);
		out_pixels : OUT mat1d
	);
END myrotate;

ARCHITECTURE behavioral OF myrotate IS

SIGNAL s_width	: integer;
SIGNAL s_height	: integer;
SIGNAL s_width_temp : std_logic_vector(0 TO 3);
SIGNAL s_height_temp : std_logic_vector(0 TO 3);

SIGNAL sinf, cosf	: integer;

BEGIN

s_width_temp <= inp_header(18) & inp_header(19) & inp_header(20) & inp_header(22);
s_width <= to_integer(unsigned(s_width_temp));
s_height_temp <= inp_header(23) & inp_header(24) & inp_header(25) & inp_header(26);
s_height <= to_integer(unsigned(s_height_temp));

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

PROCESS(inp_header, inp_pixels, degree)

    VARIABLE x0,y0		: integer;
    VARIABLE a, b		: integer;
    VARIABLE xx, yy		: integer;
    VARIABLE v_pixels	: mat1d;

    BEGIN

        x0 := (s_width - 1) / 2;
        y0 := (s_height - 1) / 2;


            
        FOR x IN 0 TO s_width - 1 LOOP
            FOR y IN 0 TO s_height - 1 LOOP

                a := x - x0;
                b := y - y0;
                xx := a * cosf - b * sinf + x0;
                yy := a * sinf + b * cosf + y0;

                IF xx >= 0 AND xx < s_width AND yy >= 0 AND yy < s_height THEN
                    v_pixels((y * s_height + x) * 3 + 0) := inp_pixels((yy * s_height + xx) * 3 + 0);
                    v_pixels((y * s_height + x) * 3 + 1) := inp_pixels((yy * s_height + xx) * 3 + 1);
                    v_pixels((y * s_height + x) * 3 + 2) := inp_pixels((yy * s_height + xx) * 3 + 2);
                END IF;
            END LOOP;
        END LOOP;

        out_header <= (OTHERS => '0');
        out_pixels <= v_pixels;

END PROCESS;
END behavioral;