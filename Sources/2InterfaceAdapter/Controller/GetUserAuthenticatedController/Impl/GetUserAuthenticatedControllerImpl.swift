//  Created by Alessandro Comparini on 17/11/23.
//

import AuthenticationSDKDomain

public class GetUserAuthenticatedControllerImpl: GetUserAuthenticatedController {
    
    private let getUserAuthUseCase: GetUserAuthenticatedUseCase
    
    public init(getUserAuthUseCase: GetUserAuthenticatedUseCase) {
        self.getUserAuthUseCase = getUserAuthUseCase
    }
    
    
    public func getUserAuth() async throws -> String? {
        let outputDTO = try await getUserAuthUseCase.getUser()
        return outputDTO.userID
    }

}
