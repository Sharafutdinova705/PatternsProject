//
//  VIPERViewController.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class VIPERViewController: UIViewController, VIPERViewInput {
    
    var presenter: VIPERViewOutput!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Показать На экране текст, который придет (вычисления/ цифры)
    ///
    /// - Parameter text: какие-либо вычисления/ цифры
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
    
    /// Срабатывает при нажатии на цифру
    ///
    /// - Parameter sender: sender типа UIButton
    @IBAction func numberButtons(_ sender: UIButton) {
        
        let numberPressed = String(sender.tag - 1)
        presenter.numberPressedButton(numberPressed)
    }
}
