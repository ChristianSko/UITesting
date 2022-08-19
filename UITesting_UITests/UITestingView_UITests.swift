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
        //Given
        let textfield = app.textFields["SignUpTextfield"]
        
        //When
        textfield.tap()
                
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        
        //Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        //Given
        let textfield = app.textFields["SignUpTextfield"]
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
        
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton =  app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
        
        let alertOKButton = alert.buttons["OK"]
//        XCTAssertTrue(alertOKButton.exists)
        
        let alertOkExists = alertOKButton.waitForExistence(timeout: 5)
        XCTAssertTrue(alertOkExists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlertAndDismissAlert() {
        //Given
        let textfield = app.textFields["SignUpTextfield"]
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
        
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton =  app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
        
        let alertOKButton = alert.buttons["OK"]
//        XCTAssertTrue(alertOKButton.exists)
        
        let alertOkExists = alertOKButton.waitForExistence(timeout: 5)
        XCTAssertTrue(alertOkExists)
        
        alertOKButton.tap()
        let alertExists = alertOKButton.waitForExistence(timeout: 5)
        XCTAssertFalse(alertExists)
        
        //Then
        XCTAssertFalse(alertOKButton.exists)
    }
     
    func test_SignedInHomeView_NavigationLinkToDestinationButton_shouldNavigateToDestination() {
        
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
        
        
        let navLinkButton = app/*@START_MENU_TOKEN@*/.buttons["NavigationLinkToDestination"]/*[[".buttons[\"Navigate\"]",".buttons[\"NavigationLinkToDestination\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        navLinkButton.tap()
        
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
        
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Welcome!"].tap()
             
    }
    
    func test_SignedInHomeView_NavigationLinkToDestinationButton_shouldNavigateToDestinationAndGoBack() {}
    
}
