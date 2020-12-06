-----------------------------------------------------------
-- We use -novopt to ModelSim doesn't optimize the code. --
-----------------------------------------------------------
vsim -novopt -gui work.adder_tb

do wave.do

run 30 ns