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
    var allFirstNumber = ""
    let maxCountOfNumber = 9
    var allSecondNumber = ""
    var operation = ""
    var hasDot = false
    var hasDot2 = false
    
    func numberPressedButton(_ number: String?) {
        
        if(allFirstNumber.count < maxCountOfNumber && operation == "") {
            
            allFirstNumber += number!
            view.showTextLabel(allFirstNumber)
        } else if allSecondNumber.count < maxCountOfNumber && allFirstNumber != "" && operation != "" {
            
            allSecondNumber += number!
            view.showTextLabel(allSecondNumber)
        } else {
            
            view.showAlert("Сначала введите 1-е число, затем операцию и затем 2-е число.")
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
                        
                        view.showAlert("Нельзя поставить точку")
                    }
                } else if operation != "" && hasDot2 == false {
                    
                    if allSecondNumber.count < maxCountOfNumber - 1 {
                        
                        allSecondNumber += "."
                        view.showTextLabel(allSecondNumber)
                        hasDot = true
                    } else {
                        
                        view.showAlert("Нельзя поставить точку")
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
            
            view.showAlert("Сначала введите первое число.")
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
    
    /// Почистить экран
    func clear() {
        operation = ""
        allFirstNumber = ""
        allSecondNumber = ""
        hasDot = false
        hasDot2 = false
        view.showTextLabel(allSecondNumber)
    }
}
