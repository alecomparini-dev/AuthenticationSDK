//  Created by Alessandro Comparini on 21/07/24.
//

import AuthenticationSDKUseCaseGateway
import AuthenticationSDKDomain
import AuthenticationSDKProviders

class UserAuthenticatedUseCaseFactory {
    
    static func make() -> UserAuthenticatedUseCase {
        
        let userAuthProvider = FirebaseUserAuthenticatedInfo()
        
        let userAuthGateway = UserAuthenticatedUseCaseGatewayImpl(userAuthenticated: userAuthProvider)

        return UserAuthenticatedUseCaseImpl(userAuthenticatedGateway: userAuthGateway)
    }
    
}
