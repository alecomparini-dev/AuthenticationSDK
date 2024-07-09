//  Created by Alessandro Comparini on 15/09/23.
//

import Foundation


public enum SignInDomainError: Error {
    case emailAlready
    case emailInvalid
    case passwordInvalid
    case userOrPasswordInvalid
    case userNotAuthenticated
    case errorAuthentication
}
