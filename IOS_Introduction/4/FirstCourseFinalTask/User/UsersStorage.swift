import Foundation
import FirstCourseFinalTaskChecker

class UsersStorage: UsersStorageProtocol {
    
    var currentUserId: GenericIdentifier<UserProtocol>
    var users: [User]
    var followers: [(GenericIdentifier<UserProtocol>, GenericIdentifier<UserProtocol>)]
    
    required init?(users: [UserInitialData],
                   followers: [(GenericIdentifier<UserProtocol>, GenericIdentifier<UserProtocol>)],
                   currentUserID: GenericIdentifier<UserProtocol>) {
        guard users.contains(where: {$0.id == currentUserID}) else {
            return nil
        }
        self.users = users.map { userInitialInfo in
            let user = User(id: userInitialInfo.id,
                            username: userInitialInfo.username,
                            fullName: userInitialInfo.fullName,
                            avatarURL: userInitialInfo.avatarURL,
                            currentUserFollowsThisUser: userInitialInfo.id == currentUserID ? false : followers.contains(where: {
                                $0.0 == currentUserID && $0.1 == userInitialInfo.id }),
                            currentUserIsFollowedByThisUser: userInitialInfo.id == currentUserID ? false : followers.contains(where:{
                                $0.1 == currentUserID && $0.0 == userInitialInfo.id }),
                            followsCount: (followers.filter({ $0.0 == userInitialInfo.id })).count ,
                            followedByCount: (followers.filter( { $0.1 == userInitialInfo.id } )).count )
            return user
        }
        self.followers = followers
        currentUserId = currentUserID
        count = users.count
    }
    
    var count: Int
    
    func currentUser() -> UserProtocol {
        return user(with: currentUserId)!
    }
    
    func user(with userID: GenericIdentifier<UserProtocol>) -> UserProtocol? {
        return users.first(where: {$0.id == userID})
    }
    
    func findUsers(by searchString: String) -> [UserProtocol] {
        return users.compactMap {
            if $0.fullName == searchString ||
                $0.username == searchString {
                return $0
            }
            return nil
        }
    }
    
    func follow(_ userIDToFollow: GenericIdentifier<UserProtocol>) -> Bool {
        guard let user = users.first(where: {$0.id == userIDToFollow}),
            let _currentUser = users.first(where: {$0.id == currentUserId}) else {
            return false
        }
        _currentUser.followsCount += 1
        user.followedByCount += 1
        
        followers.append((currentUserId, userIDToFollow))
        return true
    }
    
    func unfollow(_ userIDToUnfollow: GenericIdentifier<UserProtocol>) -> Bool {
        guard let user = users.first(where: {$0.id == userIDToUnfollow}),
            let _currentUser = users.first(where: {$0.id == currentUserId}) else {
                return false
        }
        _currentUser.followsCount -= 1
        user.followedByCount -= 1
        
        followers.removeAll(where: { $0.0 == currentUserId && $0.1 == userIDToUnfollow})
        return true
    }
    
    func usersFollowingUser(with userID: GenericIdentifier<UserProtocol>) -> [UserProtocol]? {
        guard let user = user(with: userID) else {
            return nil
        }
        var rez: [UserProtocol] = []
        followers.forEach {
            if $0.1 == userID,
                let follower = self.user(with: $0.0) {
                rez.append( follower)
            }
        }
        
        return rez
    }
    
    func usersFollowedByUser(with userID: GenericIdentifier<UserProtocol>) -> [UserProtocol]? {
        guard let user = user(with: userID) else {
            return nil
        }
        var rez: [UserProtocol] = []
        followers.forEach {
            if $0.0 == userID,
                let follower = self.user(with: $0.1) {
                rez.append( follower)
            }
        }
        
        return rez
    }
    
    
}