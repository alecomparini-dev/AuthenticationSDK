//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public class FirebaseSignInAnonymous: SignInAnonymousProvider {
    
    private let auth: Auth
    
    public init(auth: Auth = .auth()) {
        self.auth = auth
    }
    
    
    public func signIn() async throws -> UserAuthInfoGatewayDTO {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            auth.signInAnonymously() { result , error  in
                
                if let error = error as? NSError {
                    continuation.resume(throwing: firebaseToDomainErrorMapper(error))
                    return
                }
                
                guard let result else { return continuation.resume(throwing: SetDomainError(code: .unknownError("Firebase SignIn Result null."))) }
                
                let userAuth = UserAuthInfoGatewayDTO (
                    userID: result.user.uid,
                    isAnonymous: result.user.isAnonymous
                )
                
                continuation.resume(returning: userAuth)
            }
        }
    }
    
    
    
    
}
