//  Created by Alessandro Comparini on 08/07/24.
//

import AuthenticationSDKDomain

public class SignInEmailPassUseCaseGatewayImpl: SignInEmailPassUseCaseGateway {
    
    private let signInProvider: SignInEmailPassProvider
    
    public init(signInProvider: SignInEmailPassProvider) {
        self.signInProvider = signInProvider
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signIn(email: String, pass: String) async throws -> UserAuthInfoUseCaseDTO {
        let userAuthGateway = try await signInProvider.signIn(email: email, pass: pass)
        
        return UserAuthInfoGatewayMapper().toUserAuthInfoUseCase(userAuthGateway)
    }
    
    
}
