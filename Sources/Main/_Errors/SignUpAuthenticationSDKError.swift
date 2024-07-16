//  Created by Alessandro Comparini on 12/07/24.
//

public enum SignUpAuthenticationSDKError: Error {
    case emailAlreadyInUse
    case invalidEmail
    case weakPassword
    case unknownError(_ description: String? = nil)
}
