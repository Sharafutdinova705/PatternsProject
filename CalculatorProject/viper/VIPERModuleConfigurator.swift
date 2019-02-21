//
//  VIPERModuleConfigurator.swift
//  CalculatorProject
//
//  Created by Гузель on 17/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class VIPERModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? VIPERViewController else { fatalError() }
        
        let dataManager = DataManager()
        let presenter = VIPERPresenter()
        let interactor = VIPERInteractor()
        let router = VIPERRouter()
        let operations: OperationsProtocol = Operations()
        
        view.presenter = presenter
        interactor.dataManager = dataManager
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.operationManager = operations
        interactor.view = presenter
        router.view = view
    }
}
