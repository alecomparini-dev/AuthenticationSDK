
//  Created by Alessandro Comparini on 08/07/24.
//

import AuthDomain

public protocol SignInProvider {
    func signIn() async throws -> UserAuthInfoGatewayDTO
}
