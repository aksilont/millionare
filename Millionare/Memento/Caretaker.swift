//
//  Caretaker.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import Foundation

final class Caretaker<T: Codable> {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private var key = "\(T.self)"
    
    func saveRecords(records: [T]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [T] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([T].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func clearRecords(type: T.Type) {
        UserDefaults.standard.setValue(nil, forKey: key)
    }
}

