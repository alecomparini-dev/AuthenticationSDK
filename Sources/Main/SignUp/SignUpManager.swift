//  Created by Alessandro Comparini on 12/07/24.
//

import AuthenticationSDKDomain
import AuthenticationSDKController
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKSignUpProvider

public class SignUpManager {
        
    public func emailPass(email: String, password: String) async throws -> UserAuthInfoControllerDTO {
        let signUp = SignUpEmailPass(signUpEmailPassProvider: FirebaseSignUpEmailPassProvider(email: email, pass: password))
        return try await getResultSignUp(signUp: signUp)
    }
    
    public func emailPass(_ provider: SignUpProvider) async throws -> UserAuthInfoControllerDTO {
        let signUp = SignUpEmailPass(signUpEmailPassProvider: provider)
        return try await getResultSignUp(signUp: signUp)
    }
    

//  MARK: - PRIVATE AREA
    
    func getResultSignUp(signUp: SignUpProtocol) async throws -> UserAuthInfoControllerDTO {
        do {
            return try await signUp.signUp()
        } catch SignInDomainError.passwordInvalid,
                    SignInDomainError.emailInvalid,
                    SignInDomainError.userOrPasswordInvalid {
            throw SignInError.userOrPasswordInvalid
        } catch {
            throw SignInError.errorSignIn
        }
    }
    
}
