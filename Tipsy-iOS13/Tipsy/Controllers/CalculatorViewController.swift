//
//  ViewController.swift
//  Tipsy
//
//  Created by Şahin Yürek on 3/14/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var splitNumber = 2.0
    var formattedTotal = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumber = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Double(billTextField.text!) ?? 0.0
        let total = (bill + (bill * tip)) / splitNumber
        formattedTotal = String(format: "%.2f", total)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var resultsVC = segue.destination as! ResultsViewController
        resultsVC.total = formattedTotal
        resultsVC.tip = Int(tip * 100)
        resultsVC.splitNumber = Int(splitNumber)
    }
}
