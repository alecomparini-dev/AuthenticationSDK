//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

import AuthUseCaseGateway
import FirebaseAuth

public class FirebaseAuthAnonymousProvider: AuthenticationAnonymousProvider {
    
    private let auth: Auth
    
    public init(auth: Auth = .auth()) {
        self.auth = auth
    }
    
    public func signInAnonymously() async throws -> UserId? {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            auth.signInAnonymously() { result , error  in
                
                if error != nil {
                    continuation.resume(throwing: AuthenticationError(code: .errorAuthentication))
                    return
                }
                
                continuation.resume(returning: result?.user.uid)
            }
        }
    }
    
    
}
