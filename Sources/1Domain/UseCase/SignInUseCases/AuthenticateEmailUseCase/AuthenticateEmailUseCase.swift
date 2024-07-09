//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation


public protocol AuthenticateEmailUseCase {
    typealias UserId = String
    func signIn(email: String, password: String) async throws -> UserId
}
