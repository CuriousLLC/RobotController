//
//  SecondViewController.swift
//  RobotController
//
//  Created by ryan day on 11/24/15.
//  Copyright © 2015 Curious. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var robot: Robot?
    @IBOutlet weak var robotIp: UITextField?
    @IBOutlet weak var robotPort: UITextField!
    @IBOutlet weak var leftGpio: UITextField!
    @IBOutlet weak var rightGpio: UITextField!

    @IBAction func resetConfiguration(sender: UIButton) {
        Swift.print("Reset robot configuration")
        let port:Int? = Int(robotPort.text!)
        let left:UInt8? = UInt8(leftGpio.text!)
        let right:UInt8? = UInt8(rightGpio.text!)

        robot!.robotIp = robotIp!.text!
        robot!.robotPort = port!
        robot!.leftServo = left!
        robot!.rightServo = right!
        robot!.send_config()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        robot = appDelegate.robot
        robotIp!.text = robot!.robotIp
        robotPort!.text = String(robot!.robotPort)
        leftGpio!.text = String(robot!.leftServo)
        rightGpio!.text = String(robot!.rightServo)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

