//
//  Post.swift
//  FirstCourseFinalTask
//
//  Created by Ilya Sysoi on 10/25/18.
//  Copyright © 2018 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseFinalTaskChecker

class Post: PostProtocol {
    
    var id: PostProtocol.Identifier
    
    var author: GenericIdentifier<UserProtocol>
    
    var description: String
    
    var imageURL: URL
    
    var createdTime: Date
    
    var currentUserLikesThisPost: Bool
    
    var likedByCount: Int
    
    init(id: PostProtocol.Identifier,
         author: GenericIdentifier<UserProtocol>,
         description: String,
         imageURL: URL,
         createdTime: Date,
         currentUserLikesThisPost: Bool,
         likedByCount: Int) {
        
        self.id = id
        self.author = author
        self.description = description
        self.imageURL = imageURL
        self.createdTime = createdTime
        self.currentUserLikesThisPost = currentUserLikesThisPost
        self.likedByCount = likedByCount
        
    }
    
}
