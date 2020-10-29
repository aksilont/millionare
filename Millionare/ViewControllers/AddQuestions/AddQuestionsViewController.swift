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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadQuestions()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "CustomQuestionCell", bundle: nil),
                           forCellReuseIdentifier: "CustomQuestionCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.borderColor = UIColor.white.cgColor
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 2
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomQuestionCell", for: indexPath) as? CustomQuestionCell
        else { return UITableViewCell() }
        let item = questionsCustom[indexPath.row]
        cell.configure(item: item)
        return cell
    }
}

