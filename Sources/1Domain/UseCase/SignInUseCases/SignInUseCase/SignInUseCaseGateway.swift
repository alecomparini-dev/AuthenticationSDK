//  Created by Alessandro Comparini on 08/07/24.
//

public protocol SignInUseCaseGateway {
    func signIn() async throws -> UserAuthInfoUseCaseDTO
}

