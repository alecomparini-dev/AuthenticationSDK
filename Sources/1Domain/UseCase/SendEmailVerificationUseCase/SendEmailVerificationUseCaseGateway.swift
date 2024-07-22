//  Created by Alessandro Comparini on 15/07/24.
//

public protocol SendEmailVerificationUseCaseGateway {
    func sendEmail(_ email: String) async throws
}
