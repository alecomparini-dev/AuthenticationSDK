//  Created by Alessandro Comparini on 15/07/24.
//


public protocol SignInAnonymousProvider {
    func signIn() async throws -> UserAuthInfoGatewayDTO
}
