//  Created by Alessandro Comparini on 08/07/24.
//


public class SignInUseCaseImpl: SignInUseCase {
    
    
    private let signInGateway: SignInUseCaseGateway
    
    public init(signInGateway: SignInUseCaseGateway) {
        self.signInGateway = signInGateway
    }
    
    
    public func signIn() async throws -> UserAuthInfoUseCaseDTO {
        return try await signInGateway.signIn()
    }
    
}
