//
//  QuizModel.swift
//  Quiz
//
//  Created by Paula Almeida on 03/11/15.
//  Copyright © 2015 Paula Almeida. All rights reserved.
//

import Foundation
import UIKit

class Question {
    var strQuestion: String!
    var imgQuestion: UIImage!
    var answers: [Answer]!

    init(question: String, strImageFile :String, answers:[Answer]){
        self.strQuestion = question
        self.imgQuestion = UIImage(named: strImageFile)
        self.answers = answers
    }
}

class Answer {
    var strAnswer : String!
    var isCorrect: Bool!
    
    init (answer : String, isCorrect:Bool){
        self.strAnswer = answer
        self.isCorrect = isCorrect
    }
}