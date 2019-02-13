//
//  Message.swift
//  Firebase-Chat
//
//  Created by Iyin Raphael on 2/12/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import Foundation

struct UserMessage {
    
    let name: String
    var message: String
    let date: Date
    let identifier: UUID
    
    init(name: String, message: String, date: Date = Date(), identifier: UUID = UUID()) {
        self.name = name
        self.message = message
        self.date = date
        self.identifier = identifier
    }

    func changeToDict() -> NSDictionary {
        var dict = [String : Any]()
        dict["\(self.name)"] = self.name
        dict["\(self.message)"] = self.message
        dict["\(self.date)"] = self.date.description
        dict["\(self.identifier)"] = self.identifier.uuidString
        return dict as NSDictionary
    }
    
    init(snapshot: Any) {
        self = snapshot as! UserMessage
    }
    
    
}

