//  Created by Alessandro Comparini on 17/07/24.
//

import AuthenticationSDKUseCaseGateway
import AuthenticationSDKController
import AuthenticationSDKProviders


public class UserAuthenticatedManager {
    
    public init() {}
    
    
//  MARK: - PUBLIC AREA
    
    public func get(_ provider: UserAuthenticatedInfoProvider = FirebaseUserAuthenticatedInfo()) async -> UserAuthInfoControllerDTO? {
        return await UserAuthenticated(userAuthProvider: provider).get()
    }
    
    public func logout(_ provider: LogoutProvider = FirebaseLogout()) async throws {
        return try await LogoutUserAuthenticated(logoutProvider: provider).logout()
    }
    
    
}
