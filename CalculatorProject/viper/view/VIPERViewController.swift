//
//  VIPERViewController.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class VIPERViewController: UIViewController, VIPERViewInput {
    
    var numberOnScreen:Double = 0
    var presenter: VIPERViewOutput!
    
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
