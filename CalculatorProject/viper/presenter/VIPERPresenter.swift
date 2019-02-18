//
//  VIPERPresenter.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class VIPERPresenter: VIPERViewOutput, VIPERInteractorOutput {
    
    weak var view: VIPERViewInput!
    var router: VIPERRouterInput!
    var interactor: VIPERInteractorInput!
    
    /// Показывает алерт с текстом, который приходит
    ///
    /// - Parameter text: текст для алерта
    func CallAlert(_ text: String?) {
        
        router.showAlert(text)
    }
    
    /// Показать на экране вычисления/ числа
    ///
    /// - Parameter text: текст, который выведется на экран
    func showTextLabel(_ text: String?) {
        
        view.showTextLabel(text)
    }
    
    /// Метод для обработки данных после нажатия на цифру
    ///
    /// - Parameter number: тег цифры
    func numberPressedButton(_ number: String?) {
        
        interactor.numberPressedButton(number)
    }
    
    /// Метод для обработки данных после нажатия на математические опреации
    ///
    /// - Parameter number: тег нажатой кнопки
    func operationPressedButton(_ number: String?) {
        interactor.operationPressedButton(number)
    }
}
