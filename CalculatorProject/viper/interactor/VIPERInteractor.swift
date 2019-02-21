//
//  VIPERInteractor.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

enum Helper: String {
    
    case _empty = "", _11 = "11", _12 = "12", _13 = "13", _14 = "14", _15 = "15", _16 = "16", _17 = "17", _18 = "18", _19 = "19", _20 = "20"
}

class VIPERInteractor: VIPERInteractorInput {
    
    weak var view: VIPERInteractorOutput!
    var operationManager: OperationsProtocol!
    var dataManager: DataManagerProtocol!
    let dot = "."
    var allFirstNumber = ""
    var allSecondNumber = ""
    var operation = ""
    var isError = false
    var hasDot = false
    var hasDot2 = false
    let maxCountOfNumber = 9
    
    func numberPressedButton(_ number: String?) {
        
        if(allFirstNumber.count < maxCountOfNumber && operation == (Helper._empty).rawValue) {
            
            allFirstNumber += number!
            view.showTextLabel(allFirstNumber)
        } else if allSecondNumber.count < maxCountOfNumber && allFirstNumber != (Helper._empty).rawValue && operation != (Helper._empty).rawValue {
            
            allSecondNumber += number!
            isError = false
            view.handleData(allSecondNumber, isError: isError)
        } else {
            
            isError = true
            view.handleData(dataManager.obtainErrorAlert(), isError: isError)
        }
    }
    
    func operationPressedButton(_ number: String?) {
        
        if number == (Helper._17).rawValue {
            
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
                        
                        isError = true
                        view.handleData(dataManager.obtainDotErrorAlert(), isError: isError)
                    }
                } else if operation != (Helper._empty).rawValue && hasDot2 == false {
                    
                    if allSecondNumber.count < maxCountOfNumber - 1 {
                        
                        allSecondNumber += dot
                        view.showTextLabel(allSecondNumber)
                        hasDot = true
                    } else {
                        
                        isError = true
                        view.handleData(dataManager.obtainDotErrorAlert(), isError: isError)
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
            
            isError = false
            view.handleData(dataManager.obtainErrorAlert(), isError: isError)
        }
    }
    
    /// При нажатии на равно
    ///
    /// - Parameters:
    ///   - first: первое значение
    ///   - second: второе значение
    ///   - operation: тег той операции, которая произошла
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
    
    /// Удаление с экрана все числа
    func clear() {
        
        operation = (Helper._empty).rawValue
        allFirstNumber = (Helper._empty).rawValue
        allSecondNumber = (Helper._empty).rawValue
        hasDot = false
        hasDot2 = false
        view.showTextLabel(allSecondNumber)
    }
}
