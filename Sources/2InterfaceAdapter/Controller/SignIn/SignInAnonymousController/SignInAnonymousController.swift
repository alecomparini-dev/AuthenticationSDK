//  Created by Alessandro Comparini on 15/07/24.
//

public protocol SignInAnonymousController {
    func signIn() async throws -> UserAuthInfoControllerDTO
}
