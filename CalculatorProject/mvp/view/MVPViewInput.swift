//
//  MVPViewInput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol MVPViewInput: AnyObject {
    
    /// Показать текст на экране
    ///
    /// - Parameter text: текст (результат вычислений/ цифры)
    func showTextLabel(_ text: String?)
    
    /// Показать алерт
    ///
    /// - Parameter text: текст для алерта
    func showAlert(_ text: String?)
}
