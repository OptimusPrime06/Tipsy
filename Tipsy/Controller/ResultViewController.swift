//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Gulliver Raed on 22/08/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var billTotal : Float?
    var tipPercentage : Float?
    var numberOfPeople : Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let splitBill = ( billTotal! + ( billTotal! * tipPercentage! ) ) / Float( numberOfPeople! )
        
        totalLabel.text = String( splitBill )
        settingsLabel.text = "Split between \(numberOfPeople ?? 2) people, with \( ( tipPercentage ?? 0.1) * 100 )% tip"
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
