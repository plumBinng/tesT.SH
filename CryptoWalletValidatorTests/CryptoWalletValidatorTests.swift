
//
//  CrytoWalletValidatorTests.swift
//  CrytoWalletValidatorTests
//
//  Created by Suryani Chang on 14/12/2017.
//

import XCTest
@testable import CryptoWalletValidator

class CrytoWalletValidatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testValidBTCAddress() {
        let testAddress = "1JEiV9CiJmhfYhE7MzeSdmH82xRYrbYrtb"
        do {
            try  WalletValidator.validate(address: testAddress, currencyNameOrSymbol: "btc", networkType: .prod)
        } catch  {
            XCTFail("Failed to validate BTC address")
        }
    }
    
    func testInvalidBTCAddress() {