---
title:
- Live Programming IoT devices with PharoThings
author: 
- Do Hoang
date: \today{}
institute: 
- University of Science And Technology of Hanoi
theme:
- Ilmenau
colortheme:
- seagull 
#logo: '`/Users/huyhoang8398/AC-pharo/course/figures/logousth.png`{=latex}'
toc: 
- true
---

#  Objective
## Objective 

* Run Pharo IoT in a Raspberry Pi that has Raspbian already installed.
* Install Pharo IoT and Raspbian from scratch in headless mode (without keyboard/mouse/screen);
* Run and use Pharo IoT IDE on your Linux, Windows or Mac OSX com- puter.


# Installation 

## Install in a Raspberry that has Raspbian 

* If you already have Raspbian running on your Raspberry Pi, you can simply use the Pharo IoT zero-conf. 
* Open a terminal window in your Rpi ( local or remote SSH )

## Install in a Raspberry that has Raspbian 
* Enter: 
```bash
    wget -O - get.pharo/server | bash
```
* => You will download the server side and extract the files to the pharoiot-server folder

## Install in a Raspberry that has Raspbian 

* Goto the folder and run pharo server 

```bash
    cd pharoiot-server
    ./pharo-server
```
* If everything is alright, you will see this message: `‘a TlpRemoteUIManager is registered on port 40423’`.
  * This means that you have TelePharo running on your Raspberry on TCP port 40423.
* Now you can use Pharo IoT on your computer to connect to your Raspberry and create IoT applications remotely.

## Install Raspbian and Pharo IoT from scratch (Raspberry Pi Headless Setup)

* There are many options to install Raspbian on your Raspberry. The most common way is to download the ISO image from the official Raspberry website and follow the steps to install it.
  * Basically, they are: copy an ISO image to an SD card, insert it in Raspberry Pi, turn On the Rasp and use a `keyboard/mouse/screen` to use it as a normal computer.
* But we will not use `keyboard/mouse/screen` to install Raspbian and run Pharo IoT! We do not need them.

## Install Raspbian and Pharo IoT from scratch (Raspberry Pi Headless Setup)

* We will use a third-party program to perform these tasks automatically:
  * Install Raspbian Full OS
  * Setting the Raspberry Pi hostname
  * Set boot to console
  * Enable the I2C and SPI modules
  * Connect it in your WiFi network
  * Download Pharo IoT (requires Rasberry Pi connected on the internet)
  * and start the Pharo IoT server at every boot

## Pibakery
* Download the Pibakery.
* Download the configuration file.
```
    http://get.pharoiot.org/pibakeryPharoIoT.xml
```
* Write to your Rpi SD card.

## Pibakery
![Configuration](/Users/huyhoang8398/AC-pharo/course/figures/pharothings-pharoiot-pibackery-raspberry-headless.png){ width=90% }

## Pibakery
* Change your hostname and WiFi configuration in PiBakery;
\

* Insert the SD card into your machine, click Write and select the Opera- tion System Raspbian Full;
\

* After the process, insert the SD in the Raspberry and wait about 3 minutes to complete the automatic configuration. Time depends on the speed of your internet;
\

* You can now find your Raspberry by the Hostname you defined above.
\

* You do not need to do anything else on your Raspberry Pi. It is already loaded with Pharo IoT starting at every boot on the TCP port 40423

## Run Pharo IoT IDE on your Linux, Windows or Mac OSX computer

**Download** Pharo from
```
    get.pharoiot.com/multi.zip
```

## Run Pharo IoT IDE on your Linux, Windows or Mac OSX computer

![Pharo IDE](/Users/huyhoang8398/AC-pharo/course/figures/pharo-ui.png){ width=60% }

# Get Started
## Connecting from your computer to Raspberry Pi

### Connecting in Pharo IoT server by Hostname
```
ip := NetNameResolver addressForName: 'pharoiot-01'.

remotePharo := TlpRemoteIDE connectTo: 
    (TCPAddress ip: ip port:40423).
```

