//
//  RAGuestDiskRealm.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/7/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
import RealmSwift

class RAGuestDiskRealm: Object {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var email: String = ""
    dynamic var phone: String?
}