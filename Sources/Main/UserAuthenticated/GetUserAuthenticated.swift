//  Created by Alessandro Comparini on 17/07/24.
//

import AuthenticationSDKController
import AuthenticationSDKDomain
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKProviders


class GetUserAuthenticated: UserAuthenticatedProtocol {
    
    private let userAuthProvider: UserAuthenticatedInfoProvider
    
    init(userAuthProvider: UserAuthenticatedInfoProvider) {
        self.userAuthProvider = userAuthProvider
    }
    
    
//  MARK: - PUBLIC AREA
    
    func get(_ refresh: Bool = false) async -> UserAuthInfoControllerDTO? {
        
        let userAuthGateway = UserAuthenticatedUseCaseGatewayImpl(userAuthenticated: userAuthProvider)
        
        let userAuthUseCase = UserAuthenticatedUseCaseImpl(userAuthenticatedGateway: userAuthGateway)
        
        let userAuthController = UserAuthenticatedControllerImpl(userAuthUseCase: userAuthUseCase)
        
        return await userAuthController.getUser(refresh)
    }

}
