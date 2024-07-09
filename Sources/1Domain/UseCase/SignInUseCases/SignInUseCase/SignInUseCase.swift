//  Created by Alessandro Comparini on 08/07/24.
//

public protocol SignInUseCase {
    func signIn() async throws -> UserAuthInfoUseCaseDTO
}

