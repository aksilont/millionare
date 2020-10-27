//
//  Question.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import Foundation

struct Question: Codable {
    let text: String
    let custom: Bool
    let answers: [Answer]
}

struct Answer: Codable {
    let answer: String
    let correct: Bool
}
