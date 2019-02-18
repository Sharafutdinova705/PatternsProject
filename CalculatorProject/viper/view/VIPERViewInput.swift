//
//  VIPERViewInput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol VIPERViewInput: AnyObject {
    
    /// Показать какие-либо вычисления на экране
    ///
    /// - Parameter text: вычисления/цифры
    func showTextLabel(_ text: String?)
}

