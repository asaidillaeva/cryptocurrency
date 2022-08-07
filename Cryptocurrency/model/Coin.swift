//
//  BTC.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 5/8/22.
//

import Foundation

struct Coin : Codable {
    let price : Int?
    let volume_24h : Int?
    let volume_change_24h : Int?
    let percent_change_1h : Int?
    let percent_change_24h : Int?
    let percent_change_7d : Int?
    let market_cap : Int?
    let market_cap_dominance : Int?
    let fully_diluted_market_cap : Double?
    let last_updated : String?

    enum CodingKeys: String, CodingKey {

        case price = "price"
        case volume_24h = "volume_24h"
        case volume_change_24h = "volume_change_24h"
        case percent_change_1h = "percent_change_1h"
        case percent_change_24h = "percent_change_24h"
        case percent_change_7d = "percent_change_7d"
        case market_cap = "market_cap"
        case market_cap_dominance = "market_cap_dominance"
        case fully_diluted_market_cap = "fully_diluted_market_cap"
        case last_updated = "last_updated"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        volume_24h = try values.decodeIfPresent(Int.self, forKey: .volume_24h)
        volume_change_24h = try values.decodeIfPresent(Int.self, forKey: .volume_change_24h)
        percent_change_1h = try values.decodeIfPresent(Int.self, forKey: .percent_change_1h)
        percent_change_24h = try values.decodeIfPresent(Int.self, forKey: .percent_change_24h)
        percent_change_7d = try values.decodeIfPresent(Int.self, forKey: .percent_change_7d)
        market_cap = try values.decodeIfPresent(Int.self, forKey: .market_cap)
        market_cap_dominance = try values.decodeIfPresent(Int.self, forKey: .market_cap_dominance)
        fully_diluted_market_cap = try values.decodeIfPresent(Double.self, forKey: .fully_diluted_market_cap)
        last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
    }

}
