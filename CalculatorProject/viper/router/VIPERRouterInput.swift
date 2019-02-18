//
//  VIPERRouterInput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol VIPERRouterInput: AnyObject {
    
    /// Показать алерт
    ///
    /// - Parameter message: Текст, который нужно показать в алерте
    func showAlert(_ message: String?)
}
