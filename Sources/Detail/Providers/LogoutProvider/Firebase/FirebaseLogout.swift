//  Created by Alessandro Comparini on 01/11/23.
//

import AuthenticationSDKUseCaseGateway
import Foundation
import FirebaseAuth

public class FirebaseLogout: LogoutProvider {
    
    private let auth: Auth
    
    public init(auth: Auth = .auth()) {
        self.auth = auth
    }
    
    public func logout() throws {
        try auth.signOut()
    }
    
    
}
