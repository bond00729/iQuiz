//
//  QuizAnswerViewController.swift
//  iQuiz
//
//  Created by Matt Bond on 11/10/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class QuizAnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
