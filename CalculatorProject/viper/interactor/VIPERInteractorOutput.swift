//
//  VIPERInteractorOutput.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol VIPERInteractorOutput: AnyObject {
    
    func CallAlert(_ text: String?)
    
    func showTextLabel(_ text: String?)
}
