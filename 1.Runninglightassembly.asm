.include "m328pdef.inc"	; Prozessordefinitionen laden

.org 0x00		; reset vactor
 rjmp start

start:
	ldi r24, LOW( RAMEND )
	out SPL, r24
	ldi r24, HIGH( RAMEND )
	out SPH, r24

ldi r24, 0b00000111 ; PIN 10,9 and 8 as output
OUT DDRB, r24		;set DDR

.def delay_0 = R17 ;define R17 for delay_0
.def delay_1 = R18 ;define R18 for delay_1
.def delay_2 = R19 ;define R19 for delay_2


main:			   ;main function

rcall setdelay

ldi r24, 0b00000100; set PIN 10
OUT PORTB, r24	   ;

rcall delay		   ;go-to delay function

rcall setdelay	   ;go-to setdelay function

ldi r24, 0b00000010	 ;set PIN 9
OUT PORTB, r24  	 ;

rcall delay		 ;go-to delay function

rcall setdelay	  	 ;go-to setdelay function

ldi r24, 0b00000001	 ;set PIN 8
OUT PORTB, r24

rcall delay		 ;go-to delay function

rcall setdelay	  	 ;go-to setdelay function

ldi r24, 0b00000010	 ;set PIN 9
OUT PORTB, r24

rcall delay	 	 ;go-to delay function

rjmp main	      	 ;rejump to main


delay:
	dec delay_2	 ;delay_2-1
	brne delay	 ;Branch if Not Equal

	dec delay_1 	 ;delay_1-1
	brne delay	 ;Branch if Not Equal

	dec delay_0   	 ;delay_0-1
	brne delay	 ;Branch if Not Equal


	ret		 ;go back to PC+1


setdelay:

	ldi delay_0, 17	  ;set R17(delay_0)
	ldi delay_1, 60   ;set R18(delay_1)
	ldi delay_2, 204  ;Set R19(delay_2)




	ret		  ;go back to PC+1 	
