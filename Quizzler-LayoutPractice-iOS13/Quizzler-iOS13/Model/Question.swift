//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Şahin Yürek on 3/2/23.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String

    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
