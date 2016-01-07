//
//  RAGuestDataRepository.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

class RAGuestDataRepository: RAGuestRepository {
    
    var guestDataSourceDisk: RAGuestDataSourceDisk!
    
    convenience init () {
        self.init(guestDataSourceDisk: RAGuestDataSourceDiskRealm())
    }
    
    init (guestDataSourceDisk: RAGuestDataSourceDisk) {
        self.guestDataSourceDisk = guestDataSourceDisk
    }

    func addGuest(guest: RAGuest) -> RAGuest {
        return self.guestDataSourceDisk.addGuest(guest)
    }
    
    func getAllGuest() -> [ RAGuest ] {
        return self.guestDataSourceDisk.getAllGuest()
    }
    
    func removeGuest(guest: RAGuest) -> Bool {
        return self.guestDataSourceDisk.removeGuest(guest)
    }
}