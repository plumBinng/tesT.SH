
//
//  ViewController.swift
//  CrytoWalletValidator
//
//  Created by Suryani Chang on 14/12/2017.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var addressField: HoshiTextField!
    @IBOutlet weak var networkField: HoshiTextField!
    @IBOutlet weak var cryptoField: HoshiTextField!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var holderView: UIView!
    
    let pickerView = UIPickerView()
    
    //Set data source
    let networkDatasource: [String] =  WalletValidator.NetworkType.allValues
    let currencyDatasource: [String] = CurrencyUtil.supportedCurrencies.keys.map{ $0 }

    private var selectedField: HoshiTextField?=nil
    private var alertViewResponder: SCLAlertViewResponder?=nil