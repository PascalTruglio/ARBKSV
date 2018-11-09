#include <avr/io.h>
#include <avr/interrupt.h>
#define F_CPU 16000000UL /*CPU Takt*/
#include <util/delay.h>


int state = 0;


//Interrupt Service Routine for INT0
ISR(INT0_vect)
{
	//EVENT A
/*	
	if(state==0)
	{
		state = 1;
	}
	else
	{
		if(state == 2)
		{
			state = 1;
		}
		else
		{
			state = 0;
		}
		
	}*/
	if(state == 0 || state == 2)
	{
		state = 1;
	}
	else if(state == 1)
	{
		state = 0;
	}
	//_delay_ms(1000);	

}
//Interrupt Service Routine for INT1
ISR(INT1_vect)
{
	//EVENT B
/*	if(state==0)
	{
		state = 2;
	}	
	else
	{
		if(state == 1)
		{
			state = 2;
		}
		else
		{
			state = 0;
		}
		
	}*/

	if(state == 0 || state == 1)
	{
		state = 2;
	}
	else if(state == 2)
	{
		state = 0;
	}
	//_delay_ms(1000);
}

int main(void)
{
	EICRA |= (1<< ISC11);// Trigger on rising edge
	EIMSK |= (1<<INT0);     // Enable INT0
	EIMSK |= (1<<INT1);     // Enable INT1
	

	
	sei();    //Enable Global Interrupt
	
	DDRB  = 0b00000011;//set LEDs out on Port B
	DDRD  = 0b00000000;//set Port D as Input
	PORTD = 0b00001100;// set pullup on INT0 and INT1
	
	/* Replace with your application code */
	while (1)
	{
		//Blink 0
		PORTB = 0b00000000;
		_delay_ms(200);
		
		//Blink 1
		if(state == 1)
		{
			PORTB = 0b00000001;
		}
		if(state == 2)
		{
			PORTB = 0b00000010;
		}
		_delay_ms(200);
	}
}