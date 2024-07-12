//  Created by Alessandro Comparini on 17/11/23.
//

public class AuthenticationSDKMain {
    
    private var _signIn: SignInManager?
    private var _signUp: SignUpManager?
    
    public init() { }
    
    
//  MARK: - GET PROPERTIES
    
    var signIn: SignInManager { SignInManager() }
    
    var signUp: SignUpManager { SignUpManager() }
    
}


