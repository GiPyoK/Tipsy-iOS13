//
//  TipViewController.swift
//  Tipsy
//
//  Created by Gi Pyo Kim on 10/29/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = Tip()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        tip.tipPercentage = Float(sender.tag) / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let numOfPeople = Int(sender.value)
        splitNumberLabel.text = "\(numOfPeople)"
        tip.numOfPeople = numOfPeople
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billTotalString = billTextField.text,
            let billTotal = Float(billTotalString) else {
            print("Enter valid bill total")
            return
        }
        
        tip.billTotal = billTotal
        TipCalculator.calculate(tip: &tip)
        
        self.performSegue(withIdentifier: "ModalResultViewSegue", sender: tip)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalResultViewSegue" {
            if let resultVC = segue.destination as? ResultViewController {
                resultVC.tip = tip
            }
        }
    }
}
