//
//  RAGuestModel.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

class RAGuestModel {
    var id: String
    var name: String
    var email: String
    var phone: String?
    
    init () {
        self.id = ""
        self.name = ""
        self.email = ""
    }
}