//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit


// UITextFieldDelegate is a set optional methods that you use to manage the editing and validation of text in a text field object
class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        
        // Removes the keyboard when user clicks on search icon
        searchTextField.endEditing(true)
    }
    
    // textFieldShouldReturn asks the delegate if the text field should process the pressing of the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Removes the keyboard when user clicks on go/return button
        searchTextField.endEditing(true)

        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    // Clears the text field as soon as user done typing and clicks search icon/go button
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
}
