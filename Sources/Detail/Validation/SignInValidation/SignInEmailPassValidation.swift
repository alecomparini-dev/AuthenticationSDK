//  Created by Alessandro Comparini on 09/07/24.
//

import AuthenticationSDKDomain

public class SignInEmailPassValidation: SignInValidation {
    
    public init() {}
    
    public func validate(userAuthInfo: UserAuthInfoUseCaseDTO) throws {
       
        if isUserAuthAnonymous(userAuthInfo) {
            throw DomainError.emailOrPassInvalid
        }
        
        if !isUserAuthEmailVerified(userAuthInfo) {
            throw DomainError.unverifiedEmail
        }
        
    }

}
