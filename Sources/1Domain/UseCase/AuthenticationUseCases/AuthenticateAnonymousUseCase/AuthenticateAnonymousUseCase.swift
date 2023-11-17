//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

public protocol AuthenticateAnonymousUseCase {
    typealias UserId = String
    func signIn() async throws -> UserId?
}
