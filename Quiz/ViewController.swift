//
//  ViewController.swift
//  Quiz
//
//  Created by Paula Almeida on 03/11/15.
//  Copyright © 2015 Paula Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer0: UIButton!
    
    
    @IBOutlet weak var viewFeedback: UIView!
    @IBOutlet weak var lblFeedback: UILabel!
    @IBOutlet weak var btnFeedback: UIButton!
    
    var questions : [Question]!
    var currentQuestion = 0
    var grade = 0.0
    var quizEnded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let q0a0 = Answer(answer:"Concílio", isCorrect: false)
        let q0a1 = Answer(answer:"Acervo", isCorrect: false)
        let q0a2 = Answer(answer:"Tropilha", isCorrect: true)
        let q0a3 = Answer(answer:"Manada", isCorrect: false)
        let q0 = Question(question: "Qual é o coletido de cavalos?", strImageFile: "cavalos", answers: [q0a0, q0a1, q0a2, q0a3])
        
        
        let q1a0 = Answer(answer:"Xilotecade", isCorrect: false)
        let q1a1 = Answer(answer:"Bagagem", isCorrect: true)
        let q1a2 = Answer(answer:"Caravana", isCorrect: false)
        let q1a3 = Answer(answer:"Ror", isCorrect: false)
        let q1 = Question(question: "Qual é o coletido de objetos de viagem?", strImageFile: "bagagem", answers: [q1a0, q1a1, q1a2, q1a3])
        
        let q2a0 = Answer(answer:"Ronda", isCorrect: true)
        let q2a1 = Answer(answer:"Romanceiro", isCorrect: false)
        let q2a2 = Answer(answer:"Cainçalha", isCorrect: false)
        let q2a3 = Answer(answer:"Batalhão", isCorrect: false)
        let q2 = Question(question: "Qual é o coletido de grupo de soldados que percorre as ruas para garantir a ordem?", strImageFile: "ronda", answers: [q2a0, q2a1, q2a2, q2a3])
        
        let q3a0 = Answer(answer:"Milênio", isCorrect: true)
        let q3a1 = Answer(answer:"Tripulação", isCorrect: false)
        let q3a2 = Answer(answer:"Ror", isCorrect: false)
        let q3a3 = Answer(answer:"Baixela", isCorrect: false)
        let q3 = Question(question: "Qual é o coletido de um período de mil anos?", strImageFile: "mil", answers: [q3a0, q3a1, q3a2, q3a3])
       
        let q4a0 = Answer(answer:"Biblioteca", isCorrect: true)
        let q4a1 = Answer(answer:"Catálogo", isCorrect: false)
        let q4a2 = Answer(answer:"Baixela", isCorrect: false)
        let q4a3 = Answer(answer:"Bagagem", isCorrect: false)
        let q4 = Question(question: "Qual é o coletido de livros?", strImageFile: "livros", answers: [q4a0, q4a1, q4a2, q4a3])
        
        let q5a0 = Answer(answer:"Girândola", isCorrect: true)
        let q5a1 = Answer(answer:"Batalhão", isCorrect: false)
        let q5a2 = Answer(answer:"Biblioteca", isCorrect: false)
        let q5a3 = Answer(answer:"Alcateia", isCorrect: false)
        let q5 = Question(question: "Qual é o coletido de foguetes?", strImageFile: "foguete", answers: [q5a0, q5a1, q5a2, q5a3])
        
        /*
        let q0a0 = Answer(answer:"120 anos", isCorrect: true)
        let q0a1 = Answer(answer:"80 anos", isCorrect: false)
        let q0a2 = Answer(answer:"140 anos", isCorrect: false)
        let q0a3 = Answer(answer:"100 anos", isCorrect: false)
        let q0 = Question(question: "Quantos anos vive em média um elefante africano?", strImageFile: "elefante", answers: [q0a0, q0a1, q0a2, q0a3])
        
        
        let q1a0 = Answer(answer:"5,5 m ", isCorrect: true)
        let q1a1 = Answer(answer:"3,5 m", isCorrect: false)
        let q1a2 = Answer(answer:"4,5 m", isCorrect: false)
        let q1a3 = Answer(answer:"6,5 m", isCorrect: false)
        let q1 = Question(question: "Quantos metros em média tem uma girafa macho adulta?", strImageFile: "girafa", answers: [q1a0, q1a1, q1a2, q1a3])
        
        let q2a0 = Answer(answer:"2300 kg", isCorrect: true)
        let q2a1 = Answer(answer:"3300 kg", isCorrect: false)
        let q2a2 = Answer(answer:"4300 kg", isCorrect: false)
        let q2a3 = Answer(answer:"1300 kg", isCorrect: false)
        let q2 = Question(question: "Quanto pesa em média um rinoceronte-branco macho adulto?", strImageFile: "rinoceronte", answers: [q2a0, q2a1, q2a2, q2a3])
        
        let q3a0 = Answer(answer:"64 km/h", isCorrect: true)
        let q3a1 = Answer(answer:"74 km/h", isCorrect: false)
        let q3a2 = Answer(answer:"54 km/h", isCorrect: false)
        let q3a3 = Answer(answer:"84 km/h", isCorrect: false)
        let q3 = Question(question: "Qual a velocidade em que uma zebra corre?", strImageFile: "zebra", answers: [q3a0, q3a1, q3a2, q3a3])
        */
        
        questions = [q0, q1, q2, q3, q4, q5]
        
        startQuiz()
        
    }
    
    func startQuiz(){
        questions.shuffle()
        for(var i=0;i<questions.count;i++){
            questions[i].answers.shuffle()
        }
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0)
        
    }

    func showQuestion(questionId: Int){
        lblQuestion.text = questions[questionId].strQuestion
        imgQuestion.image = questions[questionId].imgQuestion
        btnAnswer0.setTitle(questions[questionId].answers[0].strAnswer, forState: UIControlState.Normal)
        btnAnswer1.setTitle(questions[questionId].answers[1].strAnswer, forState: UIControlState.Normal)
        btnAnswer2.setTitle(questions[questionId].answers[2].strAnswer, forState: UIControlState.Normal)
        btnAnswer3.setTitle(questions[questionId].answers[3].strAnswer, forState: UIControlState.Normal)
        
        btnAnswer0.enabled = true
        btnAnswer1.enabled = true
        btnAnswer2.enabled = true
        btnAnswer3.enabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chooseAnswer0(sender: AnyObject) {
        selectAnswer(0)
    }
    @IBAction func chooseAnswer1(sender: AnyObject) {
        selectAnswer(1)
    }
    
    @IBAction func chooseAnswer2(sender: AnyObject) {
        selectAnswer(2)
    }

    @IBAction func chooseAnswer3(sender: AnyObject) {
        selectAnswer(3)
    }
    
    func selectAnswer(answerId: Int){
        btnAnswer0.enabled = false
        btnAnswer1.enabled = false
        btnAnswer2.enabled = false
        btnAnswer3.enabled = false
        
        viewFeedback.hidden = false
        
        let answer : Answer = questions[currentQuestion].answers[answerId]
        
        if (answer.isCorrect == true){
            grade = grade + 1.0
            lblFeedback.text = answer.strAnswer + "\n\nResposta Correta!"
        } else {
            lblFeedback.text = answer.strAnswer + "\n\nResposta Errada..."
        }
        
        if (currentQuestion < questions.count-1){
            btnFeedback.setTitle("Próxima", forState: UIControlState.Normal)
        } else {
            btnFeedback.setTitle("Ver Nota", forState: UIControlState.Normal)
        }
    }
    @IBAction func btnFeedbackAction(sender: AnyObject) {
        viewFeedback.hidden = true
        
        if (quizEnded){
            startQuiz()
        } else {
            nextQuestion()
        }
    }
    
    func nextQuestion(){
        currentQuestion++
        if (currentQuestion < questions.count){
            showQuestion(currentQuestion)
        } else {
            endQuiz()
        }
        
    }
    
    func endQuiz(){
        grade = grade/Double(questions.count)*100
        quizEnded = true
        viewFeedback.hidden = false
        lblFeedback.text = "Sua nota: \(grade)"
        btnFeedback.setTitle("Refazer", forState: UIControlState.Normal)
    }
}

