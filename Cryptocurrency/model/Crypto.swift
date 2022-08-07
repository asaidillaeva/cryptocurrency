//
//  Crypto.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation
struct Crypto : Codable {
    let id : Int?
    let name : String?
    let symbol : String?
    let slug : String?
    let num_market_pairs : Double?
    let date_added : String?
    let tags : [String]?
    let max_supply : Double?
    let circulating_supply : Double?
    let total_supply : Double?
    let platform : Coin?
    let cmc_rank : Double?
    let self_reported_circulating_supply : Double?
    let self_reported_market_cap : Double?
    let tvl_ratio : String?
    let last_updated : String?
    let quote : Quote?
    
    

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case symbol = "symbol"
        case slug = "slug"
        case num_market_pairs = "num_market_pairs"
        case date_added = "date_added"
        case tags = "tags"
        case max_supply = "max_supply"
        case circulating_supply = "circulating_supply"
        case total_supply = "total_supply"
        case platform = "platform"
        case cmc_rank = "cmc_rank"
        case self_reported_circulating_supply = "self_reported_circulating_supply"
        case self_reported_market_cap = "self_reported_market_cap"
        case tvl_ratio = "tvl_ratio"
        case last_updated = "last_updated"
        case quote = "quote"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        num_market_pairs = try values.decodeIfPresent(Double.self, forKey: .num_market_pairs)
        date_added = try values.decodeIfPresent(String.self, forKey: .date_added)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
        max_supply = try values.decodeIfPresent(Double.self, forKey: .max_supply)
        circulating_supply = try values.decodeIfPresent(Double.self, forKey: .circulating_supply)
        total_supply = try values.decodeIfPresent(Double.self, forKey: .total_supply)
        platform = try values.decodeIfPresent(Coin.self, forKey: .platform)
        cmc_rank = try values.decodeIfPresent(Double.self, forKey: .cmc_rank)
        self_reported_circulating_supply = try values.decodeIfPresent(Double.self, forKey: .self_reported_circulating_supply)
        self_reported_market_cap = try values.decodeIfPresent(Double.self, forKey: .self_reported_market_cap)
        tvl_ratio = try values.decodeIfPresent(String.self, forKey: .tvl_ratio)
        last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
        quote = try values.decodeIfPresent(Quote.self, forKey: .quote)
    }

}
