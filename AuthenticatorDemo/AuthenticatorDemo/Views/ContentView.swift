//
//  ContentView.swift
//  AuthenticatorDemo
//
//  Created by Yavuz Güner on 3.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var authenticationManager = AuthenticatonManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if  authenticationManager.isAuthenticated{
                    VStack(spacing: 40){
                        Title()
                        Text("Welcome in! You are now authenticated.")
                            .foregroundColor(.white)
                            PrimaryButton(showImage: false, text: "Logout")
                            .onTapGesture {
                                authenticationManager.logout()
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(LinearGradient(colors: [.blue,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                }else{
                    LoginView()
                        .environmentObject(authenticationManager)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .alert(isPresented: $authenticationManager.showAlert) {
                Alert(title: Text("Error"),message: Text(authenticationManager.errorDescription ?? "Error trying to login with credentials, please try again"),dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}