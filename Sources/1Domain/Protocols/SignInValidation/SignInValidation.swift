//  Created by Alessandro Comparini on 09/07/24.
//

import Foundation

public protocol SignInValidation {
    func validate(userAuthInfo: UserAuthInfoUseCaseDTO) throws
}
