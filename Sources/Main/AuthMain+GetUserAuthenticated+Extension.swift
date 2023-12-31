//  Created by Alessandro Comparini on 17/11/23.
//

import AuthController
import AuthDomain
import AuthProvider
import AuthUseCaseGateway

public extension AuthenticationMain {
    
    func getUserAuthenticated(_ userAutenticator: UserAuthenticated = FirebaseUserAuthenticated()) async throws -> String? {
                
        let getUserAuthUserCaseGateway = GetUserAuthenticatedUseCaseGatewayImpl(
            userAuthenticator: userAutenticator)
        
        let getUserAuthUseCase = GetUserAuthenticatedUseCaseImpl(
            getUserAuthenticatedGateway: getUserAuthUserCaseGateway)
        
        let getUserAuthController = GetUserAuthenticatedControllerImpl(
            getUserAuthUseCase: getUserAuthUseCase)
        
        return try await getUserAuthController.getUserAuth()
    }
    
}
