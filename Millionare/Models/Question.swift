//
//  Question.swift
//  Millionare
//
//  Created by Sky on 25.10.2020.
//

import Foundation

struct Question {
    let question: String
    let answers: [String: Bool]
    let winningSum: Int
    
    init(_ question: String, answers: [String: Bool], sum: Int) {
        self.question = question
        self.answers = answers
        self.winningSum = sum
    }
    
    static let example: [Question] = {
        var questions: [Question] = []
        //1.
        questions.append(
            Question("Как правильно продолжить припев детской песни: \"Тили-тили...\"?",
                     answers: [
                        "хали-гали": false,
                        "трали-вали": true,
                        "жили-были": false,
                        "ели-пили": false],
                     sum: 100
            )
        )
        //2.
        questions.append(
            Question("Что понадобится, чтобы взрыхлить землю на грядке?",
                     answers: [
                        "тяпка": true,
                        "бабка": false,
                        "скобка": false,
                        "тряпка": false],
                     sum: 100
            )
        )
        //3.
        questions.append(
            Question("Как называется экзотическое животное из Южной Америки?",
                     answers: [
                        "пчеложор": false,
                        "термитоглот": false,
                        "муравьед": true,
                        "комаролов": false],
                     sum: 100
            )
        )
        //4.
        questions.append(
            Question("Во что превращается гусеница?",
                     answers: [
                        "в мячик": false,
                        "в пирамидку": false,
                        "в машинку": false,
                        "в куколку": true],
                     sum: 100
            )
        )
        //5.
        questions.append(
            Question("К какой группе музыкальных инструментов относится валторна?",
                     answers: [
                        "струнные": false,
                        "клавишные": false,
                        "ударные": false,
                        "духовые": true],
                     sum: 100
            )
        )
        //6.
        questions.append(
            Question("В какой басне Крылова среди действующих лиц есть человек?",
                     answers: [
                        "Лягушка и Вол": false,
                        "Свинья под Дубом": false,
                        "Осел и Соловей": false,
                        "Волк на псарне": true],
                     sum: 100
            )
        )
        //7.
        questions.append(
            Question("Какой фильм сделал знаменитой песню в исполнении Уитни Хьюстон?",
                     answers: [
                        "Красотка": false,
                        "Телохранитель": true,
                        "Форрест Гамп": false,
                        "Пятый элемент": false],
                     sum: 100
            )
        )
        //8.
        questions.append(
            Question("Как на Руси называлась небольшая комната, обычно в верхней части дома?",
                     answers: [
                        "светелка": true,
                        "горелка": false,
                        "огневка": false,
                        "теплушка": false],
                     sum: 100
            )
        )
        //9.
        questions.append(
            Question("Что не входило в обязанности первых стюардесс?",
                     answers: [
                        "заправлять самолет": false,
                        "носить багаж": false,
                        "кормить пассажиров": true,
                        "уничтожать мух": false],
                     sum: 100
            )
        )
        //10.
        questions.append(
            Question("Как называется научное исследование, посвященное одной теме?",
                     answers: [
                        "монография": true,
                        "историография": false,
                        "стенография": false,
                        "литография": false],
                     sum: 100
            )
        )
        
        return questions
    }()
}
