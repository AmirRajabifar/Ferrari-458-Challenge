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
Sheet 4 4
Title "Under Voltage Control"
Date "2017-12-15"
Rev "V1.0"
Comp "Amir Rajabifar"
Comment1 "Ferrari 458 Challenge"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R2
U 1 1 5A34D119
P 4775 2475
F 0 "R2" V 4855 2475 50  0000 C CNN
F 1 "1M" V 4775 2475 50  0000 C CNN
F 2 "" V 4705 2475 50  0000 C CNN
F 3 "" H 4775 2475 50  0000 C CNN
	1    4775 2475
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 5A34D120
P 5225 2475
F 0 "R4" V 5305 2475 50  0000 C CNN
F 1 "100K" V 5225 2475 50  0000 C CNN
F 2 "" V 5155 2475 50  0000 C CNN
F 3 "" H 5225 2475 50  0000 C CNN
	1    5225 2475
	0    1    1    0   
$EndComp
$Comp
L CP C4
U 1 1 5A34D127
P 5225 2725
F 0 "C4" H 5250 2825 50  0000 L CNN
F 1 "CP" H 5250 2625 50  0000 L CNN
F 2 "" H 5263 2575 50  0000 C CNN
F 3 "" H 5225 2725 50  0000 C CNN
	1    5225 2725
	0    1    1    0   
$EndComp
$Comp
L GND #PWR8
U 1 1 5A34D12E
P 4525 2850
F 0 "#PWR8" H 4525 2600 50  0001 C CNN
F 1 "GND" H 4525 2700 50  0000 C CNN
F 2 "" H 4525 2850 50  0000 C CNN
F 3 "" H 4525 2850 50  0000 C CNN
	1    4525 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4475 2475 4625 2475
Wire Wire Line
	4925 2475 5075 2475
Wire Wire Line
	5375 2475 5575 2475
Wire Wire Line
	5375 2725 5475 2725
Wire Wire Line
	5475 2725 5475 2475
Connection ~ 5475 2475
Wire Wire Line
	5075 2725 4975 2725
Wire Wire Line
	4975 2475 4975 2875
Connection ~ 4975 2475
Connection ~ 4975 2725
$Comp
L Q_NMOS_DGS Q1
U 1 1 5A34D14C
P 5925 3825
F 0 "Q1" H 6225 3875 50  0000 R CNN
F 1 "FQP48P06" H 6475 3775 50  0000 R CNN
F 2 "" H 6125 3925 50  0000 C CNN
F 3 "" H 5925 3825 50  0000 C CNN
	1    5925 3825
	1    0    0    1   
$EndComp
Wire Wire Line
	4525 2575 4525 2850
Wire Wire Line
	4525 2575 4475 2575
Connection ~ 4575 2475
Wire Wire Line
	4575 2475 4575 2675
Wire Wire Line
	4575 2675 4675 2675
Wire Wire Line
	4675 2675 4675 3225
Wire Wire Line
	4675 3225 6025 3225
$Comp
L R R1
U 1 1 5A34D15A
P 4575 4075
F 0 "R1" V 4655 4075 50  0000 C CNN
F 1 "1K" V 4575 4075 50  0000 C CNN
F 2 "" V 4505 4075 50  0000 C CNN
F 3 "" H 4575 4075 50  0000 C CNN
	1    4575 4075
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5A34D161
P 5075 3625
F 0 "R3" V 5155 3625 50  0000 C CNN
F 1 "1K" V 5075 3625 50  0000 C CNN
F 2 "" V 5005 3625 50  0000 C CNN
F 3 "" H 5075 3625 50  0000 C CNN
	1    5075 3625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6025 3225 6025 3625
Wire Wire Line
	6025 3375 5075 3375
Wire Wire Line
	5075 3375 5075 3475
Connection ~ 6025 3375
Wire Wire Line
	5075 3775 5075 3875
Wire Wire Line
	5725 3825 5075 3825
Connection ~ 5075 3825
Wire Wire Line
	4775 4075 4725 4075
Wire Wire Line
	4425 4075 4275 4075
$Comp
L D D5
U 1 1 5A34D172
P 6425 4375
F 0 "D5" H 6425 4475 50  0000 C CNN
F 1 "D" H 6425 4275 50  0000 C CNN
F 2 "" H 6425 4375 50  0000 C CNN
F 3 "" H 6425 4375 50  0000 C CNN
	1    6425 4375
	0    1    1    0   
$EndComp
Wire Wire Line
	6025 4025 6025 4325
Wire Wire Line
	6025 4225 6425 4225
Connection ~ 6025 4225
Wire Wire Line
	5075 4275 5075 4625
Wire Wire Line
	6425 4525 6425 4675
Wire Wire Line
	6025 4425 6025 4625
Wire Wire Line
	6025 4625 6425 4625
Connection ~ 6425 4625
Text HLabel 4475 2475 0    60   Input ~ 0
BAT_IN+
Text HLabel 4475 2575 0    60   Input ~ 0
BAT_IN-
Text Label 4425 2825 2    60   ~ 0
GND
Wire Wire Line
	4425 2825 4525 2825
Connection ~ 4525 2825
Text Label 5575 2475 0    60   ~ 0
GND
Text Label 5075 4625 3    60   ~ 0
GND
Text Label 6425 4675 3    60   ~ 0
GND
Text HLabel 6025 4325 0    60   Input ~ 0
BAT_OUT+
Text HLabel 6025 4425 0    60   Input ~ 0
BAT_OUT-
Text HLabel 4275 4075 0    60   Input ~ 0
CTRL
Text HLabel 4975 2875 3    60   Input ~ 0
VOLT
$Comp
L 2N3904 Q2
U 1 1 5A33FE0E
P 4975 4075
F 0 "Q2" H 5175 4150 50  0000 L CNN
F 1 "2N3904" H 5175 4075 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow" H 5175 4000 50  0001 L CIN
F 3 "" H 4975 4075 50  0001 L CNN
	1    4975 4075
	1    0    0    -1  
$EndComp
$EndSCHEMATC
