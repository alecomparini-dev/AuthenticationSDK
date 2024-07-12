//  Created by Alessandro Comparini on 12/07/24.
//

public protocol SignUpController {
    func signUp() async throws -> UserAuthInfoControllerDTO
}
