//  Created by Alessandro Comparini on 31/10/23.
//

import AuthenticationSDKDomain

public class ResetPasswordUseCaseGatewayImpl: ResetPasswordUseCaseGateway {

    private let resetPassword: ResetPassword
    
    public init(resetPassword: ResetPassword) {
        self.resetPassword = resetPassword
    }

    public func reset(userEmail: String) async -> Bool {
        return await resetPassword.reset(userEmail: userEmail)
    }
    
}
