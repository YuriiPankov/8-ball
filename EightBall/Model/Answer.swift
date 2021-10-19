//
//  Answer.swift
//  EightBall
//
//  Created by Yurii on 18.10.2021.
//

import Foundation

struct Answer: Codable {
    var question: String
    var answer: String
    var type: String
    
    enum CodingKeys: String, CodingKey {
        case question
        case answer
        case type
    }
    
    
}
