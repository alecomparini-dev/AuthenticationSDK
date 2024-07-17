//  Created by Alessandro Comparini on 18/10/23.
//

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public class FirebaseUserAuthenticatedInfo: UserAuthenticatedInfoProvider {
    
    private let auth: Auth
    
    public init(auth: Auth = .auth()) {
        self.auth = auth
    }
    
    public func get() async -> UserAuthInfoGatewayDTO? {
        
        guard let currentUserID: String = auth.currentUser?.uid else { return nil }
        
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
