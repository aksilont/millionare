//
//  ShuffleQuestionsStrategy.swift
//  Millionare
//
//  Created by Sky on 28.10.2020.
//

import Foundation

class ShuffleStrategyQuestions: StrategyQuestions {
    func setOrder(in questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}
