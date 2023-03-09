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
    var numberOfPeople = 2
    var tip = 0.0
    
    func getTotalSplit() -> Double {
        return totalSplit
    }
    
    func getSplit() -> Int {
        return numberOfPeople
    }
    func getTip() -> Int {
        return Int(tip * 100)
    }
    
    mutating func changeSplit(numberOfPeople: Double) {
        self.numberOfPeople = Int(numberOfPeople)
    }
    
    mutating func changeTip(sender: UIButton, zero: UIButton, ten: UIButton, twenty: UIButton) {
        
        zero.isSelected = false
        ten.isSelected = false
        twenty.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsNumber / 100
        
    }
    
    mutating func calculateSplit(billTextField: UITextField) {
        let billValue = Double(billTextField.text!)!
//        let splitNumber = Double(splitNumberLabel.text ?? "2") ?? 2
        let splitBill = billValue * (1 + (tip)) / Double(numberOfPeople)

        totalSplit = splitBill
        
        tipsy = Tipsy(totalSplit: totalSplit, split: numberOfPeople, tip: tip)
    }
}
