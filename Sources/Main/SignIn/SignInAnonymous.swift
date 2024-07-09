//  Created by Alessandro Comparini on 08/07/24.
//

import AuthDomain
import AuthController
import AuthUseCaseGateway

class SignInAnonymous: SignInProtocol {
    
    private let signInAnonymousProvider: SignInProvider
    
    init(signInAnonymousProvider: SignInProvider) {
        self.signInAnonymousProvider = signInAnonymousProvider
    }
    
    func signIn() async throws -> UserAuthInfoControllerDTO? {
        
        let signInAnonymous = signInAnonymousProvider
        
        let signInGateway = SignInUseCaseGatewayImpl(signInProvider: signInAnonymous)
        
        let signInUseCase = SignInUseCaseImpl(signInGateway: signInGateway)
        
        let signInController = SignInControllerImpl(signInUseCase: signInUseCase)
        
        return try await signInController.signIn()
    }
    
}
