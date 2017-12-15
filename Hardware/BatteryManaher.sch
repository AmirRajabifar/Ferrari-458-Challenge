EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:arduino
LIBS:RC_Car_Manager-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "Battery Manager"
Date "2017-12-15"
Rev "V1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Battery BT?
U 1 1 5A33DBF2
P 2100 1900
F 0 "BT?" H 2200 1950 50  0000 L CNN
F 1 "1.2V" H 2200 1850 50  0000 L CNN
F 2 "" V 2100 1940 50  0000 C CNN
F 3 "" V 2100 1940 50  0000 C CNN
	1    2100 1900
	1    0    0    -1  
$EndComp
$Comp
L Battery BT?
U 1 1 5A33DC6B
P 2100 3350
F 0 "BT?" H 2200 3400 50  0000 L CNN
F 1 "1.2V" H 2200 3300 50  0000 L CNN
F 2 "" V 2100 3390 50  0000 C CNN
F 3 "" V 2100 3390 50  0000 C CNN
	1    2100 3350
	1    0    0    -1  
$EndComp
$Comp
L Battery BT?
U 1 1 5A33DCE7
P 2100 2650
F 0 "BT?" H 2200 2700 50  0000 L CNN
F 1 "1.2V" H 2200 2600 50  0000 L CNN
F 2 "" V 2100 2690 50  0000 C CNN
F 3 "" V 2100 2690 50  0000 C CNN
	1    2100 2650
	1    0    0    -1  
$EndComp
$Comp
L Battery BT?
U 1 1 5A33DD10
P 2100 4100
F 0 "BT?" H 2200 4150 50  0000 L CNN
F 1 "1.2V" H 2200 4050 50  0000 L CNN
F 2 "" V 2100 4140 50  0000 C CNN
F 3 "" V 2100 4140 50  0000 C CNN
	1    2100 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2050 2100 2500
Wire Wire Line
	2100 3500 2100 3950
Wire Wire Line
	2100 1750 2100 1500
Wire Wire Line
	2100 3200 2100 2950
Wire Wire Line
	2100 2800 2100 2950
Wire Wire Line
	2100 4250 2100 4400
Wire Wire Line
	2100 4400 2100 4550
Text HLabel 2100 1500 1    60   Input ~ 0
V_cc
Text HLabel 2100 4550 3    60   Input ~ 0
GND
$EndSCHEMATC
