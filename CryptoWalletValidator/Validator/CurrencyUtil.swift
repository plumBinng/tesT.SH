//
//  CurrencyUtil.swift
//  CrytoWalletValidator
//
//  Created by Suryani Chang on 14/12/2017.
//

import Foundation

public struct CurrencyUtil {
    static var supportedCurrencies: [String:String] = ["bitcoin":"btc","litecoin":"ltc"]
    private var currencies:[Currency] = []
    
    init() {
        for currencySymbol in Cu