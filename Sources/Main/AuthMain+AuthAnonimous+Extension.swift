//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

import AuthDomain
import AuthUseCaseGateway
import AuthProvider

public extension AuthenticationMain {
    
    func signInAnonymous() async throws -> UserId? {
        
        let authenticationAnonymous = FirebaseAuthAnonymousProvider()
        
        let authAnonymousGateway = AuthenticateAnonymousUseCaseGatewayImpl(authenticationAnonymous: authenticationAnonymous)
        
        let authAnonymousUseCase = AuthenticateAnonymousUseCaseImpl(authAnonymousGateway: authAnonymousGateway)
        
        return try await authAnonymousUseCase.signIn()
    }
    
}
