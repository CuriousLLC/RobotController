//
//  NetworkConfig.swift
//  RobotController
//
//  Created by ryan day on 11/24/15.
//  Copyright © 2015 Curious. All rights reserved.
//

import Foundation

class Robot {
    var leftServo = 20;
    var rightServo = 23;
    let client: UDPClient = UDPClient(addr: "", port: 0);

    var robotIp: String {
        get {
            return client.addr
        }
        
        set(newAddr) {
            client.addr = newAddr
        }
    }

    var robotPort: Int {
        get {
            return client.port
        }

        set(newPort) {
            client.port = newPort
        }
    }

    init() {
        // Or some way to get stored defaults
        Swift.print("Robot init")
        client.addr = "192.168.4.1"
        client.port = 31337
        Swift.print("Default settings added")
    }

    func send_datagram(data:[UInt8]) {
        client.send(data: data)
    }
}