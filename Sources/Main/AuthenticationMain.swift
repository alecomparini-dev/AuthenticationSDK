//  Created by Alessandro Comparini on 17/11/23.
//

import AuthDomain
import AuthController
import AuthSignIn
import AuthUseCaseGateway




public class SignInManager {
        
    public func anonymous(_ provider: SignInProvider? = nil) async throws -> UserAuthInfoControllerDTO? {
        let signIn = SignInAnonymous(signInAnonymousProvider: provider ?? FirebaseSignInAnonymous())
        return try await signIn.signIn()
    }
    
    public func credentials(email: String, password: String) async throws -> UserAuthInfoControllerDTO? {
        let signIn = SignInEmailPass(signInEmailPassProvider: FirebaseSignInAnonymous())
        return try await signIn.signIn()
    }
    
    public func credentials(_ provider: SignInProvider) async throws -> UserAuthInfoControllerDTO? {
        let signIn = SignInEmailPass(signInEmailPassProvider: provider)
        return try await signIn.signIn()
    }
    
    
    
    
    public func appleID() -> UserAuthInfoControllerDTO? {
        return nil
    }
    
    public func googleID() -> UserAuthInfoControllerDTO? {
        return nil
    }
    
}







public class AuthenticationMain {
    
    public private(set) var signIn: SignInManager
    
    
    public init() {
        self.signIn = SignInManager()
    }
    
    
    
}


