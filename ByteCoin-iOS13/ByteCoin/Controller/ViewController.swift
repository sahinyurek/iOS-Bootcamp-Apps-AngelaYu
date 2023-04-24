//
//  ViewController.swift
//  ByteCoin
//
//  Created by Şahin Yürek on 3/28/23.
//

import UIKit

class ViewController: UIViewController {
    var coinManager = CoinManager()
    
    @IBOutlet var bitcoinLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var currencyPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        // Do any additional setup after loading the view.
    }
}

// MARK: - UIPickerViewDataSource & UIPickerViewDelegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
}

// MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    func didUpdateCoinRate(rate: String, currency: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = rate
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
