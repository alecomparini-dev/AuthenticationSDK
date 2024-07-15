//  Created by Alessandro Comparini on 12/07/24.
//

import AuthenticationSDKDomain

public class SignUpControllerImpl: SignUpController {
    
    private let signUpUseCase: SignUpUseCase
    
    public init(signUpUseCase: SignUpUseCase) {
        self.signUpUseCase = signUpUseCase
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signUp(email: String, pass: String) async throws -> UserAuthInfoControllerDTO {
        
        let userAuthInfoUseCaseDTO = try await signUpUseCase.signUp(email: email, pass: pass)
        
        let userAuthControllerDTO = UserAuthInfoControllerDTO(userID: userAuthInfoUseCaseDTO.userID,
                                                              email: userAuthInfoUseCaseDTO.email,
                                                              displayName: userAuthInfoUseCaseDTO.displayName,
                                                              photoURL: userAuthInfoUseCaseDTO.photoURL)
        return userAuthControllerDTO
    }
    
}
