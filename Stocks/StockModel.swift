//
//  StockModel.swift
//  Stocks
//
//  Created by out-nazarov2-ms on 05.09.2021.
//

import Foundation

//{
//  "symbol": "AAPL",
//  "companyName": "Apple Inc.",
//  "primaryExchange": "Nasdaq Global Select",
//  "sector": "Technology",
//  "calculationPrice": "tops",
//  "open": 154,
//  "openTime": 1506605400394,
//  "close": 153.28,
//  "closeTime": 1506605400394,
//  "high": 154.80,
//  "low": 153.25,
//  "latestPrice": 158.73,
//}

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
