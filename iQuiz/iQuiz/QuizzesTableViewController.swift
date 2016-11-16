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
    @IBOutlet var quizTableView: UITableView!
    var quizzes: [String] = ["Math", "Science", "Marvel Superheroes"]
    var quizzesDescription: [String] = ["Improve your math skills with this fun quiz!", "Test your knowledge about science!", "Try this fun quiz about Marvel superheroes!"]
    var quizImages: [UIImage] = [UIImage(named: "science")!, UIImage(named: "superhero")!, UIImage(named: "math")!]
    var quizQuestions: [String] = []
    var questionAnswers: [String] = []
    var questionChoices: [[String]] = []
    
    @IBAction func settings(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings tab", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        
        let url = URL(string: "https://tednewardsandbox.site44.com/questions.json")
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
                                        self.quizQuestions.append(text)
                                    }
                                    if let answer = questions["answer"] as? String {
                                        self.questionAnswers.append(answer)
                                    }
                                    if let answers = questions["answers"] {
                                        self.questionChoices.insert((answers as! [String]), at: self.questionChoices.count)
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
    
    // gets data to pass to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "question") {
            let next = (segue.destination as! QuizQuestionViewController)
            print(self.quizQuestions)
            next.questions = self.quizQuestions
            next.answers.removeAll()
            next.answers.append("The Oort cloud")
            next.answers.append("Heliosphere")
            next.answers.append("Pluto")
            next.answers.append("The Kuiper Belt")
        }
    }    
}
