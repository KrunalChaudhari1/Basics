
import Foundation

// MARK: - DataClass
struct DataClass: Codable {
    let publicList: [FriendsList]
    let msg: String
    let friendsLists: [FriendsList]
    let friendsFollowers: Int
    let friends, followers: [Follower]
    let yourList: [FriendsList]
    let yourLikes: [Follower]
    let listYouLike: [FriendsList]
    let status: Int
    let yourTips: [Follower]

    enum CodingKeys: String, CodingKey {
        case publicList
        case msg
        case friendsLists
        case friendsFollowers
        case friends
        case followers
        case yourList
        case yourLikes
        case listYouLike
        case status
        case yourTips
    }
}

// MARK: - Follower
struct Follower: Codable {
    let address, postcode: String
    let followerStatus: Int
    let likeList, followerDescription, authorName: String
    let img: String?
    let tipType: TipType
    let tipID, country: String
    let likeStatus, friendStatus: Int
    let authorID, longitude, latitude, title: String
    let category: String
    let thumb: String?
    let podSetting: PodSetting
    let postDate: String
    let likeDate: String?

    enum CodingKeys: String, CodingKey {
        case address
        case postcode
        case followerStatus
        case likeList
        case followerDescription
        case authorName
        case img
        case tipType
        case tipID
        case country
        case likeStatus
        case friendStatus
        case authorID
        case longitude
        case latitude
        case title
        case category
        case thumb
        case podSetting
        case postDate
        case likeDate
    }
}

enum PodSetting: String, Codable {
    case fun = "FUN"
    case funInspiring = "FUN INSPIRING"
    case inspiring = "INSPIRING"
    case inspiringPractical = "INSPIRING PRACTICAL"
    case middle = "MIDDLE"
    case practical = "PRACTICAL"
    case practicalFun = "PRACTICAL FUN"
}

enum TipType: String, Codable {
    case friends = "friends"
    case tipTypePrivate = "private"
    case tipTypePublic = "public"
}

// MARK: - FriendsList
struct FriendsList: Codable {
    let listLikeCustomer, postedDate, authorName: String
    let permissionStatus: PermissionStatus
    let isAllFriends, friendIDs, listDescription, listName: String
    let isAnyOneCanAdd, authorID: String
    let listLikeStatus: Int
    let listID: String

    enum CodingKeys: String, CodingKey {
        case listLikeCustomer
        case postedDate
        case authorName
        case permissionStatus
        case isAllFriends
        case friendIDs
        case listDescription
        case listName
        case isAnyOneCanAdd
        case authorID
        case listLikeStatus
        case listID
    }
}

enum PermissionStatus: String, Codable {
    case empty = ""
    case permissionStatusPrivate = "private"
    case permissionStatusPublic = "public"
}
