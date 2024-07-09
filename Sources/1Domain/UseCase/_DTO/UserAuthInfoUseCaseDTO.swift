//  Created by Alessandro Comparini on 18/10/23.
//

public struct UserAuthInfoUseCaseDTO {

    public let userID: String
    public let email: String?
    public var phoneNumber: String?
    public var displayName: String?
    public var isEmailVerified: Bool?
    public var imageProfileURL: String?
    
    public init(userID: String,
                email: String? = nil,
                phoneNumber: String? = nil,
                displayName: String? = nil,
                isEmailVerified: Bool? = false,
                imageProfileURL: String? = nil) {
        self.userID = userID
        self.email = email
        self.phoneNumber = phoneNumber
        self.displayName = displayName
        self.isEmailVerified = isEmailVerified
        self.imageProfileURL = imageProfileURL
    }
        
    
}
