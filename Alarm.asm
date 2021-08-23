;#######################################################
;# 8086 Program to Alarm within Beep                   #
;#              Author: MH_Miyazi                      #
;#######################################################



.MODEL SMALL 
.STACK 100H 
.DATA 
    MESSAGE  DB 'The Alarming time is : $'      
    TIME_STAMP DB '00:00:00$'         
.CODE 
   MAIN PROC 
     MOV AX, @DATA              
     MOV DS, AX 
     LEA BX, TIME_STAMP                  
     CALL GET_TIME_STAMP                 
     LEA DX, MESSAGE               
     MOV AH, 09H                   
     INT 21H
                            
     LEA DX, TIME_STAMP                 
     MOV AH, 09H                        
     INT 21H
                            
     MOV AH, 4CH                   
     INT 21H
      
   MAIN ENDP 
   GET_TIME_STAMP PROC     
            PUSH AX                        
            PUSH CX                        
            MOV AH, 2CH                    
            INT 21H
             
            MOV AH,2 
            MOV DL,07H 
            INT 21H
             
            MOV AH,2 
            MOV DL,07H 
            INT 21H
              
            MOV AH,2 
            MOV DL,07H 
            INT 21H
              
            MOV AH,2 
            MOV DL,07H 
            INT 21H
             
            MOV AH,2 
            MOV DL,07H 
            INT 21H
             
            MOV AH,2 
            MOV DL,07H 
            INT 21H
              
            MOV AL, CH                     
            CALL CONVERT                       
            MOV [BX], AX                   
            MOV AL, CL                     
            CALL CONVERT                   
            MOV [BX + 3], AX                                                           
            MOV AL, DH                     
            CALL CONVERT                   
            MOV [BX + 6], AX                                                                      
            POP CX                         
            POP AX 
            RET 
                 
     GET_TIME_STAMP ENDP                    
     CONVERT PROC      
            PUSH DX                        
            MOV AH, 0                      
            MOV DL, 10                    
            DIV DL                         
            OR AX, 3030H                   
            POP DX 
            RET 
      CONVERT ENDP                    
 END MAIN