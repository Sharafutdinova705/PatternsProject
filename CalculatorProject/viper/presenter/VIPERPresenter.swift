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
    
    func CallAlert(_ text: String?) {
        
        router.showAlert(text)
    }
    
    func showTextLabel(_ text: String?) {
        
        view.showTextLabel(text)
    }
    
    func numberPressedButton(_ number: String?) {
        
        interactor.numberPressedButton(number)
    }
    
    func operationPressedButton(_ number: String?) {
        interactor.operationPressedButton(number)
    }
}
