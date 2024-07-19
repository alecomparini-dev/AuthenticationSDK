//  Created by Alessandro Comparini on 08/07/24.
//

import AuthenticationSDKDomain
import AuthenticationSDKController
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKProviders
import AuthenticationSDKValidation

class SignInAnonymous: SignInProtocol {
    
    private let signInAnonymousProvider: SignInAnonymousProvider
    
    init(signInAnonymousProvider: SignInAnonymousProvider) {
        self.signInAnonymousProvider = signInAnonymousProvider
    }
    
    func signIn() async throws -> UserAuthInfoControllerDTO {
        
        let userAuthProvider = FirebaseUserAuthenticatedInfo()
        
        let userAuthGateway = UserAuthenticatedUseCaseGatewayImpl(userAuthenticated: userAuthProvider)
        
        let userAuthUseCase = UserAuthenticatedUseCaseImpl(userAuthenticatedGateway: userAuthGateway)

        let signInGateway = SignInAnonymousUseCaseGatewayImpl(signInProvider: signInAnonymousProvider)
        
        let signInValidation = SignInAnonymousValidation()

        let signInUseCase = SignInAnonymousUseCaseImpl(userAuth: userAuthUseCase,
                                                       signInGateway: signInGateway,
                                                       signInValidation: signInValidation)
        
        let signInController = SignInAnonymousControllerImpl(signInUseCase: signInUseCase)
        
        return try await signInController.signIn()
    }
    
}
