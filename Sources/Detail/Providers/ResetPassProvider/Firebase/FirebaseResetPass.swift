//  Created by Alessandro Comparini on 18/10/23.
//

import Foundation

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public class FirebaseResetPass: ResetPasswordProvider {
    private let auth: Auth
    
    public init(auth: Auth = .auth()) {
        self.auth = auth
    }

    public func reset(_ email: String) async -> Bool {
        
        return await withCheckedContinuation { continuation in
            
            auth.sendPasswordReset(withEmail: email) { error in
                if error != nil {
                    return continuation.resume(returning: false)
                }
                
                continuation.resume(returning: true)
            }
        }
    }
    
    
}
