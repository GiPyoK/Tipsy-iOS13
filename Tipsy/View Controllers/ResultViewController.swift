//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Gi Pyo Kim on 10/29/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var tip: Tip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tip = tip else {
            print("NO tip")
            return
        }
        print(tip.tipPercentage)
        print(tip.numOfPeople)
        print(tip.totalPerPerson)
        print(tip.billTotal)
        updateViews(tip: tip)
    }

    func updateViews(tip: Tip) {
        totalLabel.text = tip.totalPerPerson
        settingLabel.text = "Split between \(tip.numOfPeople) people, with \(tip.tipPercentage*100)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
