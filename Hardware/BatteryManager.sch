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
LIBS:RC_CAR
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "Battery Manager"
Date "2017-12-15"
Rev "V1.0"
Comp "Amir Rajabifar"
Comment1 "Ferrari 458 Challenge"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Battery BT1
U 1 1 5A33DBF2
P 2250 2400
F 0 "BT1" H 2350 2450 50  0000 L CNN
F 1 "1.2V" H 2350 2350 50  0000 L CNN
F 2 "" V 2250 2440 50  0000 C CNN
F 3 "" V 2250 2440 50  0000 C CNN
	1    2250 2400
	1    0    0    -1  
$EndComp
$Comp
L Battery BT3
U 1 1 5A33DC6B
P 2250 3850
F 0 "BT3" H 2350 3900 50  0000 L CNN
F 1 "1.2V" H 2350 3800 50  0000 L CNN
F 2 "" V 2250 3890 50  0000 C CNN
F 3 "" V 2250 3890 50  0000 C CNN
	1    2250 3850
	1    0    0    -1  
$EndComp
$Comp
L Battery BT2
U 1 1 5A33DCE7
P 2250 3150
F 0 "BT2" H 2350 3200 50  0000 L CNN
F 1 "1.2V" H 2350 3100 50  0000 L CNN
F 2 "" V 2250 3190 50  0000 C CNN
F 3 "" V 2250 3190 50  0000 C CNN
	1    2250 3150
	1    0    0    -1  
$EndComp
$Comp
L Battery BT4
U 1 1 5A33DD10
P 2250 4600
F 0 "BT4" H 2350 4650 50  0000 L CNN
F 1 "1.2V" H 2350 4550 50  0000 L CNN
F 2 "" V 2250 4640 50  0000 C CNN
F 3 "" V 2250 4640 50  0000 C CNN
	1    2250 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2550 2250 3000
Wire Wire Line
	2250 4000 2250 4450
Wire Wire Line
	2250 2250 2250 2000
Wire Wire Line
	2250 3300 2250 3700
Wire Wire Line
	2250 4750 2250 5150
Text HLabel 2250 2000 1    60   Input ~ 0
V_cc
Text HLabel 2400 5050 2    60   Input ~ 0
GND
$Comp
L GND #PWR7
U 1 1 5A345614
P 2250 5150
F 0 "#PWR7" H 2250 4900 50  0001 C CNN
F 1 "GND" H 2250 5000 50  0000 C CNN
F 2 "" H 2250 5150 50  0000 C CNN
F 3 "" H 2250 5150 50  0000 C CNN
	1    2250 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5050 2250 5050
Connection ~ 2250 5050
$EndSCHEMATC
