//
//  LogInPage.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 25/08/23.
//

import SwiftUI

struct LogInPageViewController: View {
    
    
    @State var emailTextField:String = ""
    @State var passwordTextField:String = ""
    
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationView {
            
            
            ScrollView {
                VStack {
                        
                        // Header
                        LoginHeaderView()
                            
                        
                        // Login Form
                        VStack  {
                            
                            
                            TextField("Email address", text: $emailTextField)
                                .textFieldStyle(DefaultTextFieldStyle()).padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                .autocapitalization(.none)
        //                        .background(Color.orange)
        //                        .foregroundColor(Color.green)
        //                        .border(Color.black,width: 3)
            
                            
                            
                            SecureField("Password", text: $passwordTextField)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                .autocapitalization(.none)
                                
                            
                            Button {
                                print("hello world \(emailTextField) and \(passwordTextField)")
                                self.loginViewModel.login(withEmail: emailTextField, password: passwordTextField)
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.blue)
                                    Text("Login")
                                        .foregroundColor(Color.white)
                                        .bold()
                                }.frame(height: 50).padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                                    
                            }
                            
                            
                        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                        
                        //Create Account
                        
                        VStack {
                            Text("New around here?")
        //                    Button("Create An account") {
        //                        // show registration Instead we use "NavigationLink"
        //                    }
                            NavigationLink("Create An account", destination: NavigationSwiftUI() )
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                        
                       
                }
            }
            
        }
        
    }
}

struct LogInPage_Previews: PreviewProvider {
    static var previews: some View {
        LogInPageViewController()
    }
}
