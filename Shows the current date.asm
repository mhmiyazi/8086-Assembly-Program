;##################################################
;# 8086 Program to display date in dd-mm-yy format#
;#       Author: MH_Miyazi                        #
;##################################################


.MODEL SMALL
.STACK 100H
.DATA
  MESSAGE_023 DB "Current$"
  MESSAGE_Ooops DB " Date: $"
  VAR_DUMP DW ?
  COPYRIGHT_ASSEMBLY DB ''
.CODE
 
  MH_MIYAZI:      
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,9       
        LEA DX,MESSAGE_023  
        INT 21H
        MOV AH,9       
        LEA DX,MESSAGE_Ooops  
        INT 21H        

    DAY:
        MOV AH,2AH    
        INT 21H
        MOV AL,DL     
        AAM
        MOV BX,AX
        CALL MAIN
        
        MOV DL,'-'
        MOV AH,02H    
        INT 21H
        
    MONTH:
        MOV AH,2AH   
        INT 21H
        MOV AL,DH     
        AAM
        MOV BX,AX
        CALL MAIN
        
        MOV DL,'-'    
        MOV AH,02H
        INT 21H
   
    YEAR:
        MOV AH,2AH    
        INT 21H
        ADD CX,0F830H 
        MOV AX,CX      
        AAM
        MOV BX,AX
        CALL MAIN
        
        
        MOV AH,4CH     
        INT 21H
        
      MAIN PROC
        MOV DL,BH     
        ADD DL,30H     
        MOV AH,02H    
        INT 21H
        MOV DL,BL       
        ADD DL,30H     
        MOV AH,02H     
        INT 21H
        RET
      MAIN ENDP     


END MH_MIYAZI      