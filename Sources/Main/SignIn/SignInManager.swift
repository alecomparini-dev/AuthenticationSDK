//  Created by Alessandro Comparini on 09/07/24.
//


import AuthenticationSDKController
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKSingInProvider

public class SignInManager {
        
    public func anonymous(_ provider: SignInProvider? = nil) async throws -> UserAuthInfoControllerDTO {
        let signIn = SignInAnonymous(signInAnonymousProvider: provider ?? FirebaseSignInAnonymous())
        return try await signIn.signIn()
    }
    
    public func emailPass(email: String, password: String) async throws -> UserAuthInfoControllerDTO {
        let signIn = SignInEmailPass(signInEmailPassProvider: FirebaseSignInEmailPass(email: email, pass: password))
        return try await signIn.signIn()
    }
    
    public func emailPass(_ provider: SignInProvider) async throws -> UserAuthInfoControllerDTO {
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
