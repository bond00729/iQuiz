//
//  QuizTableViewCell.swift
//  iQuiz
//
//  Created by Matt Bond on 11/4/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var quizDescription: UILabel!
}
