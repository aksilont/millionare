//
//  SettingsViewController.swift
//  Millionare
//
//  Created by Sky on 28.10.2020.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var orderSegmentControl: UISegmentedControl!
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setOrderTapped(_ sender: Any) {
        guard let orderSegmentControl = sender as? UISegmentedControl else { return }
        switch orderSegmentControl.selectedSegmentIndex {
        case 0:
            Game.shared.orderQuestion = .inOrder
        case 1:
            Game.shared.orderQuestion = .shuffle
        default:
            return
        }
    }
    
    @IBAction func clearResultsTapped(_ sender: Any) {
        let alert = UIAlertController(
            title: "Уверены, что хотите очистить таблицу результатов?",
            message: nil,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { _ in
            Game.shared.clearRecords()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearCustomQuestions(_ sender: Any) {
        let alert = UIAlertController(
            title: "Уверены, что хотите удалить все пользовательские вопросы?",
            message: nil,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { _ in
            let caretaker = Caretaker<Question>()
            caretaker.clearRecords(type: Question.self)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrderSegmentControl()
    }
    
    private func setOrderSegmentControl() {
        switch Game.shared.orderQuestion {
        case .inOrder:
            orderSegmentControl.selectedSegmentIndex = 0
        case .shuffle:
            orderSegmentControl.selectedSegmentIndex = 1
        }
    }
}
