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
    @IBOutlet weak var seacrhTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        
    }
    
    // textFieldShouldReturn asks the delegate if the text field should process the pressing of the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Removes the keyboard when a user clicks on go/return button
        seacrhTextField.endEditing(true)
        
        // prints the text when user clicks on go/return button
        print(seacrhTextField.text!)
        return true
    }

}

