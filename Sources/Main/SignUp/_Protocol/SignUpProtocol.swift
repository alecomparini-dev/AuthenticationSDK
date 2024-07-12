//  Created by Alessandro Comparini on 12/07/24.
//

import AuthenticationSDKController

protocol SignUpProtocol {
    func signUp() async throws -> UserAuthInfoControllerDTO
}
