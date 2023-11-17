//  Created by Alessandro Comparini on 17/11/23.
//

import AuthDomain
import AuthUseCaseGateway
import AuthProvider


public extension AuthSDKMain {
    
    func signInEmail(email: String, password: String) async throws -> UserId {
        
        let authenticationEmail = FirebaseAuthEmailProvider()
        
        let authEmailGateway = AuthenticateEmailUseCaseGatewayImpl(authenticationEmail: authenticationEmail)
        
        let authEmailUseCase = AuthenticateEmailUseCaseImpl(authEmailGateway: authEmailGateway)
        
        return try await authEmailUseCase.signIn(email: email, password: password)
    }
    
}
