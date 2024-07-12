//  Created by Alessandro Comparini on 08/07/24.
//

public protocol SignInProvider {
    func signIn() async throws -> UserAuthInfoGatewayDTO
}
