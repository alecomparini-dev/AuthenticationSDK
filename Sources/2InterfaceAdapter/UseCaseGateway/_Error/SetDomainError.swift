//  Created by Alessandro Comparini on 15/09/23.
//

import AuthenticationSDKDomain

public struct SetDomainError: Error {
        
    public let code: DomainError
    
    public init(code: DomainError) {
        self.code = code
    }
    
    public var error: DomainError { code }
    
}
