//
//  MessageTableViewController.swift
//  Firebase-Chat
//
//  Created by Iyin Raphael on 2/12/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {

    let messageController = MessageController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageController.chatRooms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MessageTableViewCell
        let userMessage = messageController.chatRooms[indexPath.row]
        cell.userMessage = userMessage
        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    }

}
