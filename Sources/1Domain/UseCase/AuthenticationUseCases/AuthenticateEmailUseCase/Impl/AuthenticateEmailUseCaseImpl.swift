//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

public class AuthenticateEmailUseCaseImpl: AuthenticateEmailUseCase {
    
    private let authEmailGateway: AuthenticateEmailUseCaseGateway
    
    public init(authEmailGateway: AuthenticateEmailUseCaseGateway) {
        self.authEmailGateway = authEmailGateway
    }
    
    public func signIn(email: String, password: String) async throws -> UserId {
        return try await authEmailGateway.signInEmail(email: email, password: password)
    }
        
}
