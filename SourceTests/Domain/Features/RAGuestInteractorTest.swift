//
//  RAGuestInteractorTest.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/7/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import XCTest
@testable import WhoIsTheGuest

class RAGuestInteractorTest: XCTestCase {
    // MARK: - Properties
    
    var listInteractor: RAListGuestInteractor = RAListGuestInteractor(repository: RAGuestDataRepositoryMock())
    var addInteractor: RAAddGuestInteractor = RAAddGuestInteractor(repository: RAGuestDataRepositoryMock())
    var removeInteractor: RARemoveGuestInteractor = RARemoveGuestInteractor(repository: RAGuestDataRepositoryMock())
    var guest: RAGuest?

    // MARK: - Set Up & Tear
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testListInteractorIsInitializedWithDataEmpty() {
        
        try! self.listInteractor.result { (resultObject) -> () in
            XCTAssertNotNil(resultObject, "Guest list cannot be nil")
        }
    }
    
    func testAddInteractor() {
        
        var guest: RAGuest = RAGuest()
        guest.name = "Rafael Amaro"
        guest.email = "contact@rafaelamaro.com"
        guest.phone = "+1-333-333-3333"
        
        self.addInteractor.setGuest(guest)
        
        try! self.addInteractor.result({ (resultObject) -> () in
            XCTAssertNotNil(resultObject, "Guest cannot be nil")
        })
    }

    func testRemoveInteractor() {

        try! self.listInteractor.result({ (resultObject) -> () in
            XCTAssertTrue(resultObject.first != nil, "Not found any guest")
            
            if let _ = resultObject.first {
                self.removeInteractor.setGuest(resultObject.first!)
                
                try! self.removeInteractor.result({ (resultObject) -> () in
                    XCTAssertTrue(resultObject, "Guest is not delete")
                })
            }
        })
    }
}