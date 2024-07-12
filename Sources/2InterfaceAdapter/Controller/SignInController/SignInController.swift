//  Created by Alessandro Comparini on 08/07/24.
//

public protocol SignInController {
    func signIn() async throws -> UserAuthInfoControllerDTO
}
