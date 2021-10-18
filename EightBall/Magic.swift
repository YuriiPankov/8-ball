//
//  Magic.swift
//  EightBall
//
//  Created by Yurii on 18.10.2021.
//

import Foundation

struct Magic: Codable {
    var magic: Answer
    
    enum CodingKeys: String, CodingKey {
    case magic
    }
}
