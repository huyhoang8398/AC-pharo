---
title:
- Live Programming IoT devices with PharoThings
author: 
- Do Hoang
date: \today{}
institute: 
- University of Science And Technology of Hanoi
theme:
- CambridgeUS
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

