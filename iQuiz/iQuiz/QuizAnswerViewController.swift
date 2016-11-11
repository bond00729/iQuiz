//
//  QuizAnswerViewController.swift
//  iQuiz
//
//  Created by Matt Bond on 11/10/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class QuizAnswerViewController: UIViewController {
    var totalQuestions: Int = 0
    var totalCorrect: Int = 0
    var answerChoice: String = ""
    var question: String = ""
    var userAnswer: String = ""
    var correctAnswer: String = ""
    var correctImage: UIImage? = nil
    
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionImage.image = correctImage
        correctAnswerLabel.text = correctAnswer
        questionLabel.text = question
        userAnswerLabel.text = userAnswer
        correctAnswerLabel.text = correctAnswer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // takes the user to the home screen where they can select other quizzes
    @IBAction func homeButton(_ sender: Any) {
        // http://stackoverflow.com/questions/33520899/single-function-to-dismiss-all-open-view-controllers-swift
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "result") {
            let next = (segue.destination as! QuizResultsViewController)
            next.numberOfQuestions = self.totalQuestions + 1
            next.numberOfCorrect = self.totalCorrect
        }
    }
}
