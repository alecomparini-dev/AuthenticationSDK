//  Created by Alessandro Comparini on 11/07/24.
//

public enum SignInError: Error {
    case emailOrPassInvalid
    case unverifiedEmail
    case unknownError(_ description: String? = nil)
}
