//  Created by Alessandro Comparini on 09/07/24.
//

import AuthDomain

func isUserAuthEmailVerified(_ userAuthInfo: UserAuthInfoUseCaseDTO) -> Bool  {
    
    guard let email = userAuthInfo.email, email.isEmpty else { return false }
    
    if let isEmailVerified = userAuthInfo.isEmailVerified, !isEmailVerified {
        return false
    }
    
    return true
}
