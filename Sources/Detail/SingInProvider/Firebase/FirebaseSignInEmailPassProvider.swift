//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

import AuthDomain
import AuthUseCaseGateway
import FirebaseAuth

public class FirebaseSignInEmailPass: SignInProvider {

    private let auth: Auth
    private let email: String
    private let pass: String
    
    public init(email: String, pass: String, _ auth: Auth = .auth()) {
        self.email = email
        self.pass = pass
        self.auth = auth
    }
    
    
    public func signIn() async throws -> UserAuthInfoGatewayDTO {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            auth.signIn(withEmail: email, password: pass) { [weak self] result, error in
                
                guard let self else {return}
                
                if let error = error as? NSError {
                    return continuation.resume(throwing: makeAuthenticationError(error))
                }
                
                guard let userID = result?.user.uid else { return continuation.resume(throwing: SignInError(code: .userOrPasswordInvalid)) }
                
                continuation.resume(returning: UserAuthInfoGatewayDTO(userID: userID, 
                                                                      email: result?.user.email,
                                                                      isAnonymous: result?.user.isAnonymous,
                                                                      isEmailVerified: result?.user.isEmailVerified
                                                                     )
                )
            }
            
        }
        
    }

    
    
//  MARK: - PRIVATE AREA
        
    private func makeAuthenticationError(_ error: NSError) -> SignInError {
        switch error.code {
            case 17026:
                return SignInError(code: .passwordInvalid)
            
            case 17008, 17034:
                return SignInError(code: .emailInvalid)
            
            case 17007:
                return SignInError(code: .emailAlready)
            
            default:
                return SignInError(code: .userOrPasswordInvalid)
        }
    
    }
}
