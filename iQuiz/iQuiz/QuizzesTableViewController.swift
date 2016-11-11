//
//  QuizzesTableViewController.swift
//  iQuiz
//
//  Created by Matt Bond on 11/4/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class QuizzesTableViewController: UITableViewController {
    @IBOutlet var quizTableView: UITableView!
    var quizzes: [String] = ["Math", "Science", "Marvel Superheroes"]
    var quizzesDescription: [String] = ["Improve your math skills with this fun quiz!", "Test your knowledge about science!", "Try this fun quiz about Marvel superheroes!"]
    var quizImages: [UIImage] = [UIImage(named: "math")!, UIImage(named: "science")!, UIImage(named: "superhero")!]

    
    @IBAction func settings(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings tab", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
}
