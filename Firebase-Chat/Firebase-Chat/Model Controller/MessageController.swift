//
//  MessageController.swift
//  Firebase-Chat
//
//  Created by Iyin Raphael on 2/12/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import Foundation
import Firebase

class MessageController {
    
    var ref: DatabaseReference!
    var chatRooms = [UserMessage]()
    
    
    func chatRoom() -> DatabaseReference {
        return Database.database().reference(withPath: "chat-room")
    }
    
    func createUserMessage(name: String, message: String){
        ref = chatRoom()
        let user = UserMessage(name: name, message: message)
        ref.child(user.name).setValue(user.changeToDict())
    }

    
    func fetchUserMessage() {
        ref = chatRoom()
        ref.observe(.value) { (snapshot) in
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot{
                    let userMessage = UserMessage(snapshot: snapshot)
                    self.chatRooms.append(userMessage)
                }
            }
        }
    }

//    func update(user: User, message: String){
//        var scratch = user
//        scratch.message = message
//    }
    
}
