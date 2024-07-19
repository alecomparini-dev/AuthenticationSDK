//  Created by Alessandro Comparini on 17/07/24.
//

import AuthenticationSDKDomain

public class LogoutControllerImpl: LogoutController {
    
    private let logoutUseCase: LogoutUseCase
    
    public init(logoutUseCase: LogoutUseCase) {
        self.logoutUseCase = logoutUseCase
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func logout() async throws {
        try logoutUseCase.logout()
    }
    
}
