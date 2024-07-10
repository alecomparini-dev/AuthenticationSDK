//  Created by Alessandro Comparini on 08/07/24.
//


public class SignInUseCaseImpl: SignInUseCase {
    
    private let signInGateway: SignInUseCaseGateway
    private let signInValidation: SignInValidation?
    
    
    public init(signInGateway: SignInUseCaseGateway, signInValidation: SignInValidation? = nil) {
        self.signInGateway = signInGateway
        self.signInValidation = signInValidation
    }
    
    
    public func signIn() async throws -> UserAuthInfoUseCaseDTO {
        
        let userAuth = try await signInGateway.signIn()
        
        try signInValidation?.validate(userAuthInfo: userAuth)
        
        return userAuth
    }
    
    
}
