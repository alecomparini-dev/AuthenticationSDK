
//  Created by Alessandro Comparini on 08/07/24.
//

import AuthController

protocol SignInProtocol {
    func signIn() async throws -> UserAuthInfoControllerDTO?
}
