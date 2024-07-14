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
        
        if let userAuth = await linkAnonymousToEmailAuthProviderIfNeeded(email: email, password: pass) {
            return userAuth
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            
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
        
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func linkAnonymousToEmailAuthProviderIfNeeded(email: String, password: String) async -> UserAuthInfoGatewayDTO? {
        
        guard let user = auth.currentUser else { return nil }
        
        if !user.isAnonymous { return nil }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        return await withCheckedContinuation { continuation in
        
            user.link(with: credential) { result, error in
                if let _ = error as? NSError { return }
                
                guard let result else { return }
                
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
