//
//  RAGuestDataSourceDiskRealm.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
import RealmSwift

class RAGuestDataSourceDiskRealm: RAGuestDataSourceDisk {
    // Get the default Realm
    let realm: Realm
    
    convenience init() {
        // You only need to do this once (per thread)
        self.init(realm: try! Realm())
    }
    
    init(realm: Realm) {
        // You only need to do this once (per thread)
        self.realm = realm
    }

    func addGuest(guest: RAGuest) -> RAGuest {
        
        let guestDisk = RAGuestDiskRealmMapper.modelToData(guest)
        
        try! realm.write {
            self.realm.add(guestDisk)
        }
        
        return RAGuestDiskRealmMapper.dataToModel(guestDisk)
    }
    
    func getAllGuest() -> [ RAGuest ] {
        let guestDiskResult: Results<RAGuestDiskRealm> = self.realm.objects(RAGuestDiskRealm)
        
        let guests = guestDiskResult.map { $0 }
        
        return RAListMapper<RAGuestDiskRealmMapper>.dataToModel(guests)
    }
    
    func removeGuest(guest: RAGuest) -> Bool {
        let guestDisk = self.realm.objects(RAGuestDiskRealm).filter("id = '\(guest.id)'").first

        if let _ = guestDisk {
            try! realm.write {
                self.realm.delete(guestDisk!)
            }
        }
        
        return guestDisk != nil
    }
}