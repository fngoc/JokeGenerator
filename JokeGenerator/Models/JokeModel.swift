//
//  JokeModel.swift
//  JokeGenerator
//
//  Created by Виталий Хайдаров on 01.08.2023.
//

import Foundation

struct JokeModel: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.type = try container.decode(String.self, forKey: .type)
        self.setup = try container.decode(String.self, forKey: .setup)
        self.punchline = try container.decode(String.self, forKey: .punchline)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case setup = "setup"
        case punchline = "punchline"
    }
}
