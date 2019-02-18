//
//  ViewController.swift
//  CalculatorProject
//
//  Created by Гузель on 16/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MVPViewInput {
    
    @IBOutlet weak var textLabel: UILabel!
    var presenter: MVPViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Показать алерт
    ///
    /// - Parameter text: текст алерта
    func showAlert(_ text: String?) {
        let errorAlert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        errorAlert.addAction(ok)
        present(errorAlert, animated: true, completion: nil)
    }

    /// Показать текст (результат вычислений) на экране
    ///
    /// - Parameter text: текст (результат вычислений)
    func showTextLabel(_ text: String?) {
        
        textLabel.text = text
    }
    
    /// Срабатывает при нажатии на мат.операцию
    ///
    /// - Parameter sender: sender типа UIButton
    @IBAction func operationButtons(_ sender: UIButton) {
        
        let operationPressedTag = String(sender.tag)
        presenter.operationPressedButton(operationPressedTag)
    }
    
    /// Срабатывает при нажатии на кнопку с цифрой
    ///
    /// - Parameter sender: sender типа UIButton
    @IBAction func numberButtons(_ sender: UIButton) {
        
        let numberPressed = String(sender.tag - 1)
        presenter.numberPressedButton(numberPressed)
    }
}
