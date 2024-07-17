//  Created by Alessandro Comparini on 18/10/23.
//

import Foundation

public class UserAuthenticatedUseCaseImpl: UserAuthenticatedUseCase {

    private let userAuthenticatedGateway: UserAuthenticatedUseCaseGateway
    
    public init(userAuthenticatedGateway: UserAuthenticatedUseCaseGateway) {
        self.userAuthenticatedGateway = userAuthenticatedGateway
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func getUser() async -> UserAuthInfoUseCaseDTO? {
        return await userAuthenticatedGateway.getUser()
    }

    
}
