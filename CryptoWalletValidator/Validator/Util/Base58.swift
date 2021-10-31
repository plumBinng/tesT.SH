//
//  Base58.swift
//
//  Created by Luís Silva on 11/09/17.
//  Copyright © 2017 drei. All rights reserved.
//

import Foundation

struct Base58 {
    static let base58Alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    
    // Encode
    static func base58FromBytes