//
//  ContentView.swift
//  UITesting
//
//  Created by Christian Skorobogatow on 15/8/22.
//

import SwiftUI

class UITestingViewModel: ObservableObject {
    
    let placeholder: String = "Add your name..."
    @Published var textfieldText: String = ""
    @Published var currentUserIsSignedIn: Bool = false
    
    func signUpButtonPressed() {
        guard !textfieldText.isEmpty else { return }
        currentUserIsSignedIn = true
    }
    
}

struct UITestingView: View {
    
    @StateObject var vm = UITestingViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue , .black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            
            ZStack {
                if vm.currentUserIsSignedIn {
                    SignInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
                
                if !vm.currentUserIsSignedIn {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UITestingView()
    }
}


extension UITestingView {
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholder, text: $vm.textfieldText)
                .font(.headline)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .accessibilityIdentifier("SignUpTextfield")
            
            Button {
                withAnimation(.spring()) {
                    vm.signUpButtonPressed()
                }
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    .accessibilityIdentifier("SignUpButton")
            }
            
        }
        .padding()
    }
    
}


struct SignInHomeView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Show welcome alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                        .accessibilityIdentifier("ShowAlertButton")
                }
                .alert(isPresented: $showAlert) {
                    return Alert(title: Text("Welcome to the app!"))
                }
                
                NavigationLink(destination: Text("Destination")) {
                    Text("Navigate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
                .accessibilityIdentifier("NavigationLinkToDestination")
            }
            .padding()
            .navigationTitle("Welcome!")
        }
    }
}
