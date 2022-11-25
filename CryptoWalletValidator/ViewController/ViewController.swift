
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.white
        validateButton.layer.cornerRadius = 10
        holderView.layer.cornerRadius = 10
        networkField.inputView = pickerView
        cryptoField.inputView = pickerView
        let toolBar = createToolbar()
        networkField.inputAccessoryView = toolBar
        cryptoField.inputAccessoryView = toolBar
        initiliaseData()
    }
    
    private func createToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColorFromRGB(0x3DAEE2)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.donePicker))
        doneButton.setTitleTextAttributes([ NSAttributedStringKey.font: UIFont(name: "Roboto-Medium", size: 17)!], for: UIControlState.normal)
        toolBar.tintColor = UIColor.white
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    
    @objc func donePicker(){
         self.view.endEditing(true)