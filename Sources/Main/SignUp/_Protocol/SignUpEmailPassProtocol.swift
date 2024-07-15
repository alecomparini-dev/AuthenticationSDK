//  Created by Alessandro Comparini on 12/07/24.
//

import AuthenticationSDKController

protocol SignUpEmailPassProtocol {
    func signUp(email: String, pass: String) async throws -> UserAuthInfoControllerDTO
}
