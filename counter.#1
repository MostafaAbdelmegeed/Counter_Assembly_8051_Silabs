$include (c8051f020.inc)

TABLE EQU 100H


PING      	 EQU   P1.0
PINF		 		 EQU	 P1.1
PINA			 	 EQU	 P1.2
PINB			 	 EQU	 P1.3
PINE		 		 EQU	 P1.4
PIND		 		 EQU	 P1.5
PINC			 	 EQU	 P1.6
PINDOT			 EQU	 P1.7

ORG 0

MAIN: 
; Enable the Port I/O Crossbar
      MOV   XBR2, #40h
			ORL   P1MDIN, #40h	 
      ORL   P1MDOUT,#40h 
			
			
			MOV A,#00H
			MOV DPTR,#TABLE
			MOV R0,A



		

LOOP: MOVC A,@A+DPTR
			MOV P1,A
			INC R0
			MOV A,R0
			CALL DELAY
			CJNE R0,#0AH,LOOP


			
	JMP MAIN

DELAY:
				MOV R1,#00H
				MOV R2,#00H
				MOV R3,#05H
				LOOP1:
								DJNZ R1,LOOP1
								DJNZ R2,LOOP1
								
				RET

			ORG TABLE
			DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH
END

