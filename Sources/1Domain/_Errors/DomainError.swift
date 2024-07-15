//  Created by Alessandro Comparini on 15/09/23.
//

public enum DomainError: Error {
    case invalidEmail
    case emailOrPassInvalid
    case weakPassword
    case emailAlreadyInUse
    case userNotAuthenticated
    case unverifiedEmail
    case networkError
    case invalidPhoneNumber
    case invalidVerificationSMSCode
    case internalError
    case unknownError(_ description: String? = nil)
}
