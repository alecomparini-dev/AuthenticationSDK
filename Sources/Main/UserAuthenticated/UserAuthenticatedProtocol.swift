//  Created by Alessandro Comparini on 17/07/24.
//

import AuthenticationSDKController

protocol UserAuthenticatedProtocol {
    func get() async -> UserAuthInfoControllerDTO?
}
