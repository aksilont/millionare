//
//  QuestionService.swift
//  Millionare
//
//  Created by Sky on 27.10.2020.
//

import Foundation

final class QuestionService {
    
    func loadQuestions(_ strategyQuestion: StrategyQuestions? = nil) -> [Question] {
        var questions: [Question] = []
        do {
            if let path = Bundle.main.path(forResource: "Questions", ofType: "json"),
               let jsonData = try String(contentsOfFile: path).data(using: .utf8) {
                questions = try JSONDecoder().decode([Question].self, from: jsonData)
            }
        } catch {
            print(error.localizedDescription)
        }
        if let strategy = strategyQuestion {
            questions = strategy.setOrder(in: questions)
        }
        return questions + loadCustomQuestions()
    }
    
    func saveCustomQuestions(_ questions: [Question]) {
        let caretaker = Caretaker<Question>()
        caretaker.saveData(entries: questions)
    }
    
    func loadCustomQuestions() -> [Question] {
        let caretaker = Caretaker<Question>()
        return caretaker.loadData()
    }
    
}
