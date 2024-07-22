//  Created by Alessandro Comparini on 22/07/24.
//

import AuthenticationSDKDomain

public class SendEmailVerificationUseCaseGatewayImpl: SendEmailVerificationUseCaseGateway {
    
    private let sendEmailProvider: SendEmailVerificationProvider
    
    public init(sendEmailProvider: SendEmailVerificationProvider) {
        self.sendEmailProvider = sendEmailProvider
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func sendEmail(_ email: String) async throws {
        return try await sendEmailProvider.sendEmail(email)
    }
    
    
}
