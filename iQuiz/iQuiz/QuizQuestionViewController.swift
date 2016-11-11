//
//  QuizQuestionViewController.swift
//  iQuiz
//
//  Created by Matt Bond on 11/7/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class QuizQuestionViewController: UIViewController {
    var questions: [String] = ["filler"]
    var answers: [String] = ["filler", "filler", "filler", "filler"]
    var answerChoice: Int = 0
    
    @IBOutlet weak var boxOne: UIButton!
    @IBOutlet weak var boxTwo: UIButton!
    @IBOutlet weak var boxThree: UIButton!
    @IBOutlet weak var boxFour: UIButton!
    
    var isBoxOneClicked: Bool = false
    var isBoxTwoClicked: Bool = false
    var isBoxThreeClicked: Bool = false
    var isBoxFourClicked: Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Label: UILabel!
    @IBOutlet weak var answer2Label: UILabel!
    @IBOutlet weak var answer3Label: UILabel!
    @IBOutlet weak var answer4Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[0]
        answer1Label.text = answers[0]
        answer2Label.text = answers[1]
        answer3Label.text = answers[2]
        answer4Label.text = answers[3]
        // Do any additional setup after loading the view.
    }
    
    // indicates to the user this is their choice
    //https://www.youtube.com/watch?v=F3N_6i0qtA0
    @IBAction func choiceOne(_ sender: UIButton) {
        if isBoxOneClicked == true {
            isBoxOneClicked = false
        } else {
            isBoxOneClicked = true
        }
        
        if isBoxOneClicked == true {
            boxOne.backgroundColor = UIColor.green
            boxTwo.backgroundColor = UIColor.red
            boxThree.backgroundColor = UIColor.red
            boxFour.backgroundColor = UIColor.red
            isBoxTwoClicked = false
            isBoxThreeClicked = false
            isBoxFourClicked = false
            answerChoice = 0
        } else {
            boxOne.backgroundColor = UIColor.red
        }
    }
    
    // indicates to the user this is their choice
    //https://www.youtube.com/watch?v=F3N_6i0qtA0
    @IBAction func choiceTwo(_ sender: UIButton) {
        if isBoxTwoClicked == true {
            isBoxTwoClicked = false
        } else {
            isBoxTwoClicked = true
        }
        
        if isBoxTwoClicked == true {
            boxOne.backgroundColor = UIColor.red
            boxTwo.backgroundColor = UIColor.green
            boxThree.backgroundColor = UIColor.red
            boxFour.backgroundColor = UIColor.red
            isBoxOneClicked = false
            isBoxThreeClicked = false
            isBoxFourClicked = false
            answerChoice = 1
        } else {
            boxTwo.backgroundColor = UIColor.red
        }
    }
    
    // indicates to the user this is their choice
    //https://www.youtube.com/watch?v=F3N_6i0qtA0
    @IBAction func choiceThree(_ sender: UIButton) {
        if isBoxThreeClicked == true {
            isBoxThreeClicked = false
        } else {
            isBoxThreeClicked = true
        }
        
        if isBoxThreeClicked == true {
            boxOne.backgroundColor = UIColor.red
            boxTwo.backgroundColor = UIColor.red
            boxThree.backgroundColor = UIColor.green
            boxFour.backgroundColor = UIColor.red
            isBoxOneClicked = false
            isBoxTwoClicked = false
            isBoxFourClicked = false
            answerChoice = 2
        } else {
            boxThree.backgroundColor = UIColor.red
        }
    }
    
    // indicates to the user this is their choice
    // https://www.youtube.com/watch?v=F3N_6i0qtA0
    @IBAction func choiceFour(_ sender: UIButton) {
        if isBoxFourClicked == true {
            isBoxFourClicked = false
        } else {
            isBoxFourClicked = true
        }
        
        if isBoxFourClicked == true {
            boxOne.backgroundColor = UIColor.red
            boxTwo.backgroundColor = UIColor.red
            boxThree.backgroundColor = UIColor.red
            boxFour.backgroundColor = UIColor.green
            isBoxOneClicked = false
            isBoxTwoClicked = false
            isBoxThreeClicked = false
            answerChoice = 3
        } else {
            boxFour.backgroundColor = UIColor.red
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // takes the user to the home screen where they can select other quizzes
    @IBAction func homeButton(_ sender: Any) {
        // http://stackoverflow.com/questions/33520899/single-function-to-dismiss-all-open-view-controllers-swift
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // gets data to pass to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "answer") {
            let next = (segue.destination as! QuizAnswerViewController)
            next.question = "What is the extent of the Suns gravitational reach?"
            next.userAnswer = answers[answerChoice]
            let correctAnswer = answers[0]
            next.correctAnswer = correctAnswer
            if answers[answerChoice] == correctAnswer {
                next.correctImage = #imageLiteral(resourceName: "check")
                next.totalCorrect += 1
            } else {
                next.correctImage = #imageLiteral(resourceName: "x")
            }
        }
    }
}
