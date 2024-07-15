//  Created by Alessandro Comparini on 01/11/23.
//

import AuthenticationSDKDomain

public class LogoutUseCaseGatewayImpl: LogoutUseCaseGateway {
    
    private let logoutAuth: LogoutProvider
    
    public init(logoutAuth: LogoutProvider) {
        self.logoutAuth = logoutAuth
    }
    
    public func logout() throws {
        try logoutAuth.logout()
    }
    
}
