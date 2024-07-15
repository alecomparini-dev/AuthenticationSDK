//  Created by Alessandro Comparini on 15/07/24.
//

public protocol SignInAnonymousUseCaseGateway {
    func signIn() async throws -> UserAuthInfoUseCaseDTO
}
