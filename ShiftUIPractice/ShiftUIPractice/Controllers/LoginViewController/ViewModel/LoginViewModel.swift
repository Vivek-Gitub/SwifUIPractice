//
//  LoginViewModel.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 25/08/23.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
}

class LoginViewModel: ObservableObject {
    
    
    
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
                print("Login Response: \(loginResponse)")
                
                
                print("hello \(loginResponse.message)")
                
                if let email = loginResponse.data?.email , let token = loginResponse.data?.token {
                    print("email is \(email) and token is \(token)")
                }
                break
            case .failure(let error):
                print("API Error: \(error)")
                break
            }
        }
    }
    
    func doLoginApi(email: String, password:String, role:String, completion: @escaping (Result<LoginModel, Error>) -> Void) {
        
        let role = "1"
        
        let urlString  = "https://mean.stagingsdei.com:452/auth/login"
        
        guard let url = URL(string: urlString) else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            
            // Create a URLRequest
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Create a dictionary with the data to send
            let requestData: [String: Any] = [
                "email": email,
                "password": password,
                "role": role
                // ... Include any other parameters required by the API
            ]
            
            do {
                // Convert the dictionary to JSON data
                let requestData = try JSONSerialization.data(withJSONObject: requestData)
                request.httpBody = requestData
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        // Handle network error
                        completion(.failure(error))
                        return
                    }
                    
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let loginResponse = try decoder.decode(LoginModel.self, from: data)
                            completion(.success(loginResponse))
                        } catch {
                            // Handle JSON decoding error
                            completion(.failure(error))
                        }
                    }
                }.resume()
            } catch {
                // Handle serialization error
                completion(.failure(error))
            }
        
    }
}
