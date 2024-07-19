//  Created by Alessandro Comparini on 17/07/24.
//

import AuthenticationSDKController

protocol UserAuthenticatedProtocol {
    func get(_ refresh: Bool) async -> UserAuthInfoControllerDTO?
}

