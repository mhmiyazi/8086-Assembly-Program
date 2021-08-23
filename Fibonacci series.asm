;#######################################################
;# 8086 Program to prints term of the Fibonacci series #
;#              Author: MH_Miyazi                      #
;#######################################################



.MODEL SMALL
.STACK 100H
.DATA                                                  
     DIS_HEAD  DB "Terms of the Fibonacci series: $"
     PREFIX    DB "Fibonacci($"
     SUFFIX    DB "):  $"
     INDEXING  DB '0'
     NUM_1_023 DB ?
     NUM_2_023 DB ?
     F_DIG     DB ?
     S_DIG     DB ?
     SPACE_023 DB ' '
        

MH_MIYAZI:                   
       MAIN PROC
                MOV AX,@DATA
                MOV DS,AX
                MOV CX,10
                MOV CH,0   
                
                MOV AH,9 
                LEA DX,DIS_HEAD
                INT 21H
                        
                MOV AH,2    ;
                MOV DL,10   ;
                INT 21H     ; New Line
                MOV DL,13   ;
                INT 21H     ;
                
                MOV NUM_1_023,0
                MOV NUM_2_023,1
                                
                MOV AH,9 
                LEA DX,PREFIX
                INT 21H
                
                MOV DL,INDEXING
                MOV AH,02H
                INT 21H
                
                MOV AH,9 
                LEA DX,SUFFIX
                INT 21H
                                        
                MOV DL,NUM_1_023
                OR  DL,30H
                MOV AH,02H
                INT 21H

                MOV DL,NUM_2_023
                OR DL,30H 
                MOV AH,02H
                INT 21H
                
                MOV AH,2    ;
                MOV DL,10   ;
                INT 21H     ; New Line
                MOV DL,13   ;
                INT 21H     ;          
                                       
                   
                
                
              
                
               LOOP_1:      
                        INC [INDEXING] 
                        
                        MOV AH,9 
                        LEA DX,PREFIX
                        INT 21H 
                        
                        MOV DL,INDEXING
                        MOV AH,02H
                        INT 21H
                        
                        MOV AH,9 
                        LEA DX,SUFFIX
                        INT 21H
                        
                        MOV AL,NUM_1_023
                        ADD AL,NUM_2_023     
                        MOV AH,0
                        MOV BL,AL
                        MOV DL,10
                        DIV DL
                        ADD AX,3030H

                        MOV F_DIG,AL
                        MOV S_DIG,AH

                        MOV DL,F_DIG
                        MOV AH,02H
                        INT 21H
                        
                        MOV DL,S_DIG
                        MOV AH,02H
                        INT 21H
                        



                SHIFT:
                        MOV AL,NUM_2_023
                        MOV NUM_1_023,AL
                        MOV NUM_2_023,BL 
                        
                        MOV AH,2    ;
                        MOV DL,10   ;
                        INT 21H     ; New Line
                        MOV DL,13   ;
                        INT 21H     ;
                
                        LOOP LOOP_1

                MOV AX,4C00H
                INT 21H

        MAIN ENDP
       END MH_MIYAZI
       
;*********************************************
;*                 OUTPUT                    *
;*********************************************

;01 01 02 03 05 08 13 21 34 55 89       
