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
    
    func numberPressedButton(_ number: String?) {
        
        if(allFirstNumber.count < maxCountOfNumber && operation == "") {
            
            allFirstNumber += number!
            view.showTextLabel(allFirstNumber)
        } else if allSecondNumber.count < maxCountOfNumber && allFirstNumber != "" && operation != "" {
            
            allSecondNumber += number!
            view.showTextLabel(allSecondNumber)
        } else {
            
            view.showAlert("Enter the first number, then operation, then second number.")
        }
    }
    
    func operationPressedButton(_ number: String?) {
        
        if allFirstNumber != "" {
            
            switch number {
                
            case "11":
                
                operation = ""
                allFirstNumber = ""
                allSecondNumber = ""
                hasDot = false
                view.showTextLabel(allFirstNumber)
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
                } else {
                    
                    if allSecondNumber.count < maxCountOfNumber - 1 {
                        
                        allSecondNumber += "."
                        view.showTextLabel(allFirstNumber)
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
                
                operation = number!
                view.showTextLabel("")
            }
        } else {
            
            view.showAlert("First of all enter number")
        }
    }
    
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
}
