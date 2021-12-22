//
//  StockModel.swift
//  Stocks
//
//  Created by out-nazarov2-ms on 05.09.2021.
//

import Foundation

struct StockModel: Codable {
    let symbol: String?
    let companyName: String?
    let primaryExchange: String?
    let sector: String?
    let calculationPrice: String?
    let open: Double?
    let openTime: Double?
    let close: Double?
    let closeTime: Double?
    let high: Double?
    let low: Double?
    let latestPrice: Double?
}
