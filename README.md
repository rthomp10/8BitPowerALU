#8BitPowerALU
This is an 8-bit power ALU. The ALU takes a single 8-bit value and an opcode, performs the chosen operation, and the resut is to be fed back as an input and accessable as an output.

![Original Block Diagram](https://github.com/rthomp10/8BitPowerALU/blob/master/block_diagram_initial.png "Initial Block Diagram")

![Modified Block Diagram](https://github.com/rthomp10/8BitPowerALU/blob/master/block_diagram_modified.png "Modified Block Diagram")

##Operations
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