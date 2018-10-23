/*
 * Aufgabe2.cpp
 *
 * Created: 22.10.2018 10:57:08
 * Author : Pascal
 */ 

#include <avr/io.h>  /*AVR Bibliothek*/
#define F_CPU 1000000UL /*CPU Takt*/
#include "util/delay.h" /*Bibliothek für Delayfunktion*/




int main(void) /*Hauptprogramm*/
{
    DDRB |= 0b00000111; /*DDR setzten*/
    while (1) /*Endlos Schleife*/
    {
		    PORTB = 0b00000100;  /*LED rot an*/        
		    _delay_ms(1000);     /*warten*/                                    

		    PORTB = 0b00000010;  /*LED gelb an*/      
		    _delay_ms(1000);	 /*warten*/  
			
		   PORTB = 0b00000001;	/*LED grün an*/
		   _delay_ms(1000);	/*warten*/  
		   
		   PORTB = 0b00000010;	/*LED gelb an*/
		   _delay_ms(1000);	/*warten*/  
    }
	
	return 0; /*Programm endet mit 0*/
}

