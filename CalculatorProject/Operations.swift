//
//  Operations.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol OperationsProtocol {
        
        /// Суммирует два значения
        ///
        /// - Parameters:
        ///   - firstValue: первое значение
        ///   - memoryValue: Второе значение
        /// - Returns: возвращает результат в типе String
        func adding(_ firstValue: Double,_ secondValue: Double) -> String
        
        /// Разность двух значений
        ///
        /// - Parameters:
        ///   - firstValue: первое значение
        ///   - memoryValue: второе значение
        /// - Returns: возвращает результат в типе String
        func minusing(_ firstValue: Double,_ secondValue: Double) -> String
        
        /// Умножение двух значений
        ///
        /// - Parameters:
        ///   - firstValue: первое значение
        ///   - memoryValue: второе значение
        /// - Returns: возвращает результат в типе String
        func multiplying(_ firstValue: Double,_ secondValue: Double) -> String
        
        /// Деление одного значения на другое
        ///
        /// - Parameters:
        ///   - firstValue: первое значение
        ///   - memoryValue: второе значение
        /// - Returns: возвращает результат в типе String
        func dividing(_ firstValue: Double,_ secondValue: Double) -> String
    
        /// Возводит одно значение в степень равное другому значению
        ///
        /// - Parameters:
        ///   - firstValue: перве значение
        ///   - memoryValue: второе значение
        /// - Returns: возвращает результат в типе String
        func powing(_ firstValue: Double,_ secondValue: Double) -> String

        /// Выдает процент от числа
        ///
        /// - Parameter firstValue: значение, из которого нужно взять процент
        /// - Returns: возвращает результат в типе String
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
