//  Created by Alessandro Comparini on 15/07/24.
//

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public class FirebaseSendEmailVerification: SendEmailVerificationProvider {
    
    private let auth: Auth
    
    public init(_ auth: Auth = .auth()) {
        self.auth = auth
    }
    
    public func sendEmail(_ email: String) async throws {

        guard let user = auth.currentUser else { return }
        
        do {
            try await user.sendEmailVerification()
        } catch let error as NSError {
            throw FirebaseErrorToDomainError().mapper(error).error
        }
        
    }
    
}
