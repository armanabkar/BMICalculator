//
//  ViewController.swift
//  BMICalculator
//
//  Created by Arman Abkar on 5/29/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiCalculator = BMICalculator()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        bmiCalculator.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResultViewController", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultViewController" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiCalculator.getBMIValue()
            destinationVC.advice = bmiCalculator.getAdvice()
            destinationVC.color = bmiCalculator.getColor()
        }
    }
}
