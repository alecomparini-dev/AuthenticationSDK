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
        
        try await linkAnonymousToEmailAuthProviderIfNeeded(email: email, password: pass)

        return userAuth
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func linkAnonymousToEmailAuthProviderIfNeeded(email: String, password: String) async throws {
        
        return try await withCheckedThrowingContinuation { continuation in
        
            let credential = EmailAuthProvider.credential(withEmail: email, password: password)
            
            guard let user = auth.currentUser else { return continuation.resume(throwing: SignInError(code: .errorSignIn)) }
            
            if !user.isAnonymous { return }
            
            user.link(with: credential) { result, error in
                
                if let _ = error as? NSError { return continuation.resume(throwing: SignInError(code: .errorSignIn)) }
                
                continuation.resume()
            }
        }
    }
    
    
}
