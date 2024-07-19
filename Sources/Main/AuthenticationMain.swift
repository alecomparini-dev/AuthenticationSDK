//  Created by Alessandro Comparini on 17/11/23.
//

import AuthenticationSDKController


public class AuthenticationSDKMain {
    
    public init() { }
    
    
//  MARK: - GET PROPERTIES
    
    public var signIn: SignInManager { SignInManager() }
    
    public var signUp: SignUpManager { SignUpManager() }
    
    public var userAuth: UserAuthenticatedManager { UserAuthenticatedManager() }
    
}

