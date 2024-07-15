//  Created by Alessandro Comparini on 14/09/23.
//

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public class FirebaseSignUpEmailPassProvider: SignUpProvider {
    private let auth: Auth
    
    public init(_ auth: Auth = .auth()) {
        self.auth = auth
    }
    
    public func signUp(email: String, pass: String) async throws -> UserAuthInfoGatewayDTO {
        
        if let userAuth = try await linkAnonymousToEmailAuthProviderIfNeeded(email: email, password: pass) {
            return userAuth
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            
            auth.createUser(withEmail: email, password: pass) { result, error in

                if let error = error as? NSError {
                    return continuation.resume(throwing: firebaseToDomainErrorMapper(error).error )
                }

                guard let result else {return continuation.resume(throwing: SetDomainError(code: .unknownError("Sign Up Firebase Result null")).error ) }

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
    
    private func linkAnonymousToEmailAuthProviderIfNeeded(email: String, password: String) async throws -> UserAuthInfoGatewayDTO? {
        
        guard let user = auth.currentUser else { throw SetDomainError(code: .userNotAuthenticated).error }
        
        if !user.isAnonymous { return nil }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        return try await withCheckedThrowingContinuation { continuation in
        
            user.link(with: credential) { result, error in
                
                if let error = error as? NSError {
                    return continuation.resume(throwing: firebaseToDomainErrorMapper(error).error )
                }
                
                guard let result else { return continuation.resume(throwing: SetDomainError(code: .unknownError("Firebase SignIn Result null."))) }
                
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
