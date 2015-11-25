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
    @IBOutlet weak var robotPort: UITextField?
    @IBOutlet weak var leftGpio: UITextField?
    @IBOutlet weak var rightGpio: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        robot = appDelegate.robot
        robotIp!.text = robot?.robotIp
        robotPort!.text = String(robot?.robotPort)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

