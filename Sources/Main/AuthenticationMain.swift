//  Created by Alessandro Comparini on 17/11/23.
//

import AuthenticationSDKController


public class AuthenticationSDKMain {
    private var _signIn: SignInManager?
    private var _signUp: SignUpManager?
    private var _user: UserAuthenticated?
    
    public init() { }
    
    
//  MARK: - GET PROPERTIES
    
    public var signIn: SignInManager { SignInManager() }
    
    public var signUp: SignUpManager { SignUpManager() }
    
    public var userAuth: UserAuthenticated? { UserAuthenticated() }
    
    
}


