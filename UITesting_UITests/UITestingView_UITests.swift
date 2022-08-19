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
        signUpAndSignIn(shouldTypeOnKeyBoard: true)
        
        //When
        let navBar = app.navigationBars["Welcome!"]
        
        //Then
        XCTAssertTrue(navBar.exists)
        
        
    }
    
    func test_UITestingView_signUpButton_shouldNotSignIn() {
        //Given
        signUpAndSignIn(shouldTypeOnKeyBoard: false)
        
        //When
        let navBar = app.navigationBars["Welcome!"]
        
        //Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        //Given
        signUpAndSignIn(shouldTypeOnKeyBoard: true)
                
        //When
        tapAlertButton(shouldDismissAlert: false)
        
        //Then
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
    }
        
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlertAndDismissAlert() {
        //Given
        signUpAndSignIn(shouldTypeOnKeyBoard: true)
        
        //When
        tapAlertButton(shouldDismissAlert: true)
   
        //Then
        let alertExists = app.alerts.firstMatch.waitForExistence(timeout: 5)
        XCTAssertFalse(alertExists)
    }
    
    func test_SignedInHomeView_NavigationLinkToDestinationButton_shouldNavigateToDestination() {
        
        //Given
        signUpAndSignIn(shouldTypeOnKeyBoard: true)
        
        //When
        tapNavigationLink(shouldDismissDestination: false)
        
        //Then
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
    }
    
    func test_SignedInHomeView_NavigationLinkToDestinationButton_shouldNavigateToDestinationAndGoBack() {
        //Given
        signUpAndSignIn(shouldTypeOnKeyBoard: true)
        
        //When
        tapNavigationLink(shouldDismissDestination: true)
        
        //Then
        let navBar = app.navigationBars["Welcome!"]
        XCTAssertTrue(navBar.exists)
    }
}

extension UITestingView_UITests {
    
    func signUpAndSignIn(shouldTypeOnKeyBoard: Bool) {

            
            let textfield = app.textFields["SignUpTextfield"]
            
            textfield.tap()
            
            if shouldTypeOnKeyBoard {
                let keyA = app.keys["A"]
                keyA.tap()
                
                let keya = app.keys["a"]
                keya.tap()
                keya.tap()
            }
           
            let returnButton = app.buttons["Return"]
            returnButton.tap()
            
            let signUpButton = app.buttons["SignUpButton"]
            signUpButton.tap()
        }
    
    func tapAlertButton(shouldDismissAlert: Bool) {
        let showAlertButton =  app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        if shouldDismissAlert {
            let alert = app.alerts.firstMatch
            let alertOKButton = alert.buttons["OK"]
            
            
            let alertOkButtonExists = alertOKButton.waitForExistence(timeout: 5)
            XCTAssertTrue(alertOkButtonExists)
            
            alertOKButton.tap()
        }
    }
    
    func tapNavigationLink(shouldDismissDestination: Bool) {
        
        let navLinkButton = app/*@START_MENU_TOKEN@*/.buttons["NavigationLinkToDestination"]/*[[".buttons[\"Navigate\"]",".buttons[\"NavigationLinkToDestination\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        navLinkButton.tap()
        
        if shouldDismissDestination {
            let backButton = app.navigationBars.buttons["Welcome!"]
            backButton.tap()
        }
    }
    
}
