//Screen start 
@SCREEN
D=A
@arr
M=D          // address=16384 (base address of the Hack Screen)

//n=8192
@8192
D=A
@n
M=D

// initialize i=0
@i 
M=0

(LOOP) 
    @KBD
    D=M
    @WHITE
    D; JEQ              //WHITE loop if keyboard is zero
    // RESET i=0
    @i 
    M=0
    
    @KBD
    D=M
    @BLACK
    D; JGT              //BLACK loop if keyboard is not zero
    // RESET i=0
    @i 
    M=0

    @LOOP
    0;JMP

(WHITE)
    @i
    D=M
    @n
    D = D-M
    @LOOP
    D; JEQ
    // SCREEN[arr+i] = 0   
    @arr
    D=M
    @i
    A=D+M
    M=999

    // i++
    @i
    M=M+1          // i = i + 1
    
    @WHITE
    0;JMP


(BLACK)
    @i
    D=M
    @i
    M=D+1          // i = i + 1
    @n
    D = D-M
    @LOOP
    D; JEQ
    // SCREEN[arr+i] = 0   
    @arr
    D=M
    @i
    A=D+M
    M=-1
    @BLACK
    0;JMP