//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //object of QuestionBank
    let allQuestions = QuestionBank( )
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // let firstQuestion = allQuestions.list[0]
        //questionLabel.text = firstQuestion.questionText
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if( sender.tag == 1 ){
            pickedAnswer = true
        }
        else{
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion() // for checking the value of the questionNumber variable.
        
    }
    
    
    func updateUI() {
        //scoreLabel.text = "Score : \(score)"
        
        scoreLabel.text = String(score)
        
        progressLabel.text = "\(questionNumber + 1)/13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12{
        questionLabel.text = allQuestions.list[questionNumber].questionText
        
        updateUI() //updates the scorelabel , progressbarlabel and progresslabel.
        
        }
        else{
            print("End of Quiz")
            questionNumber = 0
            let alert = UIAlertController(title: "Awesome", message: "You've completed all the questions , Do you want to Start Over ?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)

        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else{
            ProgressHUD.showError("Wrong")
        }
    }
    
    
    func startOver() {
       questionNumber = 0
        score = 0
       nextQuestion()
    }
    

    
}
