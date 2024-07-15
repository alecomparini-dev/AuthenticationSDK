//  Created by Alessandro Comparini on 14/09/23.
//

import AuthenticationSDKUseCaseGateway
import FirebaseAuth


public class FirebaseSignInEmailPass: SignInEmailPassProvider {
    private let auth: Auth
    
    public init( _ auth: Auth = .auth()) {
        self.auth = auth
    }
    
    public func signIn(email: String, pass: String) async throws -> UserAuthInfoGatewayDTO {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            auth.signIn(withEmail: email, password: pass) { result, error in
                
                guard let result else { return continuation.resume(throwing: SetDomainError(code: .unknownError("Firebase SignIn Result null."))) }
                
                if let error = error as? NSError {
                    return continuation.resume(throwing: firebaseToDomainErrorMapper(error))
                }
                
                let userAuth = UserAuthInfoGatewayDTO (
                    userID: result.user.uid,
                    email: result.user.email,
                    isAnonymous: result.user.isAnonymous,
                    isEmailVerified: result.user.isEmailVerified
                )
                
                continuation.resume(returning: userAuth)
            }
        }
        
    }
        
    
}
