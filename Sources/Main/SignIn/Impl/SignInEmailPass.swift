
//  Created by Alessandro Comparini on 08/07/24.
//

import AuthenticationSDKDomain
import AuthenticationSDKController
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKValidation


class SignInEmailPass: SignInProtocol {
    
    private let signInEmailPassProvider: SignInEmailPassProvider
    private let email: String
    private let pass: String
    
    init(email: String, pass: String, signInEmailPassProvider: SignInEmailPassProvider) {
        self.signInEmailPassProvider = signInEmailPassProvider
        self.email = email
        self.pass = pass
    }
    
    func signIn() async throws -> UserAuthInfoControllerDTO {
        
        let signInGateway = SignInEmailPassUseCaseGatewayImpl(signInProvider: signInEmailPassProvider)
        
        let signInValidation = SignInEmailPassValidation()
        
        let signInUseCase = SignInEmailPassUseCaseImpl(signInGateway: signInGateway, signInValidation: signInValidation)
        
        let signInController = SignInEmailPassControllerImpl(signInUseCase: signInUseCase)
        
        return try await signInController.signIn(email: email, pass: pass)
    }
    
    
}
