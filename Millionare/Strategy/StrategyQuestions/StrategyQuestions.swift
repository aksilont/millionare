//
//  StrategyQuestions.swift
//  Millionare
//
//  Created by Sky on 28.10.2020.
//

import Foundation

protocol StrategyQuestions {
    func setOrder(in questions: [Question]) -> [Question]
}
