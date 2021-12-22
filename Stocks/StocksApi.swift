//
//  StocksApi.swift
//  StocksApp
//
//  Created by out-nazarov2-ms on 03.09.2021.
//

import Foundation
import Moya

struct StocksApiResults<T: Decodable>: Decodable {
    let results: [T]
}

enum StocksService {
    case getCompany(abbreviation: String)
}

// MARK: - TargetType Protocol Implementation
extension StocksService: TargetType {
    var baseURL: URL { return URL(string: "https://cloud.iexapis.com")! }
    var path: String {
        switch self {
        case .getCompany(let abbreviation):
            return "/stable/stock/\(abbreviation)/quote"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var task: Task {
        return .requestParameters(parameters: ["token": "pk_dc00350deb7f4cd185825ed171a6ac74" ], encoding: URLEncoding.queryString)
    }
    var sampleData: Data {
        return Data()
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
