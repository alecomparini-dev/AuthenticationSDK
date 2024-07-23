//  Created by Alessandro Comparini on 22/07/24.
//

import AuthenticationSDKController
import AuthenticationSDKDomain
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKProviders

public class SendEmailVerification {
    
    public init() {}
    
    
//  MARK: - PUBLIC AREA
    
    public func send(_ email: String, _ provider: SendEmailVerificationProvider = FirebaseSendEmailVerification()) async throws {
        
        let sendEmailGateway = SendEmailVerificationUseCaseGatewayImpl(sendEmailProvider: provider)
        
        let sendEmailUseCase = SendEmailVerificationUseCaseImpl(sendEmailGateway: sendEmailGateway)
        
        let sendEmailController = SendEmailVerificationControllerImpl(sendEmailUseCase: sendEmailUseCase)
        
        return try await sendEmailController.sendEmail(email)
    }
    
}
