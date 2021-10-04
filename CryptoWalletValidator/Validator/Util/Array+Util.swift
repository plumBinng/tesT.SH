
//
//  Array+Util.swift
//
//  Created by Luís Silva on 26/09/17.
//  Copyright © 2017 drei. All rights reserved.
//

import Foundation

extension Array where Element == UInt8 {
    public var hexString: String {
        return self.map { return String(format: "%x", $0) }.joined()
    }
    
    public var hexStringWithPrefix: String {
        return "0x\(hexString)"
    }
    
    public var fullHexString: String {
        return self.map { return String(format: "%02x", $0) }.joined()
    }