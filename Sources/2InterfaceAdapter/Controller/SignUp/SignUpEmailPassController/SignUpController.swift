//  Created by Alessandro Comparini on 12/07/24.
//

public protocol SignUpController {
    func signUp(email: String, pass: String) async throws -> UserAuthInfoControllerDTO
}
