//  Created by Alessandro Comparini on 08/07/24.
//

import AuthenticationSDKDomain

public class SignInEmailPassControllerImpl: SignInEmailPassController {
    
    private let signInUseCase: SignInEmailPassUseCase
    
    public init(signInUseCase: SignInEmailPassUseCase) {
        self.signInUseCase = signInUseCase
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signIn(email: String, pass: String) async throws -> UserAuthInfoControllerDTO {
        
        let userAuthInfoUseCaseDTO = try await signInUseCase.signIn(email: email, pass: pass)
        
        return UserAuthInfoControllerDTO(userID: userAuthInfoUseCaseDTO.userID,
                                         email: userAuthInfoUseCaseDTO.email,
                                         displayName: userAuthInfoUseCaseDTO.displayName,
                                         photoURL: userAuthInfoUseCaseDTO.photoURL)
    }
    
    
}
