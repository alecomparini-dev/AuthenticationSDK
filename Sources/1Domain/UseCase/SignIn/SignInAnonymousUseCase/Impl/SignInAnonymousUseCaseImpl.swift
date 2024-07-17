//  Created by Alessandro Comparini on 15/07/24.
//


public class SignInAnonymousUseCaseImpl: SignInAnonymousUseCase {
    
    private let userAuth: UserAuthenticatedUseCase
    private let signInGateway: SignInAnonymousUseCaseGateway
    private let signInValidation: SignInValidation?
       
    public init(userAuth: UserAuthenticatedUseCase, signInGateway: SignInAnonymousUseCaseGateway, signInValidation: SignInValidation?) {
        self.userAuth = userAuth
        self.signInGateway = signInGateway
        self.signInValidation = signInValidation
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signIn() async throws -> UserAuthInfoUseCaseDTO {
        
        if let currentUser: UserAuthInfoUseCaseDTO = await userAuth.getUser() {
            return currentUser
        }
        
        let userAuth = try await signInGateway.signIn()
        
        try signInValidation?.validate(userAuthInfo: userAuth)
        
        return userAuth
    }
    
}
