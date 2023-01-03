//
//  CredentialsLoginView.swift
//  AuthenticatorDemo
//
//  Created by Yavuz Güner on 3.01.2023.
//

import SwiftUI

struct CredentialsLoginView: View {
    @EnvironmentObject var authenticationManager:AuthenticatonManager
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 40){
            Title()
            TextField("Username", text:$username)
            SecureField("Password", text: $password)
            
            PrimaryButton(showImage: false,text: "Login")
                .onTapGesture{
                    authenticationManager.authenticateWithCredentials(username: username, password: password)
                }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CredentialsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLoginView()
            .environmentObject(AuthenticatonManager())
    }
}
