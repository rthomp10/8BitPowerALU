# 8BitPowerALU
This is an 8-bit power ALU. The ALU takes a single 8-bit value and an opcode, performs the chosen operation, and the resut is to be fed back as an input and accessable as an output.

![Original Block Diagram](https://github.com/rthomp10/8BitPowerALU/blob/master/block_diagram_initial.png "Initial Block Diagram")

## Operations
|opcode| Operation      |
| :---:|:--------------:|
| 0000 | Transfer A     |
| 0001 | Increment A    |
| 0010 | Addition       |
| 0011 | Subtraction    |
| 0100 | Decrement A    |
| 0101 | 1's Compliment |
| 0110 | A AND  B       |
| 0111 | A NAND B       |
| 1000 | A OR   B       |
| 1001 | A NOR  B       |
| 1010 | A XOR  B       |
| 1011 | A XNOR B       |
| 1100 | A GT   B       |
| 1101 | A LT   B       |
| 1110 | A EQ   B       |
| 1111 | NOT A          |

## Design Choices

* The design choices made were certainly not "the best." They simply demostrate that I understand some of the fundumentals of hardware design
* The ALU consistes of two synchronous blocks while the rest are asynchronous
* This is a mealy state machine with a given input starting at 0
* The inputs are to be 8-bit 2's compliment values
* I'm not sure why there needs to be an output control signal for this simple design, so I got rid of it
* On the positive edge of a clock, the opcode is translated and allows the the result to flow through. The negative edge of the clock locks in the answer and provides it back to the input
* The only structual block is the adder_subtractor block. I enjoy RTL a lot more than making large multiplexers and what not. I just wanted to demonstrate that I knew the difference between structal and RTL.

![Modified Block Diagram](https://github.com/rthomp10/8BitPowerALU/blob/master/block_diagram_modified.png "Modified Block Diagram")

## Running with Iverilog and GTKWave
### Linux/OSX
1. Install [iverilog](http://iverilog.icarus.com) (It's as simple as _brew install icarus-verilog_ with [Homebrew](https://brew.sh))
2. Install [GTKWave](http://gtkwave.sourceforge.net) to witness the system output (_brew cask install gtkwave_)
3. When in the 8BitPowerALU folder, _chmod 775 run_
4. _./run_
5. Open PowerALU.vcd
### Windows
1. Install [iverilog](http://iverilog.icarus.com) 
2. Install [GTKWave](http://gtkwave.sourceforge.net) to witness the system output (_brew cask install gtkwave_)
3. Go to the 8BitPowerALU folder through the command line/Power Shell
4. _iverilog PowerALU_Ryan_Thompson.v control.v accumulator.v compare.v andornot.v adder_subtractor.v mux.v full_adder.v PowerALU_Ryan_Thompson_tb.v_
5. _vvp a.out_
6. Open PowerALU.vcd