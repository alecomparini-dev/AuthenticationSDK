//  Created by Alessandro Comparini on 15/09/23.
//

public protocol SignUpUseCase {
    func signUp(email: String, pass: String) async throws -> UserAuthInfoUseCaseDTO
}
