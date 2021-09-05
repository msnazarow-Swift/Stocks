//
//  StockScreenPresenter.swift
//  Stocks
//
//  Created out-nazarov2-ms on 05.09.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation


protocol StockScreenViewOutput: class {
  func didSelect(abbreviation: String)
}

class StockScreenPresenter: StockScreenViewOutput {

    weak var view: StockScreenViewInput?

    private let router: StockScreenRouter
    
    var interactor: StockScreenInteractorInput?

    init(router: StockScreenRouter) {
        self.router = router
    }
  func didSelect(abbreviation: String) {
    guard let interactor = interactor, let view = view else {
      print("Assbemle error")
      return
    }
    interactor.getCompany(abbreviation: abbreviation){ stockModel in
      view.setCompanyName(name: stockModel.companyName ?? "")
      view.setPrice(name: String(stockModel.latestPrice ?? 0))
      view.setSymbol(name: stockModel.symbol ?? "" )
      view.setPriceChange(name: stockModel.calculationPrice ?? "")
    }
  }
}
