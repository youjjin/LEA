/* Copyright 2019 SiFive, Inc */
/* SPDX-License-Identifier: Apache-2.0 */
#include "LEA.h"
#include "util.h"
#include <stdio.h>
#include <metal/cpu.h>
#include <metal/led.h>
#include <metal/button.h>
#include <metal/switch.h>

extern void LEA128_ENC(unsigned char* plaintext, unsigned char* cipehrtext);
extern void LEA192_ENC(unsigned char* plaintext, unsigned char* cipehrtext);
extern void LEA256_ENC(unsigned char* plaintext, unsigned char* cipehrtext);

#define RTC_FREQ    32768

struct metal_cpu *cpu;
struct metal_interrupt *cpu_intr, *tmr_intr;
int tmr_id;
volatile uint32_t timer_isr_flag;

void display_banner (void) {

    printf("\n");
    printf("\n");
    printf("                  SIFIVE, INC.\n");
    printf("\n");
    printf("           5555555555555555555555555\n");
    printf("          5555                   5555\n");
    printf("         5555                     5555\n");
    printf("        5555                       5555\n");
    printf("       5555       5555555555555555555555\n");
    printf("      5555       555555555555555555555555\n");
    printf("     5555                             5555\n");
    printf("    5555                               5555\n");
    printf("   5555                                 5555\n");
    printf("  5555555555555555555555555555          55555\n");
    printf("   55555           555555555           55555\n");
    printf("     55555           55555           55555\n");
    printf("       55555           5           55555\n");
    printf("         55555                   55555\n");
    printf("           55555               55555\n");
    printf("             55555           55555\n");
    printf("               55555       55555\n");
    printf("                 55555   55555\n");
    printf("                   555555555\n");
    printf("                     55555\n");
    printf("                       5\n");
    printf("\n");

    printf("\n");
    printf("               Welcome to SiFive!\n");

}

void timer_isr (int id, void *data) {

    // Disable Timer interrupt
    metal_interrupt_disable(tmr_intr, tmr_id);

    // Flag showing we hit timer isr
    timer_isr_flag = 1;
}

void wait_for_timer(struct metal_led *which_led) {

    // clear global timer isr flag
    timer_isr_flag = 0;

    // Turn on desired LED
    metal_led_on(which_led);

    // Set timer
    metal_cpu_set_mtimecmp(cpu, metal_cpu_get_mtime(cpu) + RTC_FREQ);

    // Enable Timer interrupt
    metal_interrupt_enable(tmr_intr, tmr_id);

    // wait till timer triggers and isr is hit
    while (timer_isr_flag == 0){};

    timer_isr_flag = 0;

    // Turn off this LED
    metal_led_off(which_led);
}

int main (void)
{
    int rc;
    struct metal_led *led0_red, *led0_green, *led0_blue;

    // This demo will toggle LEDs colors so we define them here
    led0_red = metal_led_get_rgb("LD0", "red");
    led0_green = metal_led_get_rgb("LD0", "green");
    led0_blue = metal_led_get_rgb("LD0", "blue");
    if ((led0_red == NULL) || (led0_green == NULL) || (led0_blue == NULL)) {
        printf("At least one of LEDs is null.\n");
        return 1;
    }

    // Enable each LED
    metal_led_enable(led0_red);
    metal_led_enable(led0_green);
    metal_led_enable(led0_blue);

    // All Off
    metal_led_off(led0_red);
    metal_led_off(led0_green);
    metal_led_off(led0_blue);

    // Lets get the CPU and and its interrupt
    cpu = metal_cpu_get(metal_cpu_get_current_hartid());
    if (cpu == NULL) {
        printf("CPU null.\n");
        return 2;
    }

    cpu_intr = metal_cpu_interrupt_controller(cpu);

    if (cpu_intr == NULL) {
        printf("CPU interrupt controller is null.\n");
        return 3;
    }

    metal_interrupt_init(cpu_intr);

    // display welcome banner
    display_banner();
    ////////////////////////////////////////////////////////////////

    unsigned char plaintext[16] = {0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f};

    unsigned char ciphertext[16] = {0x00, };



	int loop_count = 1000;
	int cnt_i = 0x00;
	unsigned long long oldcount = getcycles();

	for(cnt_i = 0 ; cnt_i <loop_count ; cnt_i ++)
	{
	    LEA256_ENC(plaintext, ciphertext);
	}
	unsigned long long cyclecount = getcycles();
	printf("LEA256cyc: %d\n", (unsigned int)((cyclecount-oldcount)/loop_count));



    //////////////////////////////////////////////////////////////////


    // Setup Timer and its interrupt so we can toggle LEDs on 1s cadence
    tmr_intr = metal_cpu_timer_interrupt_controller(cpu);
    if (tmr_intr == NULL) {
        printf("TIMER interrupt controller is  null.\n");
        return 4;
    }
    metal_interrupt_init(tmr_intr);
    tmr_id = metal_cpu_timer_get_interrupt_id(cpu);
    rc = metal_interrupt_register_handler(tmr_intr, tmr_id, timer_isr, cpu);
    if (rc < 0) {
        printf("TIMER interrupt handler registration failed\n");
        return (rc * -1);
    }

    // Lastly CPU interrupt
    if (metal_interrupt_enable(cpu_intr, 0) == -1) {
        printf("CPU interrupt enable failed\n");
        return 6;
    }

    // Red -> Green -> Blue, repeat
    while (1) {

        // Turn on RED
        wait_for_timer(led0_red);

        // Turn on Green
        wait_for_timer(led0_green);

        // Turn on Blue
        wait_for_timer(led0_blue);
    }

    // return
    return 0;
}
