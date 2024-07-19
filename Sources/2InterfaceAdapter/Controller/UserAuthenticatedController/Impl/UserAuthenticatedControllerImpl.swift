//  Created by Alessandro Comparini on 17/11/23.
//

import AuthenticationSDKDomain

public class UserAuthenticatedControllerImpl: UserAuthenticatedController {
    
    private let userAuthUseCase: UserAuthenticatedUseCase
    
    public init(userAuthUseCase: UserAuthenticatedUseCase) {
        self.userAuthUseCase = userAuthUseCase
    }
    

//  MARK: - PUBLIC AREA
    
    public func getUser(_ reload: Bool = false) async -> UserAuthInfoControllerDTO? {
        let userAuthUseCase = await userAuthUseCase.getUser(reload)
        
        guard let userID = userAuthUseCase?.userID else { return nil }
        
        return UserAuthInfoControllerDTO(userID: userID,
                                         email: userAuthUseCase?.email,
                                         phoneNumber: userAuthUseCase?.phoneNumber,
                                         isEmailVerified: userAuthUseCase?.isEmailVerified,
                                         isAnonymous: userAuthUseCase?.isAnonymous,
                                         displayName: userAuthUseCase?.displayName,
                                         photoURL: userAuthUseCase?.photoURL)
    }

}
