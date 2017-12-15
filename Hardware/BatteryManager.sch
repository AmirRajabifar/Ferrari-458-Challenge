EESchema Schematic File Version 2
LIBS:RC_Car_Manager-rescue
LIBS:arduino
LIBS:RC_CAR
LIBS:74xgxx
LIBS:74xx
LIBS:ac-dc
LIBS:actel
LIBS:adc-dac
LIBS:Altera
LIBS:analog_devices
LIBS:analog_switches
LIBS:atmel
LIBS:audio
LIBS:battery_management
LIBS:bbd
LIBS:Bosch
LIBS:brooktre
LIBS:cmos_ieee
LIBS:cmos4000
LIBS:conn
LIBS:Connector
LIBS:contrib
LIBS:cypress
LIBS:dc-dc
LIBS:Decawave
LIBS:device
LIBS:digital-audio
LIBS:diode
LIBS:display
LIBS:driver_gate
LIBS:dsp
LIBS:DSP_Microchip_DSPIC33
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:Espressif
LIBS:FPGA_Actel
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:infineon
LIBS:intel
LIBS:interface
LIBS:intersil
LIBS:ir
LIBS:Lattice
LIBS:LED
LIBS:LEM
LIBS:linear
LIBS:Logic_74xgxx
LIBS:Logic_74xx
LIBS:Logic_CMOS_4000
LIBS:Logic_CMOS_IEEE
LIBS:logic_programmable
LIBS:Logic_TTL_IEEE
LIBS:logo
LIBS:maxim
LIBS:MCU_Microchip_PIC10
LIBS:MCU_Microchip_PIC12
LIBS:MCU_Microchip_PIC16
LIBS:MCU_Microchip_PIC18
LIBS:MCU_Microchip_PIC24
LIBS:MCU_Microchip_PIC32
LIBS:MCU_NXP_Kinetis
LIBS:MCU_NXP_LPC
LIBS:MCU_NXP_S08
LIBS:MCU_Parallax
LIBS:MCU_ST_STM8
LIBS:MCU_ST_STM32
LIBS:MCU_Texas_MSP430
LIBS:Mechanical
LIBS:memory
LIBS:microchip
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:microcontrollers
LIBS:modules
LIBS:Motor
LIBS:motor_drivers
LIBS:motorola
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:opto
LIBS:Oscillators
LIBS:philips
LIBS:power
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:regul
LIBS:Relay
LIBS:relays
LIBS:RF_Bluetooth
LIBS:rfcom
LIBS:RFSolutions
LIBS:Sensor_Current
LIBS:Sensor_Humidity
LIBS:sensors
LIBS:silabs
LIBS:siliconi
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:Switch
LIBS:switches
LIBS:texas
LIBS:transf
LIBS:Transformer
LIBS:Transistor
LIBS:transistors
LIBS:triac_thyristor
LIBS:ttl_ieee
LIBS:Valve
LIBS:valves
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:xilinx
LIBS:zetex
LIBS:Zilog
LIBS:RC_Car_Manager-cache
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
L Battery-RESCUE-RC_Car_Manager BT1
U 1 1 5A33DBF2
P 2250 2400
AR Path="/5A33DBF2" Ref="BT1"  Part="1" 
AR Path="/5A340F55/5A341C31/5A33DBF2" Ref="BT1"  Part="1" 
F 0 "BT1" H 2350 2450 50  0000 L CNN
F 1 "1.2V" H 2350 2350 50  0000 L CNN
F 2 "" V 2250 2440 50  0000 C CNN
F 3 "" V 2250 2440 50  0000 C CNN
	1    2250 2400
	1    0    0    -1  
$EndComp
$Comp
L Battery-RESCUE-RC_Car_Manager BT3
U 1 1 5A33DC6B
P 2250 3850
AR Path="/5A33DC6B" Ref="BT3"  Part="1" 
AR Path="/5A340F55/5A341C31/5A33DC6B" Ref="BT3"  Part="1" 
F 0 "BT3" H 2350 3900 50  0000 L CNN
F 1 "1.2V" H 2350 3800 50  0000 L CNN
F 2 "" V 2250 3890 50  0000 C CNN
F 3 "" V 2250 3890 50  0000 C CNN
	1    2250 3850
	1    0    0    -1  
$EndComp
$Comp
L Battery-RESCUE-RC_Car_Manager BT2
U 1 1 5A33DCE7
P 2250 3150
AR Path="/5A33DCE7" Ref="BT2"  Part="1" 
AR Path="/5A340F55/5A341C31/5A33DCE7" Ref="BT2"  Part="1" 
F 0 "BT2" H 2350 3200 50  0000 L CNN
F 1 "1.2V" H 2350 3100 50  0000 L CNN
F 2 "" V 2250 3190 50  0000 C CNN
F 3 "" V 2250 3190 50  0000 C CNN
	1    2250 3150
	1    0    0    -1  
$EndComp
$Comp
L Battery-RESCUE-RC_Car_Manager BT4
U 1 1 5A33DD10
P 2250 4600
AR Path="/5A33DD10" Ref="BT4"  Part="1" 
AR Path="/5A340F55/5A341C31/5A33DD10" Ref="BT4"  Part="1" 
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
