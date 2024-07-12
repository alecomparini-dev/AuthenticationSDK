//  Created by Alessandro Comparini on 15/09/23.
//

public protocol SignUpUseCaseGateway {
    func signUp() async throws -> UserAuthInfoUseCaseDTO
}
