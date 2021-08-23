;#######################################################
;# 8086 Program to Alarm within Beep                   #
;#              Author: MH_Miyazi                      #
;#######################################################



.MODEL SMALL
.STACK 100H
.DATA
    PRIME_NO DB "The Given Number is a Prime Number$"
    NO_PRIME_NO DB "The Given Number is not a Prime Number$"
    NUM DB 23      ;Required Number
.CODE
        
MH_MIYAZI:
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AL,NUM
        MOV BL,02H      
        MOV DX,0000H    
        MOV AH,00H      
        
        ;Loop for check Prime Number
        L1:DIV BL
        CMP AH,00H      
        JNE NEXT
        INC BH          
        NEXT:CMP BH,02H 
        JE FALSE        
        INC BL          
        MOV AX,0000H    
        MOV DX,0000H    
        MOV AL,NUM      
        CMP BL,NUM      
        JNE L1          
        
        ;Display: The given number is a Prime Number
        TRUE: LEA DX,PRIME_NO
        MOV AH,09H      
        INT 21H
        JMP EXIT
        
        ;Display: The given number is not a Prime Number
        FALSE: LEA DX,NO_PRIME_NO
        MOV AH,09H      
        INT 21H
        
        
        EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP
END MH_MIYAZI
