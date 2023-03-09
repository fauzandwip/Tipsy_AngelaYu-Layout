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
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        calculatorBrain.changeTip(sender: sender, zero: zeroPctButton, ten: tenPctButton, twenty: twentyPctButton)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let splitValue = sender.value
        
        splitNumberLabel.text = String(format: "%.0f", splitValue)
        calculatorBrain.changeSplit(numberOfPeople: splitValue)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        calculatorBrain.calculateSplit(billTextField: billTextField)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.splitTotal = calculatorBrain.getTotalSplit()
            resultVC.split = calculatorBrain.getSplit()
            resultVC.tip = calculatorBrain.getTip()
        }
    }
    

}

