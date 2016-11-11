//
//  QuizResultsViewController.swift
//  iQuiz
//
//  Created by Matt Bond on 11/10/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class QuizResultsViewController: UIViewController {
    var numberOfQuestions: Int = 0
    var numberOfCorrect: Int = 0
    
    @IBOutlet weak var rightOverTotal: UILabel!
    @IBOutlet weak var descriptiveText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightOverTotal.text = "\(numberOfCorrect) / \(numberOfQuestions)"
        if numberOfCorrect == numberOfQuestions {
            descriptiveText.text = "Perfect!"
        } else {
            descriptiveText.text = "Good job!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // takes the user to the home screen where they can select other quizzes
    @IBAction func homeButton(_ sender: Any) {
        // http://stackoverflow.com/questions/33520899/single-function-to-dismiss-all-open-view-controllers-swift
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
