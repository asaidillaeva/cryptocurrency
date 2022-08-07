//
//  CryptoResponse.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation

class CryptoResponse: Codable {
    let status : Status?
    let crypto : [Crypto]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case crypto = "data"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Status.self, forKey: .status)
        crypto = try values.decodeIfPresent([Crypto].self, forKey: .crypto)
    }

}
