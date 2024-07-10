//  Created by Alessandro Comparini on 18/10/23.
//

public struct UserAuthInfoUseCaseDTO {
    public let userID: String
    public let email: String?
    public var isAnonymous: Bool?
    public var isEmailVerified: Bool?
    public var phoneNumber: String?
    public var displayName: String?
    public var photoURL: String?
    
    public init(userID: String,
                email: String? = nil,
                isAnonymous: Bool? = false,
                isEmailVerified: Bool? = false,
                phoneNumber: String? = nil,
                displayName: String? = nil,
                photoURL: String? = nil) {
        self.userID = userID
        self.email = email
        self.isAnonymous = isAnonymous
        self.isEmailVerified = isEmailVerified
        self.phoneNumber = phoneNumber
        self.displayName = displayName
        self.photoURL = photoURL
    }
        
    
}
