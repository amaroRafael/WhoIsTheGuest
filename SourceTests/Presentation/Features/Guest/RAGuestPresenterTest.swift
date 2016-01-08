//
//  RAGuestPresenterTest.swift
//  WhoIsTheGuest
//
//  Created by Rafael Luis Neves Amaro on 1/8/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import XCTest
@testable import WhoIsTheGuest

class RAGuestPresenterTest: XCTestCase {
    
    var listView: RAListGuestViewMock?
    
    override func setUp() {
        super.setUp()

        self.listView = RAListGuestViewMock()
        let presenter = RAListGuestPresenterMock(view: self.listView!)
        self.listView!.presenter = presenter
    }
    
    
    override func tearDown() {
        self.listView = nil
        
        super.tearDown()
    }
    
    func testListPresenter() {
        
        XCTAssertNotNil(self.listView, "Need mock view to test presenter")
        
        self.listView!.callLoad { (isShowLoading, isHideLoading, isReceiveGuest, isShowError) -> () in
            XCTAssertTrue(isShowLoading, "Show loading not called")
            XCTAssertTrue(isHideLoading, "Hide loading not called")
            XCTAssertTrue(isReceiveGuest, "Guest list not loaded")
            XCTAssertTrue(!isShowError, "Show error called")
        }
    }
}