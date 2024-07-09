//  Created by Alessandro Comparini on 15/09/23.
//

import Foundation


public enum SignUpDomainError: Error {
    case emailAlready
    case emailInvalid
    case errorSignUp
}
