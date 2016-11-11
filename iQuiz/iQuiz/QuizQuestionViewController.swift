//
//  QuizQuestionViewController.swift
//  iQuiz
//
//  Created by Matt Bond on 11/7/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class QuizQuestionViewController: UIViewController {
    var questions: [String] = ["question test"]
    var answers: [String] = ["answer test"]
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Label: UILabel!
    @IBOutlet weak var answer2Label: UILabel!
    @IBOutlet weak var answer3Label: UILabel!
    @IBOutlet weak var answer4Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[0]
        answer1Label.text = answers[0]
        answer2Label.text = answers[0]
        answer3Label.text = answers[0]
        answer4Label.text = answers[0]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeButton(_ sender: Any) {
        // http://stackoverflow.com/questions/33520899/single-function-to-dismiss-all-open-view-controllers-swift
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
}
