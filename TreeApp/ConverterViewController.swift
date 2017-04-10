//
//  ConverterViewController.swift
//  Converter
//
//  Created by Senior Node on 13.02.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    enum CurrencyConverterError: Error {
        case negativeValue
        case notNumeralValue
    }
    
    @IBOutlet weak var blrCurrency: UITextField!
    @IBOutlet weak var rurCurrency: UITextField!
    @IBOutlet weak var usdCurrency: UITextField!
    @IBOutlet weak var eurCurrency: UITextField!
    @IBOutlet weak var inputInfo: UILabel!
    
    let rurRate = Double(3.2336)
    let usdRate = Double(1.9028)
    let eurRate = Double(3.2336)
    
    @IBAction func Convert(_ sender: AnyObject) {
        view.endEditing(true)
        do{
            let inputValue  = Double(blrCurrency.text!)
            if inputValue==nil{
                throw CurrencyConverterError.notNumeralValue
            }
            if inputValue!<0{
                throw CurrencyConverterError.negativeValue
            }
            rurCurrency.text = "\(inputValue!/rurRate)"
            usdCurrency.text = "\(inputValue!/usdRate)"
            eurCurrency.text = "\(inputValue!/eurRate)"
        }
        catch CurrencyConverterError.notNumeralValue{
            clearInputs()
            inputInfo.text = "Not numeral value!"
        }
        catch CurrencyConverterError.negativeValue{
            clearInputs()
            inputInfo.text = "Negative value!"
        }
        catch{
            clearInputs()
            inputInfo.text = "Unknown error :("
        }
    }
    
    func clearInputs(){
     blrCurrency.text = ""
     rurCurrency.text = ""
     usdCurrency.text = ""
     eurCurrency.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputInfo.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

