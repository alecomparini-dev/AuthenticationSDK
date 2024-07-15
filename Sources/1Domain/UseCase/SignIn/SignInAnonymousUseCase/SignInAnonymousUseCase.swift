//  Created by Alessandro Comparini on 15/07/24.
//

public protocol SignInAnonymousUseCase {
    func signIn() async throws -> UserAuthInfoUseCaseDTO
}
