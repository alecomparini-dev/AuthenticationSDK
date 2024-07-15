//  Created by Alessandro Comparini on 15/07/24.
//


public class SignInAnonymousUseCaseImpl: SignInAnonymousUseCase {
    
    private let signInGateway: SignInAnonymousUseCaseGateway
    private let signInValidation: SignInValidation?
       
    public init(signInGateway: SignInAnonymousUseCaseGateway, signInValidation: SignInValidation? = nil) {
        self.signInGateway = signInGateway
        self.signInValidation = signInValidation
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signIn() async throws -> UserAuthInfoUseCaseDTO {
        
        let userAuth = try await signInGateway.signIn()
        
        try signInValidation?.validate(userAuthInfo: userAuth)
        
        return userAuth
    }
    
}
