//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Şahin Yürek on 3/11/23.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(bmiValue: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue <= 24.9 {
            bmi = BMI(bmiValue: bmiValue, advice: "Fit as a fiddle", color: .green)
        } else {
            bmi = BMI(bmiValue: bmiValue, advice: "Eat fewer pies", color: .red)
        }
    }
    
    func getBMI() -> String {
        return String(format: "%.1f", bmi?.bmiValue ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
