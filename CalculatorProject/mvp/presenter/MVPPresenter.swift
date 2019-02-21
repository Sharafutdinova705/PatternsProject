//
//  MVPPresenter.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class MVPPresenter: MVPViewOutput {
    
    weak var view: MVPViewInput!
    var operationManager: OperationsProtocol!
    var dataManager: DataManagerProtocol!
    var allFirstNumber = ""
    let maxCountOfNumber = 9
    let dot = "."
    var allSecondNumber = ""
    var operation = ""
    var hasDot = false
    var hasDot2 = false
    
    func numberPressedButton(_ number: String?) {
        
        if(allFirstNumber.count < maxCountOfNumber && operation == (Helper._empty).rawValue) {
            
            allFirstNumber += number!
            view.showTextLabel(allFirstNumber)
        } else if allSecondNumber.count < maxCountOfNumber && allFirstNumber != (Helper._empty).rawValue && operation != (Helper._empty).rawValue {
            
            allSecondNumber += number!
            view.showTextLabel(allSecondNumber)
        } else {
            
            view.showAlert(dataManager.obtainErrorAlert())
        }
    }
    
    func operationPressedButton(_ number: String?) {
        
        if number == (Helper._11).rawValue {
            clear()
            return
        }
        
        if allFirstNumber != (Helper._empty).rawValue {
            
            switch number {
                
            case (Helper._13).rawValue:
                
                operation = (Helper._empty).rawValue
                view.showTextLabel(operationManager.percent(Double(allFirstNumber)!))
            case (Helper._18).rawValue:
                
                equals(allFirstNumber, allSecondNumber, operation)
            case (Helper._19).rawValue:
                
                if operation == (Helper._empty).rawValue && hasDot == false {
                    
                    if allFirstNumber.count < maxCountOfNumber - 1 {
                        
                        allFirstNumber += dot
                        view.showTextLabel(allFirstNumber)
                        hasDot = true
                    } else {
                        
                        view.showAlert(dataManager.obtainDotErrorAlert())
                    }
                } else if operation != (Helper._empty).rawValue && hasDot2 == false {
                    
                    if allSecondNumber.count < maxCountOfNumber - 1 {
                        
                        allSecondNumber += dot
                        view.showTextLabel(allSecondNumber)
                        hasDot = true
                    } else {
                        
                        view.showAlert(dataManager.obtainDotErrorAlert())
                    }
                }
            case (Helper._20).rawValue:
                
                if operation == (Helper._empty).rawValue {
                    
                    allFirstNumber = String(Double(allFirstNumber)! * -1)
                    view.showTextLabel(allFirstNumber)
                } else {
                    
                    allFirstNumber = String(Double(allFirstNumber)! * -1)
                    view.showTextLabel(allSecondNumber)
                }
            default:
                
                if number != (Helper._11).rawValue {
                    
                    operation = number!
                    view.showTextLabel((Helper._empty).rawValue)
                }
            }
        } else {
            
            view.showAlert(dataManager.obtainErrorAlert())
        }
    }
    
    /// Метод для кнопки равно
    ///
    /// - Parameters:
    ///   - first: первое значение
    ///   - second: второе значение
    ///   - operation: тег операции
    func equals(_ first: String, _ second: String, _ operation: String) {
        
        switch operation {
            
        case (Helper._12).rawValue:
            
            view.showTextLabel(operationManager.powing(Double(first)!, Double(second)!))
        case (Helper._13).rawValue:
            
            view.showTextLabel(operationManager.powing(Double(first)!, Double(second)!))
        case (Helper._14).rawValue:
            
            view.showTextLabel(operationManager.dividing(Double(first)!, Double(second)!))
        case (Helper._15).rawValue:
            
            view.showTextLabel(operationManager.multiplying(Double(first)!, Double(second)!))
        case (Helper._16).rawValue:
            
            view.showTextLabel(operationManager.minusing(Double(first)!, Double(second)!))
        case (Helper._17).rawValue:
            
            view.showTextLabel(operationManager.adding(Double(first)!, Double(second)!))
        default:
            
            if operation == (Helper._empty).rawValue {
                view.showTextLabel(allFirstNumber)
            } else {
                view.showTextLabel(allSecondNumber)
            }
        }
        
        self.operation = (Helper._empty).rawValue
        allFirstNumber = (Helper._empty).rawValue
        allSecondNumber = (Helper._empty).rawValue
        hasDot = false
    }
    
    /// Почистить экран
    func clear() {
        
        operation = (Helper._empty).rawValue
        allFirstNumber = (Helper._empty).rawValue
        allSecondNumber = (Helper._empty).rawValue
        hasDot = false
        hasDot2 = false
        view.showTextLabel(allSecondNumber)
    }
}
