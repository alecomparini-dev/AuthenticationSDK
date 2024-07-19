//  Created by Alessandro Comparini on 17/07/24.
//

import AuthenticationSDKController
import AuthenticationSDKDomain
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKProviders

class LogoutUserAuthenticated: LogoutUserProtocol {

    private let logoutProvider: LogoutProvider
    
    init(logoutProvider: LogoutProvider) {
        self.logoutProvider = logoutProvider
    }
    
    
//  MARK: - PUBLIC AREA
    
    func logout() async throws {
        
        let logoutGateway = LogoutUseCaseGatewayImpl(logoutAuth: logoutProvider)
        
        let logoutUseCase = LogoutUseCaseImpl(logoutGateway: logoutGateway)
        
        let logoutController = LogoutControllerImpl(logoutUseCase: logoutUseCase)
        
        return try await logoutController.logout()
    }

}
