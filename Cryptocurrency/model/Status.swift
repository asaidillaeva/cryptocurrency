//
//  Crypto.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation

struct Status : Codable {
	let timestamp : String?
	let error_code : Int?
	let error_message : String?
	let elapsed : Int?
	let credit_count : Int?

	enum CodingKeys: String, CodingKey {

		case timestamp = "timestamp"
		case error_code = "error_code"
		case error_message = "error_message"
		case elapsed = "elapsed"
		case credit_count = "credit_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
		error_code = try values.decodeIfPresent(Int.self, forKey: .error_code)
		error_message = try values.decodeIfPresent(String.self, forKey: .error_message)
		elapsed = try values.decodeIfPresent(Int.self, forKey: .elapsed)
		credit_count = try values.decodeIfPresent(Int.self, forKey: .credit_count)
	}

}
