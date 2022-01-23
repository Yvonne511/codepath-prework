//
//  ViewController.swift
//  Tip Calculator Plus
//
//  Created by Yvonne511 on 2022/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var stepperValueChanged: UIStepper!
    @IBOutlet weak var stepperCount: UILabel!
    @IBOutlet weak var billPerPerson: UILabel!
    
    var total = 0.00;
    var reference = 0.00;
    var tipPercentages = [0.15, 0.18, 0.20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        stepperValueChanged.wraps = true
        stepperValueChanged.autorepeat = true
        stepperValueChanged.maximumValue = 10
        stepperValueChanged.minimumValue = 1
        
        let defaults = UserDefaults.standard
        defaults.set("15%", forKey: "tip1")
        defaults.set("18%", forKey: "tip2")
        defaults.set("20%", forKey: "tip3")
        defaults.set([0.15, 0.18, 0.20], forKey: "tipPercentages")
        defaults.synchronize()
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        reference = bill + tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func RoundUp(_ sender: Any) {
        if stateSwitch.isOn {
            total.round(.up)
        }
        else {
            total = reference;
        }
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func DivideBill(_ sender: Any) {
        stepperCount.text = String(Int(stepperValueChanged.value)) + " Person"
        let finalbill = total/(stepperValueChanged.value)
        billPerPerson.text = String(format: "$%.2f", finalbill)
    }
    
}

