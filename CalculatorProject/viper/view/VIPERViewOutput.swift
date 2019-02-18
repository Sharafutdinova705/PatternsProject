//
//  VIPERViewOutput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol VIPERViewOutput: AnyObject {
    
    /// Для отправки на обработку при нажатии на кнопку с цифрой
    ///
    /// - Parameter number: тег данной кнопки
    func numberPressedButton(_ number: String?)
    
    /// Для отправки на обработку при нажатии на кнопку с математической операцией
    ///
    /// - Parameter number: тег данной кнопки
    func operationPressedButton(_ number: String?)
}
