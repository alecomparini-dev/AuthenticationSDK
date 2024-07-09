
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation


public protocol SignUpProvider {
    func signUp() async throws -> UserAuthInfoGatewayDTO?
}
