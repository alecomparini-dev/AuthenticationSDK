
//  Created by Alessandro Comparini on 08/07/24.
//

import AuthenticationSDKDomain
import AuthenticationSDKController
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKValidation


class SignInEmailPass: SignInProtocol {
    
    private let signInEmailPassProvider: SignInProvider
    
    init(signInEmailPassProvider: SignInProvider) {
        self.signInEmailPassProvider = signInEmailPassProvider
    }
    
    func signIn() async throws -> UserAuthInfoControllerDTO {
        
        let signInGateway = SignInUseCaseGatewayImpl(signInProvider: signInEmailPassProvider)
        
        let signInValidation = SignInEmailPassValidation()
        
        let signInUseCase = SignInUseCaseImpl(signInGateway: signInGateway, signInValidation: signInValidation)
        
        let signInController = SignInControllerImpl(signInUseCase: signInUseCase)
        
        return try await signInController.signIn()
    }
    
    
}
