//
//  Currency.swift
//  CrytoWalletValidator
//
//  Created by Suryani Chang on 14/12/2017.
//

import Foundation

struct Currency {
    let name:String
    let symbol:String
}

extension Currency {
    var addressTypes:[String: [String]] {
        
        if symbol == "btc" || name == "bitcoin" {
            return ["prod": ["00", "05"], "test