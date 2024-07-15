//  Created by Alessandro Comparini on 15/07/24.
//

import AuthenticationSDKDomain

public class SignInAnonymousUseCaseGatewayImpl: SignInAnonymousUseCaseGateway {
    
    private let signInProvider: SignInAnonymousProvider
    
    public init(signInProvider: SignInAnonymousProvider) {
        self.signInProvider = signInProvider
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signIn() async throws -> UserAuthInfoUseCaseDTO {
        let userAuthGateway = try await signInProvider.signIn()
        
        return UserAuthInfoGatewayMapper().toUserAuthInfoUseCase(userAuthGateway)
    }
    
    
}
