//
//  StockScreenAssembly.swift
//  Stocks
//
//  Created out-nazarov2-ms on 05.09.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class StockScreenAssembly {
    func createStockScreen() -> UIViewController {
        let presenter = StockScreenPresenter()
        let viewController = StockScreenViewController()
        let interactor = StockScreenInteractor()
        presenter.view = viewController
        viewController.presenter = presenter
        presenter.interactor = interactor
        return viewController
    }
}
