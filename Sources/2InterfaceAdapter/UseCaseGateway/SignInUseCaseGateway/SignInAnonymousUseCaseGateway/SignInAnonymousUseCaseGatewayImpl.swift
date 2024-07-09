//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

import AuthDomain

public class SignInAnonymousUseCaseGatewayImpl: SignInUseCaseGateway {
    
    private let signInAnonymous: SignInProvider
    
    public init(signInAnonymous: SignInProvider) {
        self.signInAnonymous = signInAnonymous
    }
    
    public func signIn() async throws -> UserAuthInfoUseCaseDTO {
        
        let userAuth = try await signInAnonymous.signIn()
        
        //MAPPER
        
        return UserAuthInfoUseCaseDTO(userID: userAuth.userID)
    }
    
    
    
    
}
