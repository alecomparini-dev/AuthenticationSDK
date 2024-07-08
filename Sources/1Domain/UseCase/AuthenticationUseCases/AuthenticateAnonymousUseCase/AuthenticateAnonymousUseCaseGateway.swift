//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

public protocol AuthenticateAnonymousUseCaseGateway {
    typealias UserId = String
    func signInAnonymously() async throws -> UserId?
}
