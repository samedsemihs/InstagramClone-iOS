//
//  AuthenticationManager.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 11.03.2022.
//

import FirebaseAuth

class AuthenticationManager {
    static let shared = AuthenticationManager()
    
    
    public func registerUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void){
        /*
         - Check if username exists
         - Check if email exists
         */
        
        DatabaseManager.shared.canCreateUser(username: username, email: email) { canCreate in
            /*
             - Create an account
             - Insert account to the database
             */
            
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }
                    
                    //insert into database
                    DatabaseManager.shared.insertNewUser(username: username, email: email) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }else{
                            completion(false)
                            return
                        }
                        
                    }
                }
            }else{
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool)  -> Void){
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
            }
        } else if let username = username {
            print(username)
        }
    }
}
