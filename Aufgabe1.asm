.include "m328pdef.inc"	; Prozessordefinitionen laden

.org 0x00		; Reset Vektor
 rjmp start

start:
	ldi r24, LOW( RAMEND )
	out SPL, r24
	ldi r24, HIGH( RAMEND )
	out SPH, r24

ldi r24, 0b00000111 ; Pin 10(rot),9(gelb) und 8(gr�n) am Arduino Uno als Ausg�nge gestezt
OUT DDRB, r24		;DDR setzten

.def delay_0 = R17 ;Definiere Register R17 f�r delay_0
.def delay_1 = R18 ;Definiere Register R18 f�r delay_1
.def delay_2 = R19 ;Definiere Register R19 f�r delay_2


main:			   ;Anfang des Programms

rcall setdelay

ldi r24, 0b00000100;setze Rote LED an
OUT PORTB, r24	   ;�bergebe R24 an den Ausgang

rcall delay		   ;F�hre delay aus und komme hierhin zur�ck(PC+1)

rcall setdelay	   ;Setzte delaywerte

ldi r24, 0b00000010;Gelbe LED an
OUT PORTB, r24   ;�bergebe R24 an den Ausgang

rcall delay		   ;F�hre delay aus und komme hierhin zur�ck(PC+1)

rcall setdelay	   ;Setzte delaywerte

ldi r24, 0b00000001; Gr�ne LED an
OUT PORTB, r24	   ;�bergebe R24 an den Ausgang

rcall delay		   ;F�hre delay aus und komme hierhin zur�ck(PC+1)

rcall setdelay	   ;Setzte delaywerte

ldi r24, 0b00000010;Gelbe LED an
OUT PORTB, r24	   ;�bergebe R24 an den Ausgang

rcall delay		   ;F�hre delay aus und komme hierhin zur�ck(PC+1)

rjmp main	       ;Springe zur�ck nach Loop


delay:			   ;Zeitverz�gerung
	dec delay_2	   ;delay_2 wird um eins gesenkt
	brne delay	   ;delay_2 wird verglichen

	dec delay_1   ;delay_1 wird um eins gesenkt
	brne delay	   ;delay_1 wird verglichen

	dec delay_0   ;delay_0 wird um eins gesenkt
	brne delay	  ;delay_0 wird verglichen

	
	ret			  ;Gehe zur R�cksprungadresse 	


setdelay:

	ldi delay_0, 17	   ;Setzte Register R17(delay_0)
	ldi delay_1, 60   ;Setzte Register R18(delay_1)
	ldi delay_2, 204   ;Setzte Register R19(delay_2)




	ret				   ;Gehe zur R�cksprungadresse 	


