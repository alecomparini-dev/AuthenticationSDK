//  Created by Alessandro Comparini on 09/07/24.
//

import AuthenticationSDKDomain
import AuthenticationSDKController
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKProviders

public class SignInManager {
        
    public func anonymous(_ provider: SignInAnonymousProvider? = nil) async throws -> UserAuthInfoControllerDTO {
        let signIn = SignInAnonymous(signInAnonymousProvider: provider ?? FirebaseSignInAnonymous())
        return try await getResultSignIn(signIn: signIn)
    }
    
    public func emailPass(email: String, password: String, _ provider: SignInEmailPassProvider = FirebaseSignInEmailPass()) async throws -> UserAuthInfoControllerDTO {
        let signIn = SignInEmailPass(email: email, pass: password, signInEmailPassProvider: provider)
        return try await getResultSignIn(signIn: signIn)
    }
    
    public func appleID() -> UserAuthInfoControllerDTO? {
        return nil
    }
    
    public func googleID() -> UserAuthInfoControllerDTO? {
        return nil
    }
    
    
//  MARK: - PRIVATE AREA
    
    func getResultSignIn(signIn: SignInProtocol) async throws -> UserAuthInfoControllerDTO {
        do {
            return try await signIn.signIn()
            
        } catch DomainError.emailOrPassInvalid,
                    DomainError.invalidEmail {
            
            throw SignInAuthenticationSDKError.emailOrPassInvalid
        
        } catch DomainError.unverifiedEmail {
            throw SignInAuthenticationSDKError.unverifiedEmail
            
        } catch let error {
            throw SignInAuthenticationSDKError.unknownError(error.localizedDescription)
        }
    }
    
}
