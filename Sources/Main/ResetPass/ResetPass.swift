//  Created by Alessandro Comparini on 19/07/24.
//

import AuthenticationSDKController
import AuthenticationSDKDomain
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKProviders

public class ResetPass {
    
    public init() {}
    
    public func reset(_ email: String,_ provider: ResetPasswordProvider = FirebaseResetPass()) async -> Bool {
        
        let resetPassGateway = ResetPasswordUseCaseGatewayImpl(resetPassword: provider)
        
        let resetPassUseCase = ResetPasswordUseCaseImpl(resetPasswordGateway: resetPassGateway)
        
        let resetPassController = ResetPasswordControllerImpl(resetPassUseCase: resetPassUseCase)
        
        return await resetPassController.reset(email)
    }
    
}
