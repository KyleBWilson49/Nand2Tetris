// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

@KBD
D=A
@maxaddress
M=D

// loop and listen to key press
(LOOP)
    @KBD
    D=M;
    @BLACK
    D;JNE
    @WHITE
    0;JMP

// blacken the screen
(BLACK)
    @SCREEN
    D=A
    @address
    M=D

    (BLACKLOOP)
        @address
        D=M
        @maxaddress
        D=M-D
        @LOOP
        D;JEQ

        @address
        A=M
        M=-1
        @address
        M=M+1

        @BLACKLOOP
        0;JMP


// whiten the screen
(WHITE)
    @SCREEN
    D=A
    @address
    M=D

    (WHITELOOP)
        @address
        D=M
        @maxaddress
        D=M-D
        @LOOP
        D;JEQ

        @address
        A=M
        M=0
        @address
        M=M+1

        @WHITELOOP
        0;JMP