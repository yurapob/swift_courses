import Foundation
import FirstCourseFinalTaskChecker

class User: UserProtocol {
    
    var id: UserProtocol.Identifier
    
    var username: String
    
    var fullName: String
    
    var avatarURL: URL?
    
    var currentUserFollowsThisUser: Bool
    
    var currentUserIsFollowedByThisUser: Bool
    
    var followsCount: Int
    
    var followedByCount: Int
    
    init(id: UserProtocol.Identifier,
         username: String,
         fullName: String,
         avatarURL: URL?,
         currentUserFollowsThisUser: Bool,
         currentUserIsFollowedByThisUser: Bool,
         followsCount: Int,
         followedByCount: Int) {
        
        self.id = id
        self.username = username
        self.fullName = fullName
        self.avatarURL = avatarURL
        self.currentUserFollowsThisUser = currentUserFollowsThisUser
        self.currentUserIsFollowedByThisUser = currentUserIsFollowedByThisUser
        self.followsCount = followsCount
        self.followedByCount = followedByCount
        
    }
    
}