//
//  RecordCaretaker.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import Foundation

final class RecordCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private var key = "key"
    
    func saveRecords(records: [Record]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([Record].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
