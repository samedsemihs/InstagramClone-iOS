//
//  DatabaseManager.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 11.03.2022.
//

import FirebaseDatabase

class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    /// Check if username and email is available
    ///  - Parameters:
    ///     - username: String representing username
    ///     - email: String representing email
    ///     - completion: async callback for result if func. is succeeded.
    public func canCreateUser(username: String, email: String, completion: @escaping (Bool) -> Void){
        completion(true)
    }
    
    /// Insert new user information
    ///  - Parameters:
    ///     - username: String representing username.
    ///     - email: String representing user's email address.
    ///     - completion: async callback for result if func. is succeeded.
    public func insertNewUser(username: String, email: String, completion: @escaping (Bool) -> Void) {
        database.child(email.generateDatabaseKey()).setValue(["username": username]){ error, _ in
            if error == nil {
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        }
    }
}
