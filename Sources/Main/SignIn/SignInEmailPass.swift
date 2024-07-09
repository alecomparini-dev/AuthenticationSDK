
//  Created by Alessandro Comparini on 08/07/24.
//

import AuthDomain
import AuthController
import AuthUseCaseGateway


class SignInEmailPass: SignInProtocol {
    
    private let signInEmailPassProvider: SignInProvider
    
    init(signInEmailPassProvider: SignInProvider) {
        self.signInEmailPassProvider = signInEmailPassProvider
    }
    
    func signIn() async throws -> UserAuthInfoControllerDTO? {
        
        let signInProvedor = signInEmailPassProvider
        
        let signInGateway = SignInUseCaseGatewayImpl(signInProvider: signInProvedor)
        
        let signInUseCase = SignInUseCaseImpl(signInGateway: signInGateway)
        
        let signInController = SignInControllerImpl(signInUseCase: signInUseCase)
        
        return try await signInController.signIn()
    }
    
    
}
