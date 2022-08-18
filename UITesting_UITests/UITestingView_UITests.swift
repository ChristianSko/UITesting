//
//  UITestingView_UITests.swift
//  UITesting_UITests
//
//  Created by Christian Skorobogatow on 17/8/22.
//

import XCTest

class UITestingView_UITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        
        app.launch()
        continueAfterFailure = false
        
    }
    
    override func tearDownWithError() throws {
  
    }
    
    func test_UITestingView_signUpButton_shouldSignIn() {
        //Given
        let textfield = app.textFields["SignUpTextfield"]
        
        //When
        textfield.tap()
        
        let keyA = app.keys["A"]
        keyA.tap()
        
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        
        //Then
        XCTAssertTrue(navBar.exists)
  
                                
    }

    func test_UITestingView_signUpButton_shouldNotSignIn() {
        
    }
    
}
