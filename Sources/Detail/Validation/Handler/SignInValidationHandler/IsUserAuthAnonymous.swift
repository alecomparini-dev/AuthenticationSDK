//  Created by Alessandro Comparini on 09/07/24.
//

import AuthDomain

func isUserAuthAnonymous(_ userAuthInfo: UserAuthInfoUseCaseDTO) -> Bool  {
    
    if let isAnonymous = userAuthInfo.isAnonymous {
        return isAnonymous
    }
    
    return false
}
