//  Created by Alessandro Comparini on 17/11/23.
//

import Foundation

public protocol UserAuthenticatedController {
    func getUser(_ refresh: Bool) async -> UserAuthInfoControllerDTO?
}
