//  Created by Alessandro Comparini on 14/09/23.
//

public protocol SignUpProvider {
    func signUp(email: String, pass: String) async throws -> UserAuthInfoGatewayDTO
}
