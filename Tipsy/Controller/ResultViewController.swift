//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Fauzan Dwi Prasetyo on 08/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitTotal: Double?
    var split: Int?
    var tip: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", splitTotal ?? 0.0)
        settingsLabel.text = "Split between \(split!) people, with \(tip!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
