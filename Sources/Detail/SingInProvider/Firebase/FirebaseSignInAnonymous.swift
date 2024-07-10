//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

import AuthDomain
import AuthUseCaseGateway
import FirebaseAuth

public class FirebaseSignInAnonymous: SignInProvider {
    
    private let auth: Auth
    
    public init(auth: Auth = .auth()) {
        self.auth = auth
    }
    
    
    public func signIn() async throws -> UserAuthInfoGatewayDTO {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            auth.signInAnonymously() { result , error  in
                
                if error != nil {
                    continuation.resume(throwing: SignInError(code: .errorSignIn))
                    return
                }
                
                guard let userID = result?.user.uid else {
                    continuation.resume(throwing: SignInError(code: .errorSignIn))
                    return
                }
                
                let userAuth = UserAuthInfoGatewayDTO (
                    userID: userID,
                    isAnonymous: result?.user.isAnonymous
                )
                
                continuation.resume(returning: userAuth)
            }
        }
    }
    
    
    
    
}
