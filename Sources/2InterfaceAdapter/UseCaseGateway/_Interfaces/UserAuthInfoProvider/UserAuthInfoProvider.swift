//  Created by Alessandro Comparini on 18/10/23.
//

import Foundation

public protocol UserAuthenticatedInfoProvider {
    func get(_ reload: Bool) async -> UserAuthInfoGatewayDTO?
}
