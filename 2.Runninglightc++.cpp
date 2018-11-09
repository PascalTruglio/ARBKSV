/*
 * Aufgabe2.cpp
 *
 * Created: 22.10.2018 10:57:08
 * Author : Pascal
 */

#include <avr/io.h>  /*AVR Bib*/
#define F_CPU 16000000UL /*CPU Takt*/
#include "util/delay.h" /*Bib for delay*/




int main(void) /*main function*/
{
    DDRB |= 0b00000111; /*set DDRB*/
    while (1) /*loop*/
    {
		    PORTB = 0b00000100;  /*set PIN 10*/        
		    _delay_ms(1000);     /*wait*/

		    PORTB = 0b00000010; /*set PIN 9*/
		    _delay_ms(1000);	 /*wait*/

		   PORTB = 0b00000001;	/*set PIN 8*/
		   _delay_ms(1000);	/*warten*/

		   PORTB = 0b00000010;	/*set PIN 9*/
		   _delay_ms(1000);	/*wait*/
    }

	return 0;
}
