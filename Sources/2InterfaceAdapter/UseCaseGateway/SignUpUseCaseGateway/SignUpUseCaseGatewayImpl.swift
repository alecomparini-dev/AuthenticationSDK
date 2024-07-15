//  Created by Alessandro Comparini on 12/07/24.
//

import AuthenticationSDKDomain

public class SignUpUseCaseGatewayImpl: SignUpUseCaseGateway {
    
    private let signUpProvider: SignUpProvider
    
    public init(signUpProvider: SignUpProvider) {
        self.signUpProvider = signUpProvider
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signUp(email: String, pass: String) async throws -> UserAuthInfoUseCaseDTO {
        let userAuthGateway = try await signUpProvider.signUp(email: email, pass: pass )
        
        return UserAuthInfoGatewayMapper().toUserAuthInfoUseCase(userAuthGateway)
    }
    
}
