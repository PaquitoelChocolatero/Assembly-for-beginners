# Assembly for Beginners
[![HitCount](http://hits.dwyl.io/PaquitoElChocolatero/Assembly-for-beginners.svg)](http://hits.dwyl.io/PaquitoElChocolatero/Assembly-for-beginners)<br />
In this repository you will find a beginner's guide to MIPS programming<br />
<br />
Every example used can be run to see the output in first person<br />

## Getting Started
Assembly files use the ".s" extension<br />
<br />
The structure is the following:<br />
tag , dest , rs1 , rs2<br />
<br />
Where 'tag' is the desired instruction (add, li, move, etc.), 'dest' is the register where the result of the instruction (if it has one) goes and 'rs1' and 'rs2' are the two registers involving the operation

### Compiling with QTSpim

We recommend [QtSpim](https://sourceforge.net/projects/spimsimulator/files/): <br />

![alt text](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/images/Qtspim.jpg)<br />
From the top you can find in orange the reset and open option. It is very important that before every compilation you restore the registers and data.<br />
In blue there are the play, pause and stop controls, used to run the program. Followed by the step by step control (in yellow) which will be very useful when debugging.<br />
At the bottom in green are the registers of our processor, they will be filled with whatever you load them with.<br />
And last but not least, in red, the instructions. This is a visual way to know the current instruction, it is very useful with the step by step control in case the program isn't working or has a bug.<br />

### Compiling with Mars

You can also use [MARS](https://courses.missouristate.edu/KenVollmar/MARS/download.htm). In order to execute it:
```
java Mars
```
![alt text](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/images/Mars.jpg)<br />

In Mars you can write your code in de Edit Window, or load your '.s' file, clicking on File>Open and looking for your file. For compiling it click on Run>Assemble or use the shortcut F3. Then you will enter on the Execute window, where you can run it completely or step by step, with the green play button placed in the top.
<br />

## Index of contents:
1. [Guides](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/tree/master/Guides)
    - [Spanish](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/Guides/MIPS_guide(Spanish).pdf)
    - [English](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/Guides/MIPS_guide(English).pdf)
2. [MIPS 101](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/tree/master/MIPS%20101)
    - [Basic operations](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/MIPS%20101/Basic_operations.s)
    - [System calls](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/MIPS%20101/System_calls.s)
    - [Branches](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/MIPS%20101/Branches.s)
    - [Lists](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/MIPS%20101/Lists.s)
    - [Stack](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/MIPS%20101/Stack.txt)
    - [Stack frame](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/MIPS%20101/stack_frame.png)
    - [Functions](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/blob/master/MIPS%20101/Functions.s)
3. [Examples](https://github.com/PaquitoelChocolatero/Assembly-for-beginners/tree/master/Examples)

## Credits:

- [Guillermo Bautista-Abad](https://github.com/Fortesque73)
- [Alejandro de la Torre](https://github.com/Xartrex)
- [Juan Francisco García](https://github.com/hielo99)
- [Juan Banga](https://github.com/Juanbanpar)
- [Alejandro de la Cruz](https://github.com/PaquitoElChocolatero)
