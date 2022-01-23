//
//  SettingsViewController.swift
//  Tip Calculator Plus
//
//  Created by Yvonne511 on 2022/1/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    public var tipA = 0.15
    public var tipB = 0.18
    public var tipC = 0.20
    

    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var tip1: UILabel!
    @IBOutlet weak var tip2: UILabel!
    @IBOutlet weak var tip3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        // Do any additional setup after loading the view.
        slider1.minimumValue = 0.00
        slider2.minimumValue = 0.00
        slider3.minimumValue = 0.00
        slider1.maximumValue = 0.50
        slider2.maximumValue = 0.50
        slider3.maximumValue = 0.50
    }
    
    @IBAction func set1(_ sender: Any) {
        tipA = Double(round(100 * Double(slider1.value)) / 100)
        let displayA = tipA*100
        tip1.text = String(format:"%.0f", displayA)+"%"
    }
    
    @IBAction func set2(_ sender: Any) {
        tipB = Double(round(100 * Double(slider2.value)) / 100)
        let displayB = tipB*100
        tip2.text = String(format:"%.0f", displayB)+"%"
    }
    
    @IBAction func set3(_ sender: Any) {
        tipC = Double(round(100 * Double(slider3.value)) / 100)
        let displayC = tipC*100
        tip3.text = String(format:"%.0f", displayC)+"%"
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
