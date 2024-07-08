//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation


public protocol AuthenticateEmailUseCaseGateway {
    typealias UserId = String
    func signInEmail(email: String, password: String) async throws -> UserId
}
