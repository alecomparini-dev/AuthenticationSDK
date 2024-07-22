//  Created by Alessandro Comparini on 22/07/24.
//

public protocol SendEmailVerificationController {
    func sendEmail(_ email: String) async throws
}
