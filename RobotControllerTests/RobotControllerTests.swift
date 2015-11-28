//
//  RobotControllerTests.swift
//  RobotControllerTests
//
//  Created by ryan day on 11/24/15.
//  Copyright © 2015 Curious. All rights reserved.
//

import XCTest
@testable import RobotController

class RobotControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddServoMessage() {
        let msg = AddServoMessage(gpio: 23, servoType: 1)
        
        XCTAssert(msg.serialize() == [0xf0, 0x03, 0x01, 0x01, 0x17, 0xf1])
        
        msg.setInverse()
        XCTAssert(msg.serialize() == [0xf0, 0x03, 0x01, 0x81, 0x17, 0xf1])
    }

    func testRotateServoTypeMessage() {
        let msg = RotateServoTypeMessage(mask: 0x01, pulseWidth: 2000)

        XCTAssert(msg.serialize() == [0xf0, 0x04, 0x02, 0x01, 0x07, 0xd0, 0xf1])
    }

    func testRotateServoMessage() {
        let msg = RotateServoMessage(gpio: 20, pulseWidth: 2000)
        
        Swift.print(msg.serialize())
        XCTAssert(msg.serialize() == [0xf0, 0x04, 0x03, 0x14, 0x07, 0xd0, 0xf1])
    }
    
    func testSendConfig() {
        let robot: Robot?

        robot = Robot()
        robot?.robotIp = "1.2.3.4"
        robot?.robotPort = Int(1234)
        robot?.leftServo = UInt8(20)
        robot?.rightServo = UInt8(10)
        robot?.send_config()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
