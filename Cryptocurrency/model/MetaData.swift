//
//  MetaData.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 8/8/22.
//

import Foundation

struct MetaData : Decodable {
    var logoModel : LogoModel?

    private struct CodingKeys: CodingKey {

            // Use for string-keyed dictionary
            var stringValue: String
            init?(stringValue: String) {
                self.stringValue = stringValue
            }

            // Use for integer-keyed dictionary
            var intValue: Int?
            init?(intValue: Int) {
                // We are not using this, thus just return nil
                return nil
            }
        }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        for key in container.allKeys {
        let decodedObject = try container
                .decode(LogoModel.self,
                        forKey: CodingKeys(stringValue: key.stringValue)!)
        logoModel = decodedObject
        }
    }

}


