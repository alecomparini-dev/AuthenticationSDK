//  Created by Alessandro Comparini on 18/10/23.
//

import AuthenticationSDKDomain

public class UserAuthenticatedUseCaseGatewayImpl: UserAuthenticatedUseCaseGateway {
    
    private let userAuthenticated: UserAuthenticatedInfoProvider
    
    public init(userAuthenticated: UserAuthenticatedInfoProvider) {
        self.userAuthenticated = userAuthenticated
    }
    
    
    //  MARK: - PUBLIC AREA
    
    public func getUser(_ refresh: Bool = false) async -> UserAuthInfoUseCaseDTO? {
        
        let userAuth: UserAuthInfoGatewayDTO? = await userAuthenticated.get(refresh)
        
        guard let userID = userAuth?.userID else { return nil }
        
        return UserAuthInfoUseCaseDTO(userID: userID,
                                      email: userAuth?.email,
                                      isAnonymous: userAuth?.isAnonymous,
                                      isEmailVerified: userAuth?.isEmailVerified,
                                      phoneNumber: userAuth?.phoneNumber,
                                      displayName: userAuth?.displayName,
                                      photoURL: userAuth?.photoURL)
    }
    
}
