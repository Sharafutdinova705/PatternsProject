//
//  Operations.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol OperationsProtocol {
        
        /// summ of two values
        ///
        /// - Parameters:
        ///   - firstValue: first sum value
        ///   - memoryValue: second some value
        /// - Returns: result of operation at string type
        func adding(_ firstValue: Double,_ secondValue: Double) -> String
        
        /// difference of two values
        ///
        /// - Parameters:
        ///   - firstValue: first difference value
        ///   - memoryValue: second differnce value
        /// - Returns: result of operation at string type
        func minusing(_ firstValue: Double,_ secondValue: Double) -> String
        
        /// multiply of two values
        ///
        /// - Parameters:
        ///   - firstValue: first multiplaying value
        ///   - memoryValue: second multiplaying value
        /// - Returns: result of operation at string type
        func multiplying(_ firstValue: Double,_ secondValue: Double) -> String
        
        /// devide two values
        ///
        /// - Parameters:
        ///   - firstValue: first devide value
        ///   - memoryValue: second devide value
        /// - Returns: result of operation at string type
        func dividing(_ firstValue: Double,_ secondValue: Double) -> String
        
        /// set value in some pow
        ///
        /// - Parameters:
        ///   - firstValue: first  value
        ///   - memoryValue: second  value of pow
        /// - Returns: result of operation at string type
        func powing(_ firstValue: Double,_ secondValue: Double) -> String

    func percent(_ firstValue: Double) -> String
}
    
class Operations: OperationsProtocol {
    func percent(_ firstValue: Double) -> String {
        return String(firstValue / 100)
    }
    
    func adding(_ firstValue: Double, _ secondValue: Double) -> String {
        return String(firstValue + secondValue)
    }
    
    func minusing(_ firstValue: Double, _ secondValue: Double) -> String {
        return String(firstValue - secondValue)
    }
    
    func multiplying(_ firstValue: Double, _ secondValue: Double) -> String {
        return String(firstValue * secondValue)
    }
    
    func dividing(_ firstValue: Double, _ secondValue: Double) -> String {
        return String(firstValue / secondValue)
    }
    
    func powing(_ firstValue: Double, _ secondValue: Double) -> String {
        return NSDecimalNumber(decimal: Decimal(pow(firstValue, secondValue))).stringValue
    }
    

}
