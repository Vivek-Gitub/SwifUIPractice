//
//  DeliveryLoginView.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 30/08/23.
//

import SwiftUI

struct DeliveryLoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isPasswordImageTapped = false
    @State private var isCheckedBoxImageTapped = false
    
    @StateObject private var deliveryLoginViewModel = DelieveryLoginViewModel()
    
    var body: some View {
        
        ScrollView() {
            VStack(alignment: .center,spacing: 0) {
                
                
                
                ZStack {
                    Image("zomatoo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 301, height: 225)
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: -40, trailing: 0))
                }
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                //.background(Color(.systemPink))
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Welcome  back!")
                        .padding(EdgeInsets(top: 35, leading: 0, bottom: 3, trailing: 0))
                        .font(.system(size: 30, weight: .semibold))
                    Text("Login to your existing account!")
                        
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color(.black))
                    
                    
                    // Email Text Field
                    HStack(alignment: .center) {
                        Image(systemName: "envelope.badge")
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 5))
                        
                        TextField("Email", text: $email)
                            .font(Font.system(size: 20))
                            .autocapitalization(.none)
                            
                            .padding(.trailing)
                        
                    }.frame(height: 40)
                        .border(Color(.black))
                        .cornerRadius(2)
                        .padding(EdgeInsets(top: 50, leading: 15, bottom: 0, trailing: 15))
                    
                    // Password Text Field
                    HStack(alignment: .center) {
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 18, height: 18)
                            
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 10))
                        
                        SecureField("Password", text: $password)
                            .font(Font.system(size: 20))
                            .autocapitalization(.none)
                        
                        Image(systemName: isPasswordImageTapped ? "eye" : "eye.slash")
                            .resizable()
                            .padding(.trailing)
                            .frame(width: 38, height: 15)
                            .onTapGesture {
                                isPasswordImageTapped.toggle()
                                print("eye image tapped")
                            }
                        
                    }.frame(width: .infinity, height: 40)
                        .border(Color(.black))
                        .cornerRadius(2)
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                    
                    
                    HStack {
                        
                        Button {
                            isCheckedBoxImageTapped.toggle()
                            print("Remember me button clicked")
                        } label: {
                            
                            HStack(spacing: 0) {
                                
                                
                                Image(isCheckedBoxImageTapped ? "checkbox-box" : "unchecked-box" )
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .aspectRatio(contentMode: .fill)
                                    .padding(.trailing,5)
                                
                                Text("Remember me")
                                    .foregroundColor(Color.black)
                                    .bold()
                            }
                                
                        }
                        
                        Spacer()
                        
                        // Forgot password button
                        Button {
                            print("Forgot password button clicked")
                        } label: {
                            Text("Forgot password?")
                                .foregroundColor(Color.black)
                                .bold()
                                
                        }
                        
                    }.padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 18))
                    
                    
                    Button {
                        print("Login button clicked")
                        self.deliveryLoginViewModel.login(withEmail: email, password: password)
                    } label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color("CustoRedColor"))
                            Text("LOGIN")
                                .foregroundColor(Color.white)
                                .bold()
                        }.frame(height: 50).padding(EdgeInsets(top: 35, leading: 15, bottom: 0, trailing: 15))
                            
                    }
                    
                    
                    
                    Button {
                        print("Sign up button clicked")
                    } label: {
                        
                        Text("Don't have an account? ")
                            .foregroundColor(Color.black)
                        +
                        
                        Text("Sign up")
                            .foregroundColor(Color.black)
                            .font(.system(size: 19, weight: .bold))
                            
                    }.padding(EdgeInsets(top: 70, leading: 15, bottom: 10, trailing: 15))
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
                .background(
                    ZStack {
                        Color("CustomCreamColor")
                            .opacity(0.8)
                            .blur(radius: 10)
                    }
                )
    //            .background(Color("CustomCreamColor").opacity(0.4))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 6)
                )
                .cornerRadius(20)
                
                
            }
          //  .background(Color(.black))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(EdgeInsets(top: 1, leading: 20, bottom: 1, trailing: 20))
        }
        
    }
}

struct DeliveryLoginView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryLoginView()
    }
}


//struct HStackTextFieldLogin : View {
//    let imageName: String
//    let text: String
//    let variableName: Binding<Any>
//    var body: some View {
//
//    }
//
//}

