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
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let msg = AddServoMessage(gpio: 12, servoType: 1)
        
        XCTAssert(msg.serialize() == [0xf0, 0x02, 0x01, 0x0c, 0xf1])
        
        msg.setInverse()
        XCTAssert(msg.serialize() == [0xf0, 0x02, 0x81, 0x0c, 0xf1])
    }

    func testRotateServoMessage() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let msg = RotateServoTypeMessage(mask: 0x01, pulseWidth: 2000)

        XCTAssert(msg.serialize() == [0xf0, 0x04, 0x01, 0x07, 0xd0, 0xf1])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
