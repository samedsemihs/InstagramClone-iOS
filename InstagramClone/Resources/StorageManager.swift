//
//  StorageManager.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 11.03.2022.
//


import FirebaseStorage

class StorageManager {
    
    public enum StorageManagerErrors: Error {
        case failedToDownload
    }
    
    static let shared = StorageManager()
    private let bucket = Storage.storage().reference()
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadPost(with reference: String, completion: @escaping (Result<URL, StorageManagerErrors>) -> Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
       
            completion(.success(url))
            
        })
    }
}

