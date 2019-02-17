//
//  MVPViewInput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol MVPViewInput: AnyObject {
    
    func showTextLabel(_ text: String?)
    
    func showAlert(_ text: String?)
}
