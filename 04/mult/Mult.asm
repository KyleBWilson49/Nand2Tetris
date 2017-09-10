// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@i      // create i
M=1     // initialize i to 0
@R2
M=0     // initialize R0 to 0

(LOOP)
    @i
    D=M     // set D = index
    @R1
    D=M-D   // set D = R1 - index
    @END
    D;JLT   // if D < 0 end
    @R0
    D=M     // set D = R0
    @R2
    M=M+D   // set R0 = R0 + R0
    @i
    M=M+1   // set index = index + 1
    @LOOP
    0;JMP

(END)
    @END
    0;JMP // infinite loop