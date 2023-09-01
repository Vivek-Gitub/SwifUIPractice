//
//  DelieveryLoginViewModel.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 30/08/23.
//

import Foundation


class DelieveryLoginViewModel: ObservableObject {
    
    func isValid(email:String?, password:String?) -> (isValid:Bool ,error: String?){
        guard let mail = email , mail.isValidEmail() else {
            return (false, "Email is invalid")
        }
        
        guard let paswd = password, paswd.count >= 6 else {
            return (false, "Enter valid password")
        }
        
        return (true, nil)
    }
    
    func login(withEmail email:String?, password:String?) {
        let validTuple = isValid(email: email, password: password)
        guard validTuple.isValid , let email = email , let password = password else {
            print(validTuple.error)
            return
        }
        self.loginApi(email, password: password, role: "1")
    }
    
    func loginApi(_ email: String, password: String, role: String) {
        
        self.doLoginApi(email: email, password: password, role: role) { result in
            
            switch result {
            case .success(let loginResponse):
                print("login successfull")
                break
            case .failure(let error):
                print("Failed in login")
                break
            }
        }
        
    }
    
    
    func doLoginApi(email: String, password:String, role:String, completion: @escaping (Result<LoginModel, Error>) -> Void) {
        print("View Model implemet please implement the APi here")
    }
    
}
