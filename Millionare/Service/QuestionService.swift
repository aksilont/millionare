//
//  QuestionService.swift
//  Millionare
//
//  Created by Sky on 27.10.2020.
//

import Foundation

final class QuestionService {
    
    func loadQuestions(_ strategyQuestion: StrategyQuestions) -> [Question] {
        var questions: [Question] = []
        do {
            if let path = Bundle.main.path(forResource: "Questions", ofType: "json"),
               let jsonData = try String(contentsOfFile: path).data(using: .utf8) {
                questions = try JSONDecoder().decode([Question].self, from: jsonData)
            }
        } catch {
            print(error.localizedDescription)
        }
        return strategyQuestion.setOrder(in: questions)
    }
    
}
