//
//  343.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 8/8/22.
//

import Foundation

struct LogoModel : Codable {
   
   let logo : String?

   enum CodingKeys: String, CodingKey {
       case logo
   }

   init(from decoder: Decoder) throws {
       let values = try decoder.container(keyedBy: CodingKeys.self)
       logo = try values.decodeIfPresent(String.self, forKey: .logo)
    }
}

