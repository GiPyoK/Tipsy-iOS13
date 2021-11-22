//
//  TipCalculator.swift
//  Tipsy
//
//  Created by Gi Pyo Kim on 11/18/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculator {
    static func calculate(tip: inout Tip) {
        var total = tip.billTotal + (tip.billTotal * tip.tipPercentage / 100.0)
        total = total / Float(tip.numOfPeople)
        tip.totalPerPerson = String(format: "%.2f", total)
    }
}
