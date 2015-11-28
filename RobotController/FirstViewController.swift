//
//  FirstViewController.swift
//  RobotController
//
//  Created by ryan day on 11/24/15.
//  Copyright © 2015 Curious. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var robot: Robot?

    @IBOutlet weak var leftButton: UIButton?
    @IBOutlet weak var rightButton: UIButton?
    @IBOutlet weak var forwardButton: UIButton?
    @IBOutlet weak var backButton: UIButton?

    @IBAction func pressForward(sender: UIButton) {
        Swift.print("Go forward")
        let msg = RotateServoTypeMessage(mask: 1, pulseWidth: 2000)
        robot?.send_datagram(msg.serialize())
    }

    @IBAction func pressBackward(sender: UIButton) {
        Swift.print("Go backward")
        let msg = RotateServoTypeMessage(mask: 1, pulseWidth: 1000)
        robot?.send_datagram(msg.serialize())
    }

    @IBAction func pressRight(sender: UIButton) {
        Swift.print("Go right")
        let msg = RotateServoMessage(gpio: (robot?.leftServo)!, pulseWidth: 2000)
        robot?.send_datagram(msg.serialize())
    }

    @IBAction func pressLeft(sender: UIButton) {
        Swift.print("Go left")
        let msg = RotateServoMessage(gpio: (robot?.rightServo)!, pulseWidth: 2000)
        robot?.send_datagram(msg.serialize())
    }

    @IBAction func releaseButton(sender: UIButton) {
        Swift.print("Stop")
        let msg = RotateServoTypeMessage(mask: 1, pulseWidth: 1500)
        robot?.send_datagram(msg.serialize())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        robot = appDelegate.robot
        Swift.print("Sending config datagrams")
        //robot?.send_datagram([0xf0, 0x03, 0x01, 0x81, 0x17, 0xf1])
        //robot?.send_datagram([0xf0, 0x03, 0x01, 0x01, 0x14, 0xf1])
        Swift.print("Done sending config")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

