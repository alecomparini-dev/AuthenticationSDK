//  Created by Alessandro Comparini on 08/07/24.
//


public class SignInEmailPassUseCaseImpl: SignInEmailPassUseCase {
    
    private let signInGateway: SignInEmailPassUseCaseGateway
    private let signInValidation: SignInValidation?
       
    public init(signInGateway: SignInEmailPassUseCaseGateway, signInValidation: SignInValidation? = nil) {
        self.signInGateway = signInGateway
        self.signInValidation = signInValidation
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signIn(email: String, pass: String) async throws -> UserAuthInfoUseCaseDTO {
        
        let userAuth = try await signInGateway.signIn(email: email, pass: pass)
        
        try signInValidation?.validate(userAuthInfo: userAuth)
        
        return userAuth
    }
    
}
