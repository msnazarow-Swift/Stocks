//
//  StockScreenAssembly.swift
//  Stocks
//
//  Created out-nazarov2-ms on 05.09.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
class AppRouter {

}

class StockScreenAssembly {

    func createStockScreen(appRouter: AppRouter) -> StockScreenViewInput {
    
        let router = StockScreenRouter(appRouter: appRouter)
        let presenter = StockScreenPresenter(router: router)
        let viewController = self.createStockScreenView()
        let interactor = StockScreenInteractor()
        presenter.view = viewController
        viewController.presenter = presenter
        presenter.interactor = interactor
        return viewController
    }

    private
    func createStockScreenView() -> StockScreenViewController {
        let viewController = StockScreenViewController()
    
        return viewController
    }
}
