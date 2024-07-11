//  Created by Alessandro Comparini on 08/07/24.
//

import AuthenticationSDKDomain
import AuthenticationSDKController
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKValidation

class SignInAnonymous: SignInProtocol {
    
    private let signInAnonymousProvider: SignInProvider
    
    init(signInAnonymousProvider: SignInProvider) {
        self.signInAnonymousProvider = signInAnonymousProvider
    }
    
    func signIn() async throws -> UserAuthInfoControllerDTO {
        
        let signInGateway = SignInUseCaseGatewayImpl(signInProvider: signInAnonymousProvider)
        
        let signInValidation = SignInAnonymousValidation()
        
        let signInUseCase = SignInUseCaseImpl(signInGateway: signInGateway, signInValidation: signInValidation)
        
        let signInController = SignInControllerImpl(signInUseCase: signInUseCase)
        
        return try await signInController.signIn()
    }
    
}
