//  Created by Alessandro Comparini on 12/07/24.
//

import AuthenticationSDKController
import AuthenticationSDKDomain
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKValidation


class SignUpEmailPass: SignUpEmailPassProtocol {
    
    private let signUpProvider: SignUpProvider
    
    init(signUpEmailPassProvider: SignUpProvider) {
        self.signUpProvider = signUpEmailPassProvider
    }
    
    func signUp(email: String, pass: String) async throws -> UserAuthInfoControllerDTO {
        
        let signUpGateway = SignUpUseCaseGatewayImpl(signUpProvider: signUpProvider)

        let signUpUseCase = SignUpUseCaseImpl(signUpGateway: signUpGateway)

        let signUpController = SignUpControllerImpl(signUpUseCase: signUpUseCase)
        
        return try await signUpController.signUp(email: email, pass: pass)
    }
    
    
}
