//  Created by Alessandro Comparini on 19/07/24.
//

import AuthenticationSDKDomain

public class ResetPasswordControllerImpl: ResetPasswordController {
    
    private let resetPassUseCase: ResetPasswordUseCase
    
    public init(resetPassUseCase: ResetPasswordUseCase) {
        self.resetPassUseCase = resetPassUseCase
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func reset(_ email: String) async -> Bool {
        return await resetPassUseCase.reset(email)
    }
    
    
}
