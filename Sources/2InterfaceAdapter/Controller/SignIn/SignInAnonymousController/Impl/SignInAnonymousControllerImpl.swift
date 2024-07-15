//  Created by Alessandro Comparini on 15/07/24.
//

import AuthenticationSDKDomain

public class SignInAnonymousControllerImpl: SignInAnonymousController {
    
    private let signInUseCase: SignInAnonymousUseCase
    
    public init(signInUseCase: SignInAnonymousUseCase) {
        self.signInUseCase = signInUseCase
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signIn() async throws -> UserAuthInfoControllerDTO {
        
        let userAuthInfoUseCaseDTO = try await signInUseCase.signIn()
        
        return UserAuthInfoControllerDTO(userID: userAuthInfoUseCaseDTO.userID,
                                         email: userAuthInfoUseCaseDTO.email,
                                         displayName: userAuthInfoUseCaseDTO.displayName,
                                         photoURL: userAuthInfoUseCaseDTO.photoURL)
    }
    
    
}
