//  Created by Alessandro Comparini on 15/07/24.
//

public class SendEmailVerificationUseCaseImpl: SendEmailVerificationUseCase {
    
    private let sendEmailGateway: SendEmailVerificationUseCaseGateway
    
    public init(sendEmailGateway: SendEmailVerificationUseCaseGateway) {
        self.sendEmailGateway = sendEmailGateway
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func sendEmail() async throws {
        return try await sendEmailGateway.sendEmail()
    }
    
}
