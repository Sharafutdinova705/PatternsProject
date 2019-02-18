//
//  VIPERInteractorOutput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol VIPERInteractorOutput: AnyObject {
    
    /// отправить алерт
    ///
    /// - Parameter text: текст алерта
    func CallAlert(_ text: String?)
    
    /// отправить на экран результат вычисления
    ///
    /// - Parameter text: вычисления/ цифры
    func showTextLabel(_ text: String?)
}
