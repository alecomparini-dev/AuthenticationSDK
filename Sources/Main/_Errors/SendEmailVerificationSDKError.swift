//  Created by Alessandro Comparini on 22/07/24.
//

public enum SendEmailVerificationSDKError: Error {
    case invalidEmail
    case userNotAuthenticated
    case expiredEmailLink
    case tooManyRequests
    case networkError
    case unknownError(_ description: String? = nil)
}
