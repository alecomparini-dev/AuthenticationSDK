//  Created by Alessandro Comparini on 08/07/24.
//

import AuthDomain


public class SignInUseCaseGatewayImpl: SignInUseCaseGateway {
    
    private let signInProvider: SignInProvider
    
    public init(signInProvider: SignInProvider) {
        self.signInProvider = signInProvider
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signIn() async throws -> UserAuthInfoUseCaseDTO {
        
        let userAuthGateway = try await signInProvider.signIn()
        
        let userAuthUseCase = UserAuthInfoGatewayMapper().toUserAuthInfoUseCase(userAuthGateway)
        
        return userAuthUseCase
    }
    
    
}
