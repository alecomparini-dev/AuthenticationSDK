//  Created by Alessandro Comparini on 22/07/24.
//

import AuthenticationSDKDomain

public class SendEmailVerificationControllerImpl: SendEmailVerificationController {
    
    private let sendEmailUseCase: SendEmailVerificationUseCase
    
    public init(sendEmailUseCase: SendEmailVerificationUseCase) {
        self.sendEmailUseCase = sendEmailUseCase
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func sendEmail(_ email: String) async throws {
        return try await sendEmailUseCase.sendEmail(email)
    }
    
    
}
