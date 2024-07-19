//  Created by Alessandro Comparini on 18/10/23.
//

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public class FirebaseUserAuthenticatedInfo: UserAuthenticatedInfoProvider {
    
    private let auth: Auth
    
    public init(auth: Auth = .auth()) {
        self.auth = auth
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func get(_ reload: Bool = false) async -> UserAuthInfoGatewayDTO? {
        
        guard let currentUser = auth.currentUser else { return nil }
        
        do {
            try await reloadCurrentUser(reload)
        } catch {
            return nil
        }
        
        return UserAuthInfoGatewayDTO (
            userID: currentUser.uid,
            email: currentUser.email,
            isAnonymous: currentUser.isAnonymous,
            isEmailVerified: currentUser.isEmailVerified,
            phoneNumber: currentUser.phoneNumber,
            displayName: currentUser.displayName,
            photoURL: currentUser.photoURL?.description
        )
        
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func reloadCurrentUser(_ reload: Bool) async throws {
        if reload {
            try await auth.currentUser?.reload()
        }
    }
    
}
