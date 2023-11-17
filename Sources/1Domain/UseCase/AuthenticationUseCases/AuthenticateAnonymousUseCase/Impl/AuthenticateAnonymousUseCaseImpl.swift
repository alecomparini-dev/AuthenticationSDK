//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

public class AuthenticateAnonymousUseCaseImpl: AuthenticateAnonymousUseCase {
    
    private let authAnonymousGateway: AuthenticateAnonymousUseCaseGateway
    
    public init(authAnonymousGateway: AuthenticateAnonymousUseCaseGateway) {
        self.authAnonymousGateway = authAnonymousGateway
    }
    
    public func signIn() async throws -> UserId? {
        return try await authAnonymousGateway.signInAnonymously()
    }
    
    
}
