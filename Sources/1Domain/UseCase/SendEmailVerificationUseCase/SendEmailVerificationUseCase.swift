//  Created by Alessandro Comparini on 15/07/24.
//

public protocol SendEmailVerificationUseCase {
    func sendEmail(_ email: String) async throws
}
