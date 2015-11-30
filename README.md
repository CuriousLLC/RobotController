Robot Mobile Controller
========================

* iOS 8.3+

This Swift application allows a user to configure and send messages to the Curious Robot.

The user should connect to the Robot's Access Point. The default IP address is 192.168.1.4.
After configuring the left and right servo GPIOs, the user can move and turn the robot.

A message will be sent to the robot on an arrow touch. When the arrow is no longer touched,
a message will be sent to return the servos to their middle position.


* https://github.com/CuriousLLC/RobotWifi
* https://github.com/CuriousLLC/CuriousRobot
