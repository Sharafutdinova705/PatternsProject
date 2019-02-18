//
//  MVPViewOutput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol MVPViewOutput {
    
    /// Для отправки на обработку при нажатии на кнопку с цифрой
    ///
    /// - Parameter number: тег нажатой кнопки
    func numberPressedButton(_ number: String?)
    
    /// Для отправки на обработку при нажатии на кнопку с математической операцией
    ///
    /// - Parameter number: тег нажатой кнопки
    func operationPressedButton(_ number: String?)
}
