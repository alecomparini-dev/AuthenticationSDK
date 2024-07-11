
//  Created by Alessandro Comparini on 08/07/24.
//

import AuthenticationSDKController

protocol SignInProtocol {
    func signIn() async throws -> UserAuthInfoControllerDTO
}
