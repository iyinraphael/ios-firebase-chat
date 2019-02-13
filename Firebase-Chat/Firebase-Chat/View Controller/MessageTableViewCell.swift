//
//  MessageTableViewCell.swift
//  Firebase-Chat
//
//  Created by Iyin Raphael on 2/12/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    var userMessage: UserMessage? {
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        if let userMessage = userMessage {
            nameLabel.text = userMessage.name
            dateLabel.text = userMessage.date.description
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
}
