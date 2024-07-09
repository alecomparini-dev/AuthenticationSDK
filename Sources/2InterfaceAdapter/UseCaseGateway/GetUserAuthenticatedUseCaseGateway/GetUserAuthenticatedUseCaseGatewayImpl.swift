//  Created by Alessandro Comparini on 18/10/23.
//

import Foundation

import AuthDomain

public class GetUserAuthenticatedUseCaseGatewayImpl: GetUserAuthenticatedUseCaseGateway {
    
    private let userAuthenticator: UserAuthInfo
    
    public init(userAuthenticator: UserAuthInfo) {
        self.userAuthenticator = userAuthenticator
    }
    
    public func getUser() throws -> UserAuthInfoUseCaseDTO {
        
        let userAuth: UserAuthInfoGatewayDTO = try userAuthenticator.getInfo()
               
        return UserAuthInfoUseCaseDTO(userID: userAuth.userID)
    }
    
    
}
