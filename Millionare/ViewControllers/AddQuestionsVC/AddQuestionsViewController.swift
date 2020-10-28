//
//  AddQuestionsViewController.swift
//  Millionare
//
//  Created by Sky on 28.10.2020.
//

import UIKit

class AddQuestionsViewController: UIViewController {
    
    var questionService = QuestionService()
    var questionsCustom: [Question] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addQuestionTapped(_ sender: Any) {
        
        let alert = UIAlertController(
            title: "Новый вопрос",
            message: nil,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Текст вопроса..."
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Ответ A"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Ответ B"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Ответ C"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Ответ D"
        })
        
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { [weak self] action in
            guard let self = self else { return }
            if let text = alert.textFields?.first?.text {
                let newQuestion = Question(text: text, custom: true,
                                           answers: [Answer(answer: "test", correct: false)])
                self.questionsCustom.append(newQuestion)
                self.tableView.reloadData()
            }

        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadQuestions()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "AddQuestionsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "AddQuestionsTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadQuestions() {
        questionsCustom = questionService.loadQuestions()
    }
    
}

extension AddQuestionsViewController: UITableViewDelegate {
    
}

extension AddQuestionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsCustom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddQuestionsTableViewCell", for: indexPath) as? AddQuestionsTableViewCell
        else { return UITableViewCell() }
        let item = questionsCustom[indexPath.row]
        cell.configure(item: item)
        return cell
    }
}

