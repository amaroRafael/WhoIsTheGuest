//
//  RAGuestDataSourceDiskMockRealm.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/7/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
import RealmSwift
@testable import WhoIsTheGuest

class RAGuestDataSourceDiskMockRealm: RAGuestDataSourceDiskRealm {
    init() {
        super.init(realm: try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm")))
    }
}