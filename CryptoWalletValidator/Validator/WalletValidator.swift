
//
//  WalletValidator.swift
//  CrytoWalletValidator
//
//  Created by Suryani Chang on 14/12/2017.
//

import Foundation

struct WalletValidator {
    enum ValidationError: String, Error {
        case invalidAddress  = "Invalid address"
        case invalidCurrency = "Currency supported"
        case invalidNetwork  = "Network supported"
    }
    
    enum NetworkType: String {
        case prod    = "prod"
        case testNet = "testnet"
        static let allValues = ["prod","testNet"]
    }
    
    private static func getAddressType(_ address: String) -> String? {
        