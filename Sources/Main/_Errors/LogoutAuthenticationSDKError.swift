//  Created by Alessandro Comparini on 17/07/24.
//

public enum LogoutAuthenticationSDKError: Error {
    case networkError
    case internalError
    case unknownError(_ description: String? = nil)
}
