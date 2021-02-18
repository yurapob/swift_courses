//
//  CalculatorViewController.swift
//  Course2Week3Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var argLabel1: UILabel!
    @IBOutlet weak var argLabel2: UILabel!
    @IBOutlet weak var resLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    var firstValue: Double = 1
    var secondValue: Double = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.stepValue = 0.5
        stepper.autorepeat = false
        
        slider.minimumValue = 1.0
        slider.maximumValue = 100.0
        
        resLabel.textAlignment = .right

        view.backgroundColor = UIColor(red: 45/255, green: 47/255, blue: 49/255, alpha: 1.0)
        resLabel.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        resLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        argLabel1.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        argLabel2.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        slider.tintColor = UIColor(red: 236/255, green: 113/255, blue: 73/255, alpha: 1.0)
        stepper.tintColor = UIColor(red: 236/255, green: 113/255, blue: 73/255, alpha: 1.0)
        button.backgroundColor = UIColor(red: 236/255, green: 113/255, blue: 73/255, alpha: 1.0)
        
        
        
        
        
        
        argLabel1.text = "1"
        argLabel1.sizeToFit()
        argLabel2.text = "1"
        argLabel2.sizeToFit()
        resLabel.text = "1"
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper){
        firstValue = Double(Double(sender.value).description)!
        argLabel1.text = Double(sender.value).description
        argLabel1.sizeToFit()
    }
    
    @IBAction func sliderPressed(_ sender: UISlider){
        secondValue = Double(Double(sender.value).description)!
        argLabel2.text = String(round(Double(Double(sender.value).description)! * 10000) / 10000)
        argLabel2.sizeToFit()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton){
        resLabel.text = String(round((firstValue * secondValue) * 10000) / 10000)
    }
    
}
