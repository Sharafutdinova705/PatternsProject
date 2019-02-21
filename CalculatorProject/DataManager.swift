//
//  DataManager.swift
//  CalculatorProject
//
//  Created by Гузель on 21/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol DataManagerProtocol: AnyObject {
    
    func obtainErrorAlert() -> String
    
    func obtainDotErrorAlert() -> String
}

class DataManager: DataManagerProtocol {
    
    func obtainErrorAlert() -> String {
        return "Сначала введите 1-е число, затем операцию и затем 2-е число."
    }
    
    func obtainDotErrorAlert() -> String {
        return "Нельзя поставить точку."
    }
}
