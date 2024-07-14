//  Created by Alessandro Comparini on 14/09/23.
//

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public class FirebaseSignUpEmailPassProvider: SignUpProvider {
    private let auth: Auth
    private let email: String
    private let pass: String
    
    public init(email: String, pass: String, _ auth: Auth = .auth()) {
        self.email = email
        self.pass = pass
        self.auth = auth
    }
    
    public func signUp() async throws -> UserAuthInfoGatewayDTO {
        
        let currentUser = auth.currentUser
        
        let userAuth: UserAuthInfoGatewayDTO = try await withCheckedThrowingContinuation { continuation in
            
            auth.createUser(withEmail: email, password: pass) { result, error in
                
                if let _ = error as? NSError {
                    return continuation.resume(throwing: SignInError(code: .errorSignIn))
                }
                
                guard let result else {return continuation.resume(throwing: SignInError(code: .errorSignIn))}
                
                let userAuth = UserAuthInfoGatewayDTO (
                    userID: result.user.uid,
                    email: result.user.email,
                    isAnonymous: result.user.isAnonymous,
                    isEmailVerified: result.user.isEmailVerified
                )
                
                continuation.resume(returning: userAuth)
            }
        }
            
        try await linkAnonymousToEmailAuthProviderIfNeeded(user: currentUser, email: email, password: pass)
        
        return userAuth
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func linkAnonymousToEmailAuthProviderIfNeeded(user: User?, email: String, password: String) async throws  {
        
        guard let user, user.isAnonymous else {return}
        
        return try await withCheckedThrowingContinuation { continuation in
        
            let credential = EmailAuthProvider.credential(withEmail: email, password: password)
            
            user.link(with: credential) { result, error in
                if let _ = error as? NSError { return continuation.resume(throwing: SignInError(code: .errorSignIn)) }
                
                continuation.resume(returning: () )
            }
        }
    }
    
    
}
