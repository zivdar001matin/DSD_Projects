* Adder
Implementing n-bit sequential adder with Procces and Variable.

** Tips
1. To view Variable values in ModelSim simulation, follow these steps:
    1. First you should open adder.vhd in ModelSim (File -> Open -> adder.vhd).
    2. Put breakpoint on the line that we defined Variable c (line 18).
    3. View -> Locals
    4. Select c and add it to waves.

2. For saving time to skip adding Variable to waveform, you can save wave format using (File -> Save Format) or <kbd>ctrl+S</kbd>. Next time you shoul only run this command in Transcript:
```code
do wave.do
```