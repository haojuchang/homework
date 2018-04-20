#include <stdio.h>
#include <stdlib.h>
#include "system.h"
#include "io.h"

#include "alt_types.h"

#define SEG7_NUM 4

void SEG7_light(int num) ;
void SEG7_set(int index, alt_u32 seg_mask);
int SW_get();
void LED_light(alt_u16 led_pattern);
int Btn_get();

static alt_u32 seg7_mask[] = {
	0xFFFFFF00, 0xFFFF00FF, 0xFF00FFFF, 0x00FFFFFF
};

static unsigned char szMap[] = {
	63, 6, 91, 79, 102, 109, 125, 7,
	127, 111, 119, 124, 57, 94, 121, 113
};

int main(){
	int sw_num;
	int num_stack[10];
	int stack_index = -1;
	int i;
	int btn_sel;
	alt_u16 led_pattern = 0x0000;
	
	while(1){
		sw_num = SW_get();
		btn_sel = Btn_get();
		//reset
		if(btn_sel == 3){
			stack_index = -1;
			for(i = 0; i < 10; i++)
				num_stack[i] = 0;
			SEG7_light(0);
			led_pattern = 0x0000;
		}
		//push
		else if(btn_sel == 6 && (stack_index < 9)){
			stack_index ++;
			num_stack[stack_index] = sw_num;
			SEG7_light(num_stack[stack_index]);
			printf("Push: %d\n", num_stack[stack_index]);
			led_pattern <<= 1;
			led_pattern += 1;
		}
		//pop
		else if(btn_sel == 5 && (stack_index > -1)){
			SEG7_light(num_stack[stack_index]);
			printf("Pop: %d\n", num_stack[stack_index]);
			stack_index --;
			led_pattern >>= 1;
			if(stack_index == -1)
				printf("Stack empty!\n");
		}
		
		LED_light(led_pattern);
		for(i = 0; i < 10000000; i++){};
	}
	return 0;
}

void SEG7_light(int num){
	int seg7_1, seg7_2, seg7_3, seg7_4; 
	
	seg7_1 = num / 1000;
	seg7_2 = (num % 1000) / 100;
	seg7_3 = ((num % 1000) % 100) / 10;
	seg7_4 = (((num % 1000) % 100) % 10);
	
	SEG7_set(3 , szMap[seg7_1]);
	SEG7_set(2 , szMap[seg7_2]);
	SEG7_set(1 , szMap[seg7_3]);
	
	SEG7_set(0 , szMap[seg7_4]);
}

void SEG7_set(int index, alt_u32 seg_mask){
	alt_u32 value;
	value = IORD(PIO_SEG7_BASE, 0);
	seg_mask ^= 0xff;
	seg_mask <<= 8 * index;
	value &= seg7_mask[index];
	value |= seg_mask;
	IOWR(PIO_SEG7_BASE, 0, value);
}

int SW_get(){
	return IORD(PIO_SW_BASE, 0) & 0x000003ff;
}

void LED_light(alt_u16 led_pattern){
	IOWR(PIO_LED_BASE, 0, led_pattern); // write LEDs
}

int Btn_get(){
	return IORD(PIO_BTN0_BASE, 0);
}
