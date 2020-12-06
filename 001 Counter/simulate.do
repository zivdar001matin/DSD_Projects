----------------------
-- start simulation --
----------------------
vsim -gui work.counter -t ns


-----------------------------
-- add waves to simulation --
-----------------------------
add wave -position insertpoint  \
sim:/counter/nrst \
sim:/counter/clk \
sim:/counter/mode \
sim:/counter/din \
sim:/counter/dout \
sim:/counter/temp

-----------------
-- apply clock --
-----------------
force -freeze sim:/counter/clk 1 0, 0 {10 ns} -r 20

----------------------------
-- force waves to signals --
----------------------------
force nrst 0 0ns, 1 1ns
force mode 0 0ns, 1 25ns--, 2 45ns, 3 65ns
force din "10000001" 0ps
force mode 0 85ns, 4 105ns, 5 125ns, 6 145ns, 7 205ns
force din "00111101" 85ns

run 300ns
