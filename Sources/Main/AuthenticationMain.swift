//  Created by Alessandro Comparini on 17/11/23.
//

import AuthenticationSDKSingInProvider

public class AuthenticationMain {
    
    public private(set) var signIn: SignInManager
    
    public init() {
        self.signIn = SignInManager()
    }
    
}


