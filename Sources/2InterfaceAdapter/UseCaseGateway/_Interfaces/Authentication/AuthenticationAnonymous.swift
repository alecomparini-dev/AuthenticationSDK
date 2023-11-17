//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

public protocol AuthenticationAnonymous {
    func signInAnonymously() async throws -> String
}
