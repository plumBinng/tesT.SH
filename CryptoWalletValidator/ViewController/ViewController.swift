
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
    }
    
    private func createAlert(buttonColor: UIColor) -> SCLAlertView{
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "Roboto-Medium", size: 20)!,
            kTextFont: UIFont(name: "Roboto-Light", size: 17)!,
            kButtonFont: UIFont(name: "Roboto-Medium", size: 17)!,
            showCloseButton: false,
            contentViewCornerRadius: 5,
            buttonCornerRadius: 5,
            titleColor: UIColorFromRGB(0x32325D)
        )
        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.addButton("Done", backgroundColor: buttonColor, textColor: UIColor.white, showTimeout: SCLButton.ShowTimeoutConfiguration.init(), target: self, selector: #selector(ViewController.closeAlert))
        return alertView
    }
    
    @objc func closeAlert() {
        alertViewResponder?.close()
    }

    private func initiliaseData(){
        cryptoField.text = currencyDatasource[0]
        networkField.text = networkDatasource[0]
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {