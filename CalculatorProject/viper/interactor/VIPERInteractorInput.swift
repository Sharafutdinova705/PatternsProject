//
//  VIPERInteractorInput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation


protocol VIPERInteractorInput: AnyObject {
    
    func numberPressedButton(_ number: String?)
    
    func operationPressedButton(_ number: String?)
}