//  Created by Alessandro Comparini on 31/10/23.
//

import AuthenticationSDKDomain

public class ResetPasswordUseCaseGatewayImpl: ResetPasswordUseCaseGateway {

    private let resetPassword: ResetPasswordProvider
    
    public init(resetPassword: ResetPasswordProvider) {
        self.resetPassword = resetPassword
    }

    
//  MARK: - PUBLIC AREA
    
    public func reset(_ email: String) async -> Bool {
        return await resetPassword.reset(email)
    }
    
}
