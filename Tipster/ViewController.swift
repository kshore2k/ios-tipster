//
//  ViewController.swift
//  Tipster
//
//  Created by Kris Shore on 3/18/19.
//  Copyright © 2019 Kris Shore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet var percentLabel: [UILabel]!
    
    @IBOutlet var tipAmountLabel: [UILabel]!
    
    @IBOutlet var amountPerPersonLabel: [UILabel]!
    
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBOutlet var uiSliders: [UISlider]!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if totalLabel.text == "0" {
            totalLabel.text = sender.titleLabel?.text
        } else {
            totalLabel.text = totalLabel.text! + (sender.titleLabel?.text)!
        }
        
        updateTipAmt()
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        totalLabel.text = "0"
        
        for idx in 0..<uiSliders.count {
            uiSliders[idx].value = 0
        }
        
        updateTipAmt()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipSliderValueChanged(_ sender: UISlider) {
        percentLabel[0].text = String(Int(sender.value + 0)) + "%"
        percentLabel[1].text = String(Int(sender.value + 5)) + "%"
        percentLabel[2].text = String(Int(sender.value + 10)) + "%"
        
        updateTipAmt()
    }
    
    @IBAction func groupSliderValueChanged(_ sender: UISlider) {
        for idx in 0..<amountPerPersonLabel.count {
            if let tip = tipAmountLabel[idx].text {
                let total = Double(totalLabel.text!)! + Double(tip)!
                amountPerPersonLabel[idx].text = String(format: "%.2f",(total / Double(sender.value)))
            }
        }
        
        groupSizeLabel.text = "Group Size: " + String(Int(sender.value))
    }
    
    func updateTipAmt() {
        for idx in 0..<tipAmountLabel.count {
            if let tipAmt = percentLabel[idx].text?.replacingOccurrences(of: "%", with: "") {
                tipAmountLabel[idx].text = String(format: "%.2f",((Double(totalLabel.text!)! * Double(tipAmt)!) / 100.0))
            }
        }
    }
    
}
