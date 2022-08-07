////
////  343.swift
////  Cryptocurrency
////
////  Created by Aliia Saidillaeva  on 8/8/22.
////
//
//import Foundation
//
//struct 343 : Codable {
//   let id : Int?
//   let name : String?
//   let slug : String?
//   let description : String?
//   let notice : String?
//   let logo : String?
//   let countries : [String]?
//   let fiats : [String]?
//   let urls : Urls?
//   let tags : String?
//   let type : String?
//   let date_launched : String?
//   let is_hidden : Int?
//   let is_redistributable : String?
//   let maker_fee : Int?
//   let taker_fee : Int?
//   let spot_volume_usd : String?
//   let spot_volume_last_updated : String?
//   let weekly_visits : Int?
//
//   enum CodingKeys: String, CodingKey {
//
//       case id = "id"
//       case name = "name"
//       case slug = "slug"
//       case description = "description"
//       case notice = "notice"
//       case logo = "logo"
//       case countries = "countries"
//       case fiats = "fiats"
//       case urls = "urls"
//       case tags = "tags"
//       case type = "type"
//       case date_launched = "date_launched"
//       case is_hidden = "is_hidden"
//       case is_redistributable = "is_redistributable"
//       case maker_fee = "maker_fee"
//       case taker_fee = "taker_fee"
//       case spot_volume_usd = "spot_volume_usd"
//       case spot_volume_last_updated = "spot_volume_last_updated"
//       case weekly_visits = "weekly_visits"
//   }
//
//   init(from decoder: Decoder) throws {
//       let values = try decoder.container(keyedBy: CodingKeys.self)
//       id = try values.decodeIfPresent(Int.self, forKey: .id)
//       name = try values.decodeIfPresent(String.self, forKey: .name)
//       slug = try values.decodeIfPresent(String.self, forKey: .slug)
//       description = try values.decodeIfPresent(String.self, forKey: .description)
//       notice = try values.decodeIfPresent(String.self, forKey: .notice)
//       logo = try values.decodeIfPresent(String.self, forKey: .logo)
//       countries = try values.decodeIfPresent([String].self, forKey: .countries)
//       fiats = try values.decodeIfPresent([String].self, forKey: .fiats)
//       urls = try values.decodeIfPresent(Urls.self, forKey: .urls)
//       tags = try values.decodeIfPresent(String.self, forKey: .tags)
//       type = try values.decodeIfPresent(String.self, forKey: .type)
//       date_launched = try values.decodeIfPresent(String.self, forKey: .date_launched)
//       is_hidden = try values.decodeIfPresent(Int.self, forKey: .is_hidden)
//       is_redistributable = try values.decodeIfPresent(String.self, forKey: .is_redistributable)
//       maker_fee = try values.decodeIfPresent(Int.self, forKey: .maker_fee)
//       taker_fee = try values.decodeIfPresent(Int.self, forKey: .taker_fee)
//       spot_volume_usd = try values.decodeIfPresent(String.self, forKey: .spot_volume_usd)
//       spot_volume_last_updated = try values.decodeIfPresent(String.self, forKey: .spot_volume_last_updated)
//       weekly_visits = try values.decodeIfPresent(Int.self, forKey: .weekly_visits)
//   }
//
//}
//
