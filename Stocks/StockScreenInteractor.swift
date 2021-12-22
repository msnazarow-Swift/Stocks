//
//  StockScreenInteractor.swift
//  Stocks
//
//  Created out-nazarov2-ms on 05.09.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Moya
protocol StockScreenInteractorInput: AnyObject {
    func getCompany(abbreviation: String, complition: @escaping (StockModel) -> Void)
}

class StockScreenInteractor: StockScreenInteractorInput {
    let provider = MoyaProvider<StocksService>()
    func getCompany(abbreviation: String, complition: @escaping (StockModel) -> Void) {
        provider.request(.getCompany(abbreviation: abbreviation)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.dataDecodingStrategy = .deferredToData
                    let stockModel = try response.map(StockModel.self, using: decoder, failsOnEmptyData: false)
                    complition(stockModel)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
