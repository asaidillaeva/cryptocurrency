//
//  Quote.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation

struct Quote : Codable {
    let currency : Currency?

    enum CodingKeys: String, CodingKey {
        case currency = "USD"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currency = try values.decodeIfPresent(Currency.self, forKey: .currency)
    }

}
