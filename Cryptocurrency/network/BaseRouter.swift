//
//  File.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation
struct HTTPHeader {
    var field: String
    var value: String
}

enum HTTPMethod: String {
    case get
    case post
    case put
}

protocol BaseRouter {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpBody: Data? { get }
    var queryParameters: [URLQueryItem]? { get }
    var headers: [HTTPHeader]? { get }
}

extension BaseRouter {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "pro-api.coinmarketcap.com"
    }
    
    func getUrlRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryParameters
        
        let url = urlComponents.url!
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = httpMethod.rawValue.uppercased()
        urlRequest.httpBody = httpBody
        headers?.forEach({ header in
            urlRequest.addValue(header.value, forHTTPHeaderField: header.field)
        })
        return urlRequest
    }
}