### Connecting in Pharo IoT server by IP
```
remotePharo := TlpRemoteIDE connectTo: 
    (TCPAddress ip: #[192 168 1 200] port: 40423).
```

## Working remotely
* If you don’t receive any error, this means that you are connected.
* Now you can call the Remote Playground, Remote System Browser, and Remote Process Browser.

### Remote control 
```
remotePharo openPlayground.
remotePharo openBrowser.
remotePharo openProcessBrowser.
```


## Inspect the remote Raspberry Pi GPIO board
* You can inspect the physical board of your Raspberry Pi. 
* For Raspberry, it will be one of the RpiBoard subclasses. Currently, you can use the following classes according to the models:
  * RpiBoardBRev1: Raspberry Pi Model B Revision 1
  * RpiBoardBRev2: Raspberry Pi Model B Revision 2
  * RpiBoard3B: Raspberry Pi Model B+, Pi2 Model B, Pi3 Model B, Pi3 Model B+

### With the chosen class evaluate the following code to open an inspector:
```
remoteBoard := remotePharo evaluate: [ 
    RpiBoard3B current].

remoteBoard inspect.
```

## Remote GPIO inspector

![Remote GPIO inspector](/Users/huyhoang8398/AC-pharo/course/figures/PharoThingsInspector.png){ width=50% }

## GPIOs
* A live tool which represents the current pins state.
* The evaluation pane in the bottom of the inspector provides bindings to gpio pins which you can script by #doIt/printIt commands
* Digital pins are shown with green/red icons which represent high/low (1/0) values.
* Able to togge the value. 

### Saving the remote image
`remotePharo saveImage.`

### Disconnect all remote sessions
`TlpRemoteIDE disconnectAll.`

# Day 1 
## Lesson 1 – Turning LED on/off
### Components 
* 1 Raspberry Pi connected to your network (wired or wireless) 
* 1 Breadboard
* 1 LED
* 1 Resistor (330 ohms)
* Jumper wires

## Experimental procedure

![Physical connection LED](/Users/huyhoang8398/AC-pharo/course/figures/pharothings-raspberry-led-resistor-lesson-01.png){ width=28% }

\
* The circuit consists of an LED that lights up when power is applied, a resistor to limit current and a power supply (the Rasp).

## Physical connection LED detail
* Connect the Ground PIN from Raspberry in the breadboard blue rail (-). Raspeberry Pi models with 40 pins has 8 GPIO ground pins. You can connect with anyone. In this experiment we will use the PIN6 (Ground);
* Then connect the resistor from the blue rail on the breadboard (-) to a column on the breadboard
* Now push the LED legs into the breadboard, with the long leg (with the kink) on the right;
* And insert a jumper wire connecting the rigth column and the PIN7 (GPIO7). 

## Experimental code
### Connecting remotely
* Run this code in Playground:

```
remotePharo := TlpRemoteIDE connectTo: (TCPAddress ip: 
    #[193 51 236 167] port: 40423)
GTInspector enableStepRefresh

remoteBoard := remotePharo evaluate: [ RpiBoard3B 
    current].

remoteBoard inspect.
```
$\Longrightarrow$ Make a new connection to your Rpi and Open the *Remote Playground*

## Experimental code 
* To control the LED we first introduce the named variable #led which we as- signed to GPIO7 pin instance:
\
```
led := gpio7.
```
* Then we configure the pin to be in digital output mode and set the value:
```
led beDigitalOutput.
led value: 1.
```
$\Longrightarrow$ It turns the LED on.

## Experimental code 
* You can **notice** that gpio variables are not just numbers/ids.
* They are real **objects** with behaviour.
* For example you can ask pin to toggle a value:
```
led toggleDigitalValue.
```
* Or ask a pin for current value if you want to check it:
```
led value.
```

## Result
![Remote Board Inspector](/Users/huyhoang8398/AC-pharo/course/figures/pharothings-inspector-remote-board-raspberry.png){ width=44% }

