//  Created by Alessandro Comparini on 14/09/23.
//

import AuthenticationSDKUseCaseGateway
import AuthenticationSDKErrorProvider
import FirebaseAuth

public class FirebaseSignUpEmailPassProvider: SignUpProvider {
    private let auth: Auth
    
    public init(_ auth: Auth = .auth()) {
        self.auth = auth
    }
    
    public func signUp(email: String, pass: String) async throws -> UserAuthInfoGatewayDTO {
        
        if let userAuth = await linkAnonymousToEmailAuthProviderIfNeeded(email: email, password: pass) {
            return userAuth
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            
            auth.createUser(withEmail: email, password: pass) { result, error in

                if let error = error as? NSError {
                    return continuation.resume(throwing: firebaseToDomainErrorMapper(error))
                }

                guard let result else {return continuation.resume(throwing: SetDomainError(code: .unknownError("Sign Up Firebase Result null")))}

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
                if let _ = error as? NSError { return continuation.resume(returning: nil) }
                
                guard let result else { return continuation.resume(returning: nil) }
                
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
