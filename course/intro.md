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
- dove 
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
* The board inspector shows a layout of pins similar to Raspberry Pi docs. But here it is a live tool which represents the current pins state.
* The evaluation pane in the bottom of the inspector provides bindings to gpio pins which you can script by #doIt/printIt commands
