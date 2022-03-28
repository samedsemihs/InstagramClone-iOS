//
//  UserPost.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 28.03.2022.
//

import Foundation

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let type: UserPostType
}
