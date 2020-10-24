//
//  GameSession.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import Foundation

final class GameSession {
    
    var questions: [Question]
    var countQuestions: Int {
        questions.count
    }
    var correctAnswers: Int = 0
    var percentCorrectAnswer: Int {
        guard countQuestions > 0 else { return 0 }
        let percent = Double(correctAnswers) / Double(countQuestions)
        return Int(percent)
    }
    var winningSum: Int = 0
    
    var helpCallToFriend: Bool = true
    var helpAudience: Bool = true
    var help50on50: Bool = true
    
    init() {
        questions = Question.example
    }
}
