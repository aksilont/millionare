//
//  QuestionBuilder.swift
//  Millionare
//
//  Created by Sky on 29.10.2020.
//

import Foundation

final class QuestionBuilder {
    
    private(set) var text: String = ""
    private(set) var answers: [Answer] = []
    
    func build() -> [Question] {
        return [Question(text: text, custom: true, answers: answers)]
    }
    
    func setTextQuestion(_ text: String) {
        self.text = text
    }
    
    func addAnswer(_ answer: Answer) {
        self.answers.append(answer)
    }
    
}
