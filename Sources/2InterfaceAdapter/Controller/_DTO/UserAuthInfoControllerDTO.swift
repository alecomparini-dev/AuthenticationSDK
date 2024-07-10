//  Created by Alessandro Comparini on 08/07/24.
//

import Foundation

public struct UserAuthInfoControllerDTO {
    public let userID: String
    public let email: String?
    public let phoneNumber: String?
    public let isEmailVerified: Bool?
    public let displayName: String?
    public let photoURL: String?

    public init(userID: String,
                email: String? = nil,
                phoneNumber: String? = nil,
                isEmailVerified: Bool? = nil,
                displayName: String? = nil,
                photoURL: String? = nil) {
        self.userID = userID
        self.email = email
        self.phoneNumber = phoneNumber
        self.isEmailVerified = isEmailVerified
        self.displayName = displayName
        self.photoURL = photoURL
    }

    
}
