//
//  RAGuestDiskRealmMapper.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/7/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

class RAGuestDiskRealmMapper: RAMapper {
    
    typealias M = RAGuest
    typealias D = RAGuestDiskRealm
    
    static func modelToData(model: M) -> D {
        let guestModel: RAGuestDiskRealm = RAGuestDiskRealm()
        guestModel.id = model.id
        guestModel.name = model.name
        guestModel.email = model.email
        guestModel.phone = model.phone
        
        return guestModel
    }
    
    static func dataToModel(data: D) -> M {
        var guest: RAGuest = RAGuest()
        guest.id = data.id
        guest.name = data.name
        guest.email = data.email
        guest.phone = data.phone
        
        return guest
    }
}