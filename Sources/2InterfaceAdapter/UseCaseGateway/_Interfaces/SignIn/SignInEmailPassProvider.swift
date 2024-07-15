//  Created by Alessandro Comparini on 08/07/24.
//

public protocol SignInEmailPassProvider {
    func signIn(email: String, pass: String) async throws -> UserAuthInfoGatewayDTO
}
