//  Created by Alessandro Comparini on 08/07/24.
//

public protocol SignInEmailPassUseCase {
    func signIn(email: String, pass: String) async throws -> UserAuthInfoUseCaseDTO
}
