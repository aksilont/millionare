//
//  Game.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import Foundation

final class Game {
    static let shared = Game()
    
    private var recordCaretaker = Caretaker<Record>()
    
    private (set) var records: [Record] {
        didSet {
            recordCaretaker.saveRecords(records: records)
        }
    }
    
    var gameSession: GameSession?
    var orderQuestion: OrderQuestions = .inOrder
    
    private init() {
        records = recordCaretaker.loadRecords()
    }
    
    func addRecord(record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        recordCaretaker.clearRecords(type: Record.self)
        records = []
    }
    
}
