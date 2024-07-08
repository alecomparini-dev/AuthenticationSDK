//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

public protocol AuthenticationAnonymousProvider {
    typealias UserId = String
    func signInAnonymously() async throws -> UserId?
}
