// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


//n=8192 - number of cells to fill
@8192
D=A
@n
M=D

(LOOP)
    //Initialization of address and i
    @SCREEN
    D=A
    @address
    M=D              
    @i 
    M=0

    // Get the keyboard value
    @KBD
    D=M                
   
    //WHITE loop if keyboard is zero
    @WHITE
    D; JEQ

    //BLACK loop if keyboard is not zero
    @BLACK
    D; JGT     
 
    @LOOP               
    0;JMP

(WHITE)
    // if i-n == 0 then back to loop to check keyboard again
    @i
    D=M
    @n
    D=D-M    
    @LOOP
    D;JEQ

    @address            // Pointer to the  address
    A=M
    M=0

    @i                   // i++ 
    M=M+1
    @address            // Update address
    M=M+1
    @WHITE
    0;JMP

(BLACK)
    // if i-n == 0 then back to loop to check keyboard again
    @i
    D=M
    @n
    D=D-M    
    @LOOP
    D;JEQ

    @address            // Pointer to the  address
    A=M
    M=-1

    @i                   // i++ 
    M=M+1
    @address            // Update address
    M=M+1
    @BLACK
    0;JMP
