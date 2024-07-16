//  Created by Alessandro Comparini on 12/07/24.
//

import AuthenticationSDKDomain
import AuthenticationSDKController
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKProviders

public class SignUpManager {
        
    public func emailPass(email: String, password: String) async throws -> UserAuthInfoControllerDTO {
        let signUp = SignUpEmailPass(signUpEmailPassProvider: FirebaseSignUpEmailPassProvider())
        return try await getResultSignUp(signUp: signUp, email: email, pass: password)
    }
    
    public func emailPass(email: String, password: String, provider: SignUpProvider) async throws -> UserAuthInfoControllerDTO {
        let signUp = SignUpEmailPass(signUpEmailPassProvider: provider)
        return try await getResultSignUp(signUp: signUp, email: email, pass: password)
    }
    

//  MARK: - PRIVATE AREA
    
    func getResultSignUp(signUp: SignUpEmailPassProtocol, email: String, pass: String) async throws -> UserAuthInfoControllerDTO {
        
        do {
            return try await signUp.signUp(email: email, pass: pass)
        
        } catch let error {
            
            if let error = error as? DomainError {
                switch error {
                    case .invalidEmail:
                        throw SignUpAuthenticationSDKError.invalidEmail
                    
                    case .weakPassword:
                        throw SignUpAuthenticationSDKError.weakPassword
                    
                    case .emailAlreadyInUse:
                        throw SignUpAuthenticationSDKError.emailAlreadyInUse
                    
                    default:
                        break
                }
            }
            
            throw SignUpAuthenticationSDKError.unknownError(error.localizedDescription)
            
        }
            
    }
    
}
