//
//  Message.swift
//  RobotController
//
//  Created by ryan day on 11/26/15.
//  Copyright © 2015 Curious. All rights reserved.
//

import Foundation

enum MessageTyoe {
    case AddServo, RotateType, RotateServo, ClearServo
}

class Message {
    let SOM:UInt8 = 0xf0
    let EOM:UInt8 = 0xf1

    func serialize() -> [UInt8] {
        return []
    }
}

class AddServoMessage : Message {
    let mesageType:UInt8 = 1
    let size:UInt8 = 2
    var _servoType: UInt8
    var _gpio: UInt8

    init(gpio: UInt8, servoType: UInt8) {
        _servoType = servoType
        _gpio = gpio
    }

    func setInverse() {
        _servoType |= 0x80
    }

    override func serialize() -> [UInt8]{
        return [SOM, size, _servoType, _gpio, EOM]
    }
}

class RotateServoTypeMessage : Message {
    let mesageType:UInt8 = 2
    let size:UInt8 = 4
    var _mask: UInt8
    var _pulseWidth: UInt16
    
    init(mask: UInt8, pulseWidth: UInt16) {
        _mask = mask
        _pulseWidth = pulseWidth
    }
    
    override func serialize() -> [UInt8]{
        return [SOM, size, _mask, UInt8(_pulseWidth >> 8), UInt8(_pulseWidth & 0xff), EOM]
    }
}

class RotateServoMessage : Message {
    let mesageType:UInt8 = 3
    let size:UInt8 = 4
    var gpio: UInt8
    var pulseWidth: UInt16
    
    init(_gpio: UInt8, _pulseWidth: UInt16) {
        gpio = _gpio
        pulseWidth = _pulseWidth
    }
    
    override func serialize() -> [UInt8]{
        return [SOM, size, gpio, UInt8(pulseWidth >> 8), UInt8(pulseWidth), EOM]
    }
}