//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

public protocol GetUserAuthenticatedController {
    func getUserAuth() async throws -> String?
}
