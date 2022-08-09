//
//  LogoResponse.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 5/8/22.
//

import Foundation
struct LogoResponse : Decodable {
    let status : Status?
    let data : MetaData?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Status.self, forKey: .status)
        data = try values.decodeIfPresent(MetaData.self, forKey: .data)
    }

}
