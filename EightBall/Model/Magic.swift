//
//  Magic.swift
//  EightBall
//
//  Created by Yurii on 18.10.2021.
//

import Foundation

//Structure of Magic mimics JSON respond structure
struct Magic: Codable {
    var magic: Answer
    
    enum CodingKeys: String, CodingKey {
    case magic
    }
}
