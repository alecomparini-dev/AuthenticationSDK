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
        
        let userAuth = try await signInProvider.signIn()
        
        //MAPPER
        
        return UserAuthInfoUseCaseDTO(userID: userAuth.userID)
    }
    
    
}
