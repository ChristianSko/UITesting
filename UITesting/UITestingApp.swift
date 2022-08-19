//
//  UITestingApp.swift
//  UITesting
//
//  Created by Christian Skorobogatow on 15/8/22.
//

import SwiftUI

@main
struct UITestingApp: App {
    
    let currenUserIsSignedIn: Bool
    
    init() {
        //let userIsSignedIn: Bool = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        let userIsSignedIn: Bool = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true : false
//        let value = ProcessInfo.processInfo.environment["-UITest_startSignedIn2"]
//        let userIsSignedIn: Bool = value == "true" ? true : false
        self.currenUserIsSignedIn = userIsSignedIn
    }
    
    var body: some Scene {
        WindowGroup {
            UITestingView(currentUserSignedIn: currenUserIsSignedIn)
        }
    }
}
