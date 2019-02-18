//
//  VIPERInteractor.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class VIPERInteractor: VIPERInteractorInput {
    
    weak var view: VIPERInteractorOutput!
    weak var output: VIPERInteractorOutput!
    var operationManager: OperationsProtocol!
    var allFirstNumber = ""
    var allSecondNumber = ""
    var operation = ""
    var hasDot = false
    var hasDot2 = false
    let maxCountOfNumber = 9
    
    func numberPressedButton(_ number: String?) {
        
        if(allFirstNumber.count < maxCountOfNumber && operation == "") {
            
            allFirstNumber += number!
            view.showTextLabel(allFirstNumber)
        } else if allSecondNumber.count < maxCountOfNumber && allFirstNumber != "" && operation != "" {
            
            allSecondNumber += number!
            view.showTextLabel(allSecondNumber)
        } else {
            
            output.CallAlert("Сначала введите 1-е число, затем операцию и затем 2-е число.")
        }
    }
    
    func operationPressedButton(_ number: String?) {
        
        if number == "11" {
            
            clear()
            return
        }
        
        if allFirstNumber != "" {
            
            switch number {
            
            case "13":
                
                operation = ""
                view.showTextLabel(operationManager.percent(Double(allFirstNumber)!))
            case "18":
                
                equals(allFirstNumber, allSecondNumber, operation)
            case "19":
                
                if operation == "" && hasDot == false {
                    
                    if allFirstNumber.count < maxCountOfNumber - 1 {
                        
                        allFirstNumber += "."
                        view.showTextLabel(allFirstNumber)
                        hasDot = true
                    } else {
                        
                        output.CallAlert("Нельзя поставить точку")
                    }
                } else if operation != "" && hasDot2 == false {
                    
                    if allSecondNumber.count < maxCountOfNumber - 1 {
                        
                        allSecondNumber += "."
                        view.showTextLabel(allSecondNumber)
                        hasDot = true
                    } else {
                        
                        output.CallAlert("Нельзя поставить точку")
                    }
                }
            case "20":
                
                if operation == "" {
                    
                    if Double(allFirstNumber)! < 0 {
                        
                        allFirstNumber = String(Double(allFirstNumber)! * -1)
                    } else {
                        
                        allFirstNumber = "-" + allFirstNumber
                    }
                    view.showTextLabel(allFirstNumber)
                } else {
                    
                    if Double(allSecondNumber)! < 0 {
                        
                        allSecondNumber = String(Double(allSecondNumber)! * -1)
                    } else {
                        
                        allSecondNumber = "-" + allSecondNumber
                    }
                    view.showTextLabel(allSecondNumber)
                }
            default:
                
                if number != "11" {
                    
                    operation = number!
                    view.showTextLabel("")
                }
            }
        } else {
            
            output.CallAlert("Сначала введите первое число.")
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
            
        case "12":
            
            view.showTextLabel(operationManager.powing(Double(first)!, Double(second)!))
        case "13":
            
            view.showTextLabel(operationManager.powing(Double(first)!, Double(second)!))
        case "14":
            
            view.showTextLabel(operationManager.dividing(Double(first)!, Double(second)!))
        case "15":
            view.showTextLabel(operationManager.multiplying(Double(first)!, Double(second)!))
        case "16":
            
            view.showTextLabel(operationManager.minusing(Double(first)!, Double(second)!))
        case "17":
            
            view.showTextLabel(operationManager.adding(Double(first)!, Double(second)!))
        default:
            
            if operation == "" {
                view.showTextLabel(allFirstNumber)
            } else {
                view.showTextLabel(allSecondNumber)
            }
        }
        
        self.operation = ""
        allFirstNumber = ""
        allSecondNumber = ""
        hasDot = false
    }
    
    /// Удаление с экрана все числа
    func clear() {
        
        operation = ""
        allFirstNumber = ""
        allSecondNumber = ""
        hasDot = false
        hasDot2 = false
        view.showTextLabel(allSecondNumber)
    }
}
