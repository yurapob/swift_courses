import Foundation
import FirstCourseFinalTaskChecker

class PostsStorage: PostsStorageProtocol {
    
    var currentUserId: GenericIdentifier<UserProtocol>
    var posts: [Post]
    var likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)]
    var count: Int
    
    required init(posts: [PostInitialData], likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)], currentUserID: GenericIdentifier<UserProtocol>) {
        self.posts =  posts.map { postInfo in
            let post = Post(id: postInfo.id,
                            author: postInfo.author,
                            description: postInfo.description,
                            imageURL: postInfo.imageURL,
                            createdTime: postInfo.createdTime,
                            currentUserLikesThisPost: likes.contains(where:{
                                $0.0 == currentUserID && $0.1 == postInfo.id }),
                            likedByCount: likes.filter({ $0.1 == postInfo.id }).count)
            return post
        }
        
        self.likes = likes
        currentUserId = currentUserID
        count = posts.count
    }
    

    func post(with postID: GenericIdentifier<PostProtocol>) -> PostProtocol? {
        return posts.first(where: {$0.id == postID})
    }
    
    func findPosts(by authorID: GenericIdentifier<UserProtocol>) -> [PostProtocol] {
        return posts.filter {$0.author == authorID}
    }
    
    func findPosts(by searchString: String) -> [PostProtocol] {
        return posts.filter { $0.description == searchString }
    }
    
    func likePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
        guard let post = posts.first(where: { $0.id == postID }) else {
            return false
        }
        if post.currentUserLikesThisPost {
            return true
        }
        post.likedByCount += 1
        post.currentUserLikesThisPost = true
        
        likes.append((currentUserId, postID))
        return true
    }
    
    func unlikePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
        guard let post = posts.first(where: { $0.id == postID }) else {
            return false
        }
        if !post.currentUserLikesThisPost {
            return true
        }
        post.likedByCount -= 1
        post.currentUserLikesThisPost = false
        
        likes.removeAll(where: { $0.0 == currentUserId && $0.1 == postID})
        return true
    }
    
    func usersLikedPost(with postID: GenericIdentifier<PostProtocol>) -> [GenericIdentifier<UserProtocol>]? {
        guard let post = post(with: postID) else {
            return nil
        }
        return likes.compactMap {
            if $0.1 == postID {
                return $0.0
            }
            return nil
        }
    }
    
    
}

