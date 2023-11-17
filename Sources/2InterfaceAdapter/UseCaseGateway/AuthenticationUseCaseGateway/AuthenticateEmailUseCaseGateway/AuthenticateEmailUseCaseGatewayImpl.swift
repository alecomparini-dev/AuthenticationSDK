//  Created by Alessandro Comparini on 30/08/23.
//

import Foundation

import AuthDomain


public class AuthenticateEmailUseCaseGatewayImpl: AuthenticateEmailUseCaseGateway {
    private let authenticationEmail: AuthenticationEmailProvider
    
    public init(authenticationEmail: AuthenticationEmailProvider) {
        self.authenticationEmail = authenticationEmail
    }
    
    public func signInEmail(email: String, password: String) async throws -> UserId {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            authenticationEmail.signIn(email: email, password: password) { userId, authError in
                if let authError {
                    continuation.resume(throwing: authError.code)
                    return
                }
                continuation.resume(returning: userId ?? "")
            }
            
        }
        
    }
    
}
