//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

import AuthDomain

public class AuthenticateAnonymousUseCaseGatewayImpl: AuthenticateAnonymousUseCaseGateway {
    
    private let authenticationAnonymous: AuthenticationAnonymousProvider
    
    public init(authenticationAnonymous: AuthenticationAnonymousProvider) {
        self.authenticationAnonymous = authenticationAnonymous
    }
    
    public func signInAnonymously() async throws -> UserId? {
        return try await authenticationAnonymous.signInAnonymously()
    }
    
    
    
    
}
