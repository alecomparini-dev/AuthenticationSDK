//  Created by Alessandro Comparini on 09/07/24.
//

import AuthDomain

public class SignInAnonymousValidation: SignInValidation {
    
    public init() {}
    
    public func validate(userAuthInfo: UserAuthInfoUseCaseDTO) throws {
        
        if !isUserAuthAnonymous(userAuthInfo) {
            throw SignInDomainError.errorSignIn
        }
        
    }
    
}
