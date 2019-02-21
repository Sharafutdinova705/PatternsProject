//
//  VIPERInteractorOutput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol VIPERInteractorOutput: AnyObject {
    
    /// Обрабатывает полученные данные, и в зависимости от того, ошибка это или нет, вызывает определенные методы
    ///
    /// - Parameters:
    ///   - text: текст, который нужно передать
    ///   - isError: Это ошибка или нет -  boolean 
    func handleData(_ text: String, isError: Bool)
    
    /// отправить алерт
    ///
    /// - Parameter text: текст алерта
    func callAlert(_ text: String?)
    
    /// отправить на экран результат вычисления
    ///
    /// - Parameter text: вычисления/ цифры
    func showTextLabel(_ text: String?)
}
