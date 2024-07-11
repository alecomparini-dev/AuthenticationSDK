//  Created by Alessandro Comparini on 08/07/24.
//

import AuthenticationSDKDomain

public class SignInControllerImpl: SignInController {
    
    private let signInUseCase: SignInUseCase
    
    public init(signInUseCase: SignInUseCase) {
        self.signInUseCase = signInUseCase
    }
    
    
    public func signIn() async throws -> UserAuthInfoControllerDTO {
        
        let userAuthInfoUseCaseDTO = try await signInUseCase.signIn()
        
        let userAuthControllerDTO = UserAuthInfoControllerDTO(userID: userAuthInfoUseCaseDTO.userID)
        
        return userAuthControllerDTO
    }
    
    
}
