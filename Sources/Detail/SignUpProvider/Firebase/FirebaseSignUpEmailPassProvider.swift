//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

import AuthUseCaseGateway
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
    
    
    public func signUp() async throws -> UserAuthInfoGatewayDTO? {
        
        let _: Void = try await withCheckedThrowingContinuation { continuation in
            
            auth.createUser(withEmail: email, password: pass) { [weak self] result, error in
                
                guard let self else {return continuation.resume(throwing: SignInError(code: .errorAuthentication))}
                
                if let error = error as? NSError {
                    return continuation.resume(throwing: SignInError(code: .errorAuthentication))
                }
                
            }
            
        }
        
        return try await linkAnonymousToEmailAuthProviderIfNeeded(email: email, password: pass)

    }
    
  
    
    
    
//  MARK: - PRIVATE AREA
    
    private func linkAnonymousToEmailAuthProviderIfNeeded(email: String, password: String) async throws -> UserAuthInfoGatewayDTO? {
        
        guard let user = auth.currentUser else { return nil }
        
        if user.isAnonymous {
            
            let credential = EmailAuthProvider.credential(withEmail: email, password: password)
                        
            return try await withCheckedThrowingContinuation { continuation in
                
                user.link(with: credential) { [weak self] result, error in
                    guard let self else {return}
                    
                    if let error = error as? NSError {
                        return
                    }
                    
                    continuation.resume(returning: UserAuthInfoGatewayDTO(userID: user.uid, isAnonymous: false))
                        
                }

            }
            
        }
        
        return UserAuthInfoGatewayDTO(userID: user.uid)
        
    }
    
    
}
