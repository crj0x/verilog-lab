# Verilog Lab

#### Installation
```sh
sudo pacman -S iverilog gtkwave
```

#### Running
```sh
# compile a verilog file
iverilog -o sim.vvp src/*.v tb/tb_and_gate.v
# run the simulation
vvp sim.vvp
# view waveform (if the testbench generates a .vcd file)
gtkwave dump.vcd
```

#### Generate .vcd file
Add the following lines to the test bench to generate the .vcd file
```verilog
initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end
```
