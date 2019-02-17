//
//  MVPModuleConfigurator.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class MVPModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? ViewController else { fatalError() }
        
        let presenter = MVPPresenter()
        let operations: OperationsProtocol = Operations()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.operationManager = operations
    }
}

