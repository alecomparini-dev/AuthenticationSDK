//  Created by Alessandro Comparini on 18/10/23.
//

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public class FirebaseUserAuthInfo: UserAuthInfo {
    
    private let auth: Auth
    
    public init(auth: Auth = .auth()) {
        self.auth = auth
    }
    
    public func getInfo() throws -> UserAuthInfoGatewayDTO {
        
        guard let currentUserID: String = auth.currentUser?.uid else {
            throw SignInError(code: .userNotAuthenticated)
        }
        
        return UserAuthInfoGatewayDTO (
            userID: currentUserID,
            email: auth.currentUser?.email,
            isAnonymous: auth.currentUser?.isAnonymous,
            isEmailVerified: auth.currentUser?.isEmailVerified ?? false,
            phoneNumber: auth.currentUser?.phoneNumber,
            displayName: auth.currentUser?.displayName,
            photoURL: auth.currentUser?.photoURL?.description
        )
        
    }
    
    
    
    
}
