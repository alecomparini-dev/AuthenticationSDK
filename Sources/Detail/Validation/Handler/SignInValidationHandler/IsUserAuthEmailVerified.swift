//  Created by Alessandro Comparini on 09/07/24.
//

import AuthenticationSDKDomain

func isUserAuthEmailVerified(_ userAuthInfo: UserAuthInfoUseCaseDTO) -> Bool  {
    
    guard let email = userAuthInfo.email,
          let isEmailVerified = userAuthInfo.isEmailVerified else { return false }
    
    if email.isEmpty { return false }
    
    if !isEmailVerified { return false }
    
    return true
}
