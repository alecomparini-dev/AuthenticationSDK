//  Created by Alessandro Comparini on 18/10/23.
//

import Foundation

public class GetUserAuthenticatedUseCaseImpl: GetUserAuthenticatedUseCase {

    private let getUserAuthenticatedGateway: GetUserAuthenticatedUseCaseGateway
    
    public init(getUserAuthenticatedGateway: GetUserAuthenticatedUseCaseGateway) {
        self.getUserAuthenticatedGateway = getUserAuthenticatedGateway
    }
    
    public func getUser() async throws -> UserAuthInfoUseCaseDTO {
        
        let userAuth: UserAuthInfoUseCaseDTO = try getUserAuthenticatedGateway.getUser()
        
        return UserAuthInfoUseCaseDTO(userID: userAuth.userID )
    }

    
}
