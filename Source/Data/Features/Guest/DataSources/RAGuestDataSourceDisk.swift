//
//  RAGuestDataSourceDisk.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation

protocol RAGuestDataSourceDisk {
    func addGuest(guest: RAGuest) -> RAGuest
    
    func getAllGuest() -> [ RAGuest ]
    
    func removeGuest(guest: RAGuest) -> Bool
}