//  Created by Alessandro Comparini on 15/09/23.
//


public class SignUpUseCaseImpl: SignUpUseCase {
    
    private let signUpGateway: SignUpUseCaseGateway
    
    public init(signUpGateway: SignUpUseCaseGateway) {
        self.signUpGateway = signUpGateway
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signUp() async throws -> UserAuthInfoUseCaseDTO {
        return try await signUpGateway.signUp()
    }
    
}