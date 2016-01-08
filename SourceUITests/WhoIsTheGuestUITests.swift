//
//  WhoIsTheGuestUITests.swift
//  WhoIsTheGuestUITests
//
//  Created by Rafael Luis Neves Amaro on 1/6/16.
//  Copyright © 2016 Rafael Luis Neves Amaro. All rights reserved.
//

import XCTest

class WhoIsTheGuestUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testApp() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let app = XCUIApplication()
        app.navigationBars["Guest List"].buttons["Add"].tap()
        
        let nomeTextField = app.textFields["Name"]
        nomeTextField.tap()
        nomeTextField.typeText("Rafael Amaro")
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("ramaro@mail.com")
        
        let phoneTextField = app.textFields["Phone"]
        phoneTextField.tap()
        
        let shiftKey = app.keys["Shift"]
        shiftKey.tap()
        phoneTextField.typeText("+13333333333")
        app.navigationBars["Add Guest"].buttons["Save"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["Rafael Amaro"].exists, "Rafael Amaro guest not exist")
        
        app.tables.staticTexts["Rafael Amaro"].tap()
        app.buttons["Remove selected"].tap()

        XCTAssertTrue(!app.tables.staticTexts["Rafael Amaro"].exists, "Rafael Amaro guest exist")
        
    }
    
}
