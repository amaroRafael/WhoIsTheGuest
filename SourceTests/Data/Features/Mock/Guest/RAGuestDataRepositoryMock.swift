//
//  RAGuestDataRepositoryMock.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/7/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import Foundation
@testable import WhoIsTheGuest

class RAGuestDataRepositoryMock: RAGuestDataRepository {
    init() {
        super.init(guestDataSourceDisk: RAGuestDataSourceDiskMockRealm())
    }
}