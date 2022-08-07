//
//  CryptoRouter.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation

enum CryptoRouter: BaseRouter {
    case getAll
    case getLogo(id: Int)
    
    
    var path: String {
        switch self {
        case .getAll:
            return "/v1/cryptocurrency/listings/latest"
        case .getLogo(id: _):
            return "/v1/exchange/info"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getAll:
            return .get
        case .getLogo(id: _):
            return .get
        }
    }
    
    var httpBody: Data? {
        switch self {
        case .getAll:
            return nil
        case .getLogo(id: _):
            return nil
        }
    }
    
    var queryParameters: [URLQueryItem]? {
        switch self {
        case .getAll:
            return [URLQueryItem(name: "CMC_PRO_API_KEY", value: "24843aac-f3c5-4bb5-9be4-efd53c9e33bd"),
                    URLQueryItem(name: "start", value: "1"),
                    URLQueryItem(name: "limit", value: "10"),
                    URLQueryItem(name: "convert", value: "USD")]
        case .getLogo(id: let id):
            return [URLQueryItem(name: "CMC_PRO_API_KEY", value: "24843aac-f3c5-4bb5-9be4-efd53c9e33bd"),
                    URLQueryItem(name: "id", value: "\(id)")]
        }
        
    }
    
    var headers: [HTTPHeader]? {
        switch self {
        case .getAll:
            return nil
        case .getLogo(id: _):
            return nil
        }
    }
    
}
