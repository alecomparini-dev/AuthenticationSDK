//  Created by Alessandro Comparini on 31/10/23.
//

import Foundation

public protocol ResetPasswordUseCaseGateway {
    func reset(_ email: String) async -> Bool
}
