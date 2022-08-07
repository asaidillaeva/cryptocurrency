//
//  USD.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation

struct Currency : Codable {
    let price : Double?
    let volume_24h : Double?
    let volume_change_24h : Double?
    let percent_change_1h : Double?
    let percent_change_24h : Double?
    let percent_change_7d : Double?
    let percent_change_30d : Double?
    let percent_change_60d : Double?
    let percent_change_90d : Double?
    let market_cap : Double?
    let market_cap_dominance : Double?
    let fully_diluted_market_cap : Double?
    let tvl : String?
    let last_updated : String?

    enum CodingKeys: String, CodingKey {

        case price = "price"
        case volume_24h = "volume_24h"
        case volume_change_24h = "volume_change_24h"
        case percent_change_1h = "percent_change_1h"
        case percent_change_24h = "percent_change_24h"
        case percent_change_7d = "percent_change_7d"
        case percent_change_30d = "percent_change_30d"
        case percent_change_60d = "percent_change_60d"
        case percent_change_90d = "percent_change_90d"
        case market_cap = "market_cap"
        case market_cap_dominance = "market_cap_dominance"
        case fully_diluted_market_cap = "fully_diluted_market_cap"
        case tvl = "tvl"
        case last_updated = "last_updated"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        volume_24h = try values.decodeIfPresent(Double.self, forKey: .volume_24h)
        volume_change_24h = try values.decodeIfPresent(Double.self, forKey: .volume_change_24h)
        percent_change_1h = try values.decodeIfPresent(Double.self, forKey: .percent_change_1h)
        percent_change_24h = try values.decodeIfPresent(Double.self, forKey: .percent_change_24h)
        percent_change_7d = try values.decodeIfPresent(Double.self, forKey: .percent_change_7d)
        percent_change_30d = try values.decodeIfPresent(Double.self, forKey: .percent_change_30d)
        percent_change_60d = try values.decodeIfPresent(Double.self, forKey: .percent_change_60d)
        percent_change_90d = try values.decodeIfPresent(Double.self, forKey: .percent_change_90d)
        market_cap = try values.decodeIfPresent(Double.self, forKey: .market_cap)
        market_cap_dominance = try values.decodeIfPresent(Double.self, forKey: .market_cap_dominance)
        fully_diluted_market_cap = try values.decodeIfPresent(Double.self, forKey: .fully_diluted_market_cap)
        tvl = try values.decodeIfPresent(String.self, forKey: .tvl)
        last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
    }

}
