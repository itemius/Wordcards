//
//  Card.swift
//  Wordcards
//
//  Created by itemius on 01.04.2021.
//

import Foundation

class Card {
//    var id: Int!
    var quiz: String!
    var answer: String!
    
    init(quiz: String, answer: String) {
        self.quiz = quiz
        self.answer = answer
    }
}
