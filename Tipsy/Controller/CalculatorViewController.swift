//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroTipPercent: UIButton!
    @IBOutlet weak var tenTipPercent: UIButton!
    @IBOutlet weak var twentyTipPercent: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var previousValue = 0
    var realTipValue = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        let tipButton = sender.currentTitle!
        
        if tipButton == "0%" {
            zeroTipPercent.isSelected = true
            tenTipPercent.isSelected = false
            twentyTipPercent.isSelected = false
            realTipValue = 0.0
        } else if tipButton == "10%" {
            zeroTipPercent.isSelected = false
            tenTipPercent.isSelected = true
            twentyTipPercent.isSelected = false
            realTipValue = 0.1

        } else {
            zeroTipPercent.isSelected = false
            tenTipPercent.isSelected = false
            twentyTipPercent.isSelected = true
            realTipValue = 0.2
        }
        
    }
    
    @IBAction func stepperUpdated(_ sender: UIStepper) {
        
        if Int(sender.value) > previousValue {
            splitNumberLabel.text = String( Int(splitNumberLabel.text!)! + 1 )
        } else if Int(sender.value) < previousValue {
            splitNumberLabel.text = String( Int(splitNumberLabel.text!)! - 1 )
        }
        
        previousValue = Int(sender.value)
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
//        print(Float(realTipValue))
//        print(((billTextField.text ?? "0.0") as NSString).floatValue)
//        print(previousValue)
        
        self.performSegue(withIdentifier: "calculateBill", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateBill" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.billTotal = ((billTextField.text ?? "0.0") as NSString).floatValue
            destinationVC.tipPercentage = Float(realTipValue)
            destinationVC.numberOfPeople = previousValue
        }
    }
}

