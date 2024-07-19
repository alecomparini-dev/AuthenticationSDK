//  Created by Alessandro Comparini on 18/10/23.
//

import Foundation

public protocol UserAuthenticatedUseCase {
    func getUser(_ refresh: Bool) async -> UserAuthInfoUseCaseDTO?
}
