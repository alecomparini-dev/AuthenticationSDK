//  Created by Alessandro Comparini on 17/07/24.
//

import AuthenticationSDKController
import AuthenticationSDKDomain
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKProviders


class UserAuthenticated: UserAuthenticatedProtocol {
    
    private let userAuthProvider: UserAuthenticatedInfoProvider
    
    init(userAuthProvider: UserAuthenticatedInfoProvider) {
        self.userAuthProvider = userAuthProvider
    }
    
    
//  MARK: - PUBLIC AREA
    
    func get() async -> UserAuthInfoControllerDTO? {
        
        let userAuthGateway = UserAuthenticatedUseCaseGatewayImpl(userAuthenticated: userAuthProvider)
        
        let userAuthUseCase = UserAuthenticatedUseCaseImpl(userAuthenticatedGateway: userAuthGateway)
        
        let userAuthController = UserAuthenticatedControllerImpl(userAuthUseCase: userAuthUseCase)
        
        return await userAuthController.getUser()
    }

}
