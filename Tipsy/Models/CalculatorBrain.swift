//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Fauzan Dwi Prasetyo on 08/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var tipsy: Tipsy?
    var totalSplit = 0.0
    var split = 2
    
    func getTotalSplit() -> Double {
        return totalSplit
    }
    
    func getSplit() -> Int {
        return split
    }
    func getPercentageLabel() -> String {
        return tipsy?.percentageLabel ?? "0%"
    }
    
    mutating func changeSplit(split: Double) {
        self.split = Int(split)
    }
    
    mutating func changeTip(percent: String, zero: UIButton, ten: UIButton, twenty: UIButton) {
        
        zero.isSelected = false
        ten.isSelected = false
        twenty.isSelected = false
        
        if percent == "0%" {
            zero.isSelected = true
            tipsy = Tipsy(totalSplit: totalSplit, split: split, percentage: 0, percentageLabel: "0%")
        } else if percent == "10%" {
            ten.isSelected = true
            tipsy = Tipsy(totalSplit: totalSplit, split: split, percentage: 0.1, percentageLabel: "10%")
        } else {
            twenty.isSelected = true
            tipsy = Tipsy(totalSplit: totalSplit, split: split, percentage: 0.2, percentageLabel: "20%")
        }
    }
    
    mutating func calculateSplit(billTextField: UITextField, splitNumberLabel: UILabel) {
        let billValue = Double(billTextField.text ?? "0.0") ?? 0.0
        let splitNumber = Double(splitNumberLabel.text ?? "2") ?? 2
        let splitBill = billValue * (1 + (tipsy?.percentage ?? 0.0)) / splitNumber

        totalSplit = splitBill
    }
}
