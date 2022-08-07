//
//  Coin'.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 5/8/22.
//

import Foundation

struct Coin: Codable {
    var id : Int?
    var name : String?
    var symbol : String?
    var slug : String?
    var token_address : String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case slug
        case token_address
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        token_address = try values.decodeIfPresent(String.self, forKey: .token_address)
    }
}
