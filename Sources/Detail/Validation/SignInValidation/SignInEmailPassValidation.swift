//  Created by Alessandro Comparini on 09/07/24.
//

import AuthDomain

public class SignInEmailPassValidation: SignInValidation {
    
    public init() {}
    
    public func validate(userAuthInfo: UserAuthInfoUseCaseDTO) throws {
       
        if isUserAuthAnonymous(userAuthInfo) {
            throw SignInDomainError.errorSignIn
        }
        
        if !isUserAuthEmailVerified(userAuthInfo) {
            throw SignInDomainError.errorSignIn
        }
        
    }

    
}
