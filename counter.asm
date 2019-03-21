$include (c8051f020.inc)

ORG 0

TABLE EQU 100H


; Enable the Port I/O Crossbar
			MOV WDTCN, #0DEh
      MOV WDTCN, #0ADh
      MOV XBR2, #40H
			ORL P1MDIN, #0FFH
      ORL P1MDOUT,#0FFH
			MOV A, #0FFH
			MOV P2, A
			

MAIN: 
			MOV A,#00H
			MOV P2,A
			MOV DPTR,#TABLE
			MOV R0,A

LOOP: 
			MOVC A,@A+DPTR
			MOV P1,A
			INC R0
			MOV A,R0
			CALL DELAY
			


DELAY:	
				MOV R1,#50
				MOV R2,#30
				MOV R5,#10
				MOV R4,#255
				MOV R3,#255
				JB P2.0,LOOP1
				JB P2.1,LOOP2
				JB P2.2,LOOP3
				LOOP1:	
								DJNZ R3,LOOP1
								DJNZ R4,LOOP1
								DJNZ R5,LOOP1
								CJNE R0,#0AH,LOOP
      
								JMP MAIN
								
				LOOP2:
								DJNZ R3,LOOP2
								DJNZ R4,LOOP2
								DJNZ R1,LOOP2
								CJNE R0,#0AH,LOOP
      
								JMP MAIN
				LOOP3:	
								DJNZ R3,LOOP3
								DJNZ R4,LOOP3
								DJNZ R2,LOOP3
								CJNE R0,#0AH,LOOP
      
								JMP MAIN
								
RET



			ORG TABLE
			DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH
END

