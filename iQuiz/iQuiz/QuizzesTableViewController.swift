//
//  QuizzesTableViewController.swift
//  iQuiz
//
//  Created by Matt Bond on 11/4/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit
import Foundation

class QuizzesTableViewController: UITableViewController {
    var urlString: String = "https://tednewardsandbox.site44.com/questions.json"
    @IBOutlet var quizTableView: UITableView!
    var quizzes: [String] = ["Math", "Science", "Marvel Superheroes"]
    var quizzesDescription: [String] = ["Improve your math skills with this fun quiz!", "Test your knowledge about science!", "Try this fun quiz about Marvel superheroes!"]
    var quizImages: [UIImage] = [UIImage(named: "science")!, UIImage(named: "superhero")!, UIImage(named: "math")!]
    var quizQuestions: [String] = ["filler"]
    var questionAnswers: [String] = ["filler"]
    var questionChoices: [[String]] = [["filler", "filler", "filler", "filler"]]
    var clicked: Int = 0
    
    @IBAction func settings(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings tab", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Refresh", style: .default, handler: { (_) in
            self.viewDidLoad()
        }))
        
        //http://stackoverflow.com/questions/26567413/get-input-value-from-textfield-in-ios-alert-in-swift
        alert.addTextField { (textField) in
            textField.text = "URL for Questions"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            print(self.urlString)
            self.urlString = (alert.textFields?[0].text)!
            print(self.urlString)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        
        // https://www.youtube.com/watch?v=-ddIP7NRkmY
        let url = URL(string: self.urlString)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error != nil {
                print("ERROR")
            } else {
                if let content = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: content , options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        for i in 0...json.count - 1 {
                            if let current = json[i] as? NSDictionary {
                                if let title = current["title"] {
                                    self.quizzes[i] = title as! String
                                }
                                if let description = current["desc"] {
                                    self.quizzesDescription[i] = description as! String
                                }
                                if let questions = current["questions"] as? NSDictionary {
                                    if let text = questions["text"] as? String {
                                        self.quizQuestions[i] = text
                                    }
                                    if let answer = questions["answer"] as? String {
                                        self.questionAnswers[i] = answer
                                    }
                                    if let answers = questions["answers"] {
                                        self.questionChoices[i] = answers as! [String]
                                    }
                                }
                            }
                        }
                        
                    }
                    catch {
                        print("There seems to have been an error")
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.quizTableView.dequeueReusableCell(withIdentifier: "quizCell") as! QuizTableViewCell
        cell.quizTitle.text = self.quizzes[indexPath.row]
        cell.quizDescription.text = self.quizzesDescription[indexPath.row]
        cell.quizImage.image = self.quizImages[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.clicked = indexPath.row;
    }
    
    // gets data to pass to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "question") {
            let next = (segue.destination as! QuizQuestionViewController)
            print(self.quizQuestions)
            print(clicked)
            print(self.quizQuestions[clicked])
            next.questions[0] = quizQuestions[clicked]
            next.answers[0] = questionChoices[clicked][0]
            next.answers[1] = questionChoices[clicked][1]
            next.answers[2] = questionChoices[clicked][2]
            next.answers[3] = questionChoices[clicked][3]
        }
    }    
}
