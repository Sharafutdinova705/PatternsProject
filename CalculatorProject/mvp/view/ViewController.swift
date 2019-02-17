//
//  ViewController.swift
//  CalculatorProject
//
//  Created by Гузель on 16/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MVPViewInput {
    
    func showAlert(_ text: String?) {
        let errorAlert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        errorAlert.addAction(ok)
        present(errorAlert, animated: true, completion: nil)
    }
    
    
    var numberOnScreen:Double = 0
    var presenter: MVPViewOutput!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showTextLabel(_ text: String?) {
        
        textLabel.text = text
    }
    
    @IBAction func operationButtons(_ sender: UIButton) {
        
        let operationPressedTag = String(sender.tag)
        presenter.operationPressedButton(operationPressedTag)
    }
    
    @IBAction func numberButtons(_ sender: UIButton) {
        
        let numberPressed = String(sender.tag - 1)
        presenter.numberPressedButton(numberPressed)
    }
}
