# Lesson 2 - Blinking LED
### Components
* 1 Rasberry Pi
* Bread-board
* 1 LED
* 1 Resistor (330 ohms)
* Jumper wires

### Experimental procedure

![Physical connection LED](/Users/huyhoang8398/AC-pharo/course/figures/pharothings-raspberry-led-resistor-lesson-01.png){ width=28% }

\
* Using the same setup as the last section

## Experimental code
### Connecting remotely
* Run this code in Playground:

```
remotePharo := TlpRemoteIDE connectTo: (TCPAddress ip: 
	#[193 51 236 212] port: 40423)
GTInspector enableStepRefresh.

remoteBoard := remotePharo evaluate: 
	[ RpiBoard3B current].

remoteBoard inspect.
```
$\Longrightarrow$ Make a new connection to your Rpi and Open the *Remote Playground*

## Experimental code
* We still assigned the LED pin to GPIO7 pin:
\
```
led := gpio7.
led beDigitalOutput.
```
* To blink the LED, we create a loop to change the value of LED by time.
* We use the method *toggleDigitalValue* as previously
* For example we blink the LED every 1 second by 10 times
```
[ 10 timesRepeat: [
  led toggleDigitalValue.
  (Delay forSeconds: 1) wait
] ] forkNamed: 'BlinkerProcess'.
```
$\Longrightarrow$ Your LED is blinking now!

# Lesson 3 - Introduce to Pharo object-oriented
## Reference site for learning
http://mooc.pharo.org/

## Blinking LED using OOP
### Experimental code
```
|blinker|
blinker := Blinker new.
blinker timesRepeat: 10 waitForSeconds: 1.
```

### Experimental code
* We declare the variable *blinker* in the first line.
* We will use this variable to create an object using the Blinker class.
* In the second line, we instantiate the Blinker class in the *blinker* variable
* In the third line, we send some messages to the blinker object to controll the times.
$\Longrightarrow$ This will make the GPIO behave according to the parameters

### Create your own class remotely
* To create a class, we need first to create a package.
* In your local playground, call the Remote System Browser of your Raspberry Pi
```
remotePharo := TlpRemoteIDE connectTo: (TCPAddress ip: 
	#[193 51 236 212] port: 40423).
remotePharo openBrowser.
```

### Create a package
* Using the Remote Browser to create.
* *Right-click* the package area and enter the package name.
* For example, we create a package named *PharoThings-Lessons*

### Create a class
* Edit the default class template by changing the *#NameOfSublass* to the name of new class
* For example, let's create the class *#Blinker*
* The class name begin with hash symbol (\#) and a calpital leter.
```
Object subclass: #Blinker
instaceVariableNames: 'led'
classVariableNames: ''
package: 'PharoThings-Lessons'
```
* Right click on the code and select *Accept* option.
$\Longrightarrow$ The class is compiled and added to the system.

### Create a protocol
* The 






