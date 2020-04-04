// Adds up two numbers
// RAM[2] = RAM[1] + RAM[0]
// Usage: put the values that you wish to Adds
// in RAM[0] and RAM[1]

@0
D=M 

@1
D=D+M

@2
M=D

@6
0;JMP